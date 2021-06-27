import UIKit
import Flutter

@available(iOS 10.0, *)
@available(iOS 10.0, *)
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {

        let kDebugLoggingEnabled = true
    weak var screen : UIView? = nil
    override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
    func applicationWillResignActive(_ application: UIApplication) {
        blurScreen()
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        removeBlurScreen()
    }
    func blurScreen(style: UIBlurEffect.Style = UIBlurEffect.Style.regular) {
        screen = UIScreen.main.snapshotView(afterScreenUpdates: false)
        let blurEffect = UIBlurEffect(style: style)
        let blurBackground = UIVisualEffectView(effect: blurEffect)
        screen?.addSubview(blurBackground)
        blurBackground.frame = (screen?.frame)!
        window?.addSubview(screen!)
    }

    func removeBlurScreen() {
        screen?.removeFromSuperview()
    }
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    // <Add>
     override func applicationWillResignActive(
       _ application: UIApplication
     ) {
       self.window.isHidden = true;
     }
     override func applicationDidBecomeActive(
       _ application: UIApplication
     ) {
       self.window.isHidden = false;
     }
     // </Add>

    

    @objc private func didScreenshot(_ notification: Notification) {
        self.window.isHidden = true;
    
           exit(0)
       }
       
       @objc private func didScreenRecording(_ notification: Notification) {
           //If a screen recording operation is pending then we close the application
        if #available(iOS 11.0, *) {
            print(UIScreen.main.isCaptured)
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 11.0, *) {
            if UIScreen.main.isCaptured {
                
                exit(0)
            }
        } else {
            // Fallback on earlier versions
        }
       }
}
