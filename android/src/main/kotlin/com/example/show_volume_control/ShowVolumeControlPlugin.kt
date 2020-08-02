package com.example.show_volume_control

import android.content.Context
import android.content.Context.AUDIO_SERVICE
import android.media.AudioManager
import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

/** ShowVolumeControlPlugin */
public class ShowVolumeControlPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var applicationContext : Context
  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "show_volume_control")
    channel.setMethodCallHandler(this);
    this.applicationContext = flutterPluginBinding.applicationContext;
  }

  // This static function is optional and equivalent to onAttachedToEngine. It supports the old
  // pre-Flutter-1.12 Android projects. You are encouraged to continue supporting
  // plugin registration via this function while apps migrate to use the new Android APIs
  // post-flutter-1.12 via https://flutter.dev/go/android-project-migration.
  //
  // It is encouraged to share logic between onAttachedToEngine and registerWith to keep
  // them functionally equivalent. Only one of onAttachedToEngine or registerWith will be called
  // depending on the user's project. onAttachedToEngine or registerWith must both be defined
  // in the same class.
  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "show_volume_control")
      channel.setMethodCallHandler(ShowVolumeControlPlugin())
    }
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "show") {
      showVolumeControl()
      result.success(null)
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }



  private fun showVolumeControl(){
    val audioManager: AudioManager = applicationContext.getSystemService(AUDIO_SERVICE) as AudioManager
    val currentVolume = audioManager.mediaCurrentVolume
    audioManager.setMediaVolume(currentVolume)
  }
}

// Extension property to get media/music current volume index
val AudioManager.mediaCurrentVolume:Int
  get() = this.getStreamVolume(AudioManager.STREAM_MUSIC)


// Extension function to change media volume programmatically
fun AudioManager.setMediaVolume(volumeIndex:Int) {
  // Set media volume level
  this.setStreamVolume(
          AudioManager.STREAM_MUSIC, // Stream type
          volumeIndex, // Volume index
          AudioManager.FLAG_SHOW_UI// Flags
  )
}
