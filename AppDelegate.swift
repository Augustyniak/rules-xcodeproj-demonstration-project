import UIKit

@UIApplicationMain
private final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

        func application(
            _ application: UIApplication,
            didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
        {
            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.window?.rootViewController = HostViewController()
            self.window?.makeKeyAndVisible()
            return true
        }

    private final class HostViewController: UIViewController {
        override func viewDidLoad() {
            super.viewDidLoad()

            self.view.backgroundColor = .white

            let label = UILabel()
            self.view.addSubview(label)
            label.text = "Test Host"
            label.font = .boldSystemFont(ofSize: 50)
            label.sizeToFit()
            label.center = self.view.center
        }
    }
}
