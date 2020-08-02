import Flutter
import UIKit
import MediaPlayer
import AVKit
public class SwiftShowVolumeControlPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "show_volume_control", binaryMessenger: registrar.messenger())
        let instance = SwiftShowVolumeControlPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if (call.method == "show") {
            showVolumeControl()
            result(nil)
        } else {
            result(FlutterMethodNotImplemented)
        }
    }
    
    
    private func showVolumeControl(){
        // get current level:
        let  audioSession = AVAudioSession.sharedInstance()
        let currentVolume : Float = audioSession.outputVolume
        
        MPVolumeView.setVolume(currentVolume+0.1)
        
    }
}

extension MPVolumeView {
    static func setVolume(_ volume: Float) {
        let volumeView = MPVolumeView()
        
        
        let slider = volumeView.subviews.first(where: { $0 is UISlider }) as? UISlider
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.01) {
            slider?.value = volume
        }
    }
    
}


