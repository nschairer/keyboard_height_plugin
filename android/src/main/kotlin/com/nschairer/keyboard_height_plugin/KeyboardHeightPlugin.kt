package com.nschairer.keyboard_height_plugin
import android.graphics.Rect
import android.os.Build
import androidx.annotation.NonNull
import android.view.ViewTreeObserver
import androidx.annotation.RequiresApi
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.EventChannel
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat

class KeyboardHeightPlugin : FlutterPlugin, EventChannel.StreamHandler, ActivityAware {
    private val keyboardHeightEventChannelName = "keyboardHeightEventChannel"
    private var eventSink: EventChannel.EventSink? = null
    private var eventChannel: EventChannel? = null
    private var activityPluginBinding: ActivityPluginBinding? = null

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        eventChannel = EventChannel(flutterPluginBinding.binaryMessenger, keyboardHeightEventChannelName)
        eventChannel?.setStreamHandler(this)
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        eventChannel?.setStreamHandler(null)
    }

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        eventSink = events
        val rootView = activityPluginBinding?.activity?.window?.decorView?.rootView
        rootView?.viewTreeObserver?.addOnGlobalLayoutListener(object : ViewTreeObserver.OnGlobalLayoutListener {
            override fun onGlobalLayout() {
                val r = Rect()
                rootView.getWindowVisibleDisplayFrame(r)

                val screenHeight = rootView.height
                val insets = ViewCompat.getRootWindowInsets(rootView)
                val navigationBarHeight = insets?.getInsets(WindowInsetsCompat.Type.navigationBars())?.bottom ?: 0;
                val isNavigationBarVisible = insets?.isVisible(WindowInsetsCompat.Type.navigationBars()) ?: false
                
                var keypadHeight = screenHeight - r.bottom
                
                if (isNavigationBarVisible) {
                    keypadHeight -= navigationBarHeight
                }

                val displayMetrics = activityPluginBinding?.activity?.resources?.displayMetrics
                val logicalKeypadHeight = keypadHeight / (displayMetrics?.density ?: 1f)

                if (keypadHeight > screenHeight * 0.02) {
                    events?.success(logicalKeypadHeight.toDouble())
                } else {
                    events?.success(0.0)
                }
            }
        })
    }

    override fun onCancel(arguments: Any?) {
        eventSink = null
    }

    // Implement ActivityAware methods
    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activityPluginBinding = binding
    }

    override fun onDetachedFromActivityForConfigChanges() {
        activityPluginBinding = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activityPluginBinding = binding
    }

    override fun onDetachedFromActivity() {
        activityPluginBinding = null
    }
}
