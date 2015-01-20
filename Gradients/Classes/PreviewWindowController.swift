import AppKit
import Foundation

class PreviewWindowController: NSWindowController {

    @IBOutlet weak var mainGradientWindow: NSWindow!
    @IBOutlet weak var gradientController: GradientController!

    func buttonMouseUp() {
        mainGradientWindow.animator().alphaValue = 1;
        self.window?.animator().alphaValue = 0;
        gradientController.switchViews()
    }

    func buttonMouseDown() {
        mainGradientWindow.animator().alphaValue = 0.1
        NSWorkspace.sharedWorkspace().hideOtherApplications();

        if let screen = mainGradientWindow.screen {
            let window = self.window!
            let level:Int = Int(CGWindowLevelForKey(CGWindowLevel(kCGDesktopIconWindowLevelKey)));
            window.level = level - 1;
            window.setFrame(screen.frame, display: true, animate: false);
            self.showWindow(nil)
            window.animator().alphaValue = 1
            gradientController.switchViews()
        }
    }

    override func keyUp(event: NSEvent) {
        println(event.keyCode);
    }
}
