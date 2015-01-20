import Cocoa

class ORKeyWindow: NSWindow {

    @IBOutlet weak var desktopGradientWindow: NSWindow!
    @IBOutlet weak var gradientController: GradientController!

    override func keyDown(theEvent: NSEvent) {
        println(theEvent.keyCode);
        let enter = 36
        let space = 49

        if (Int(theEvent.keyCode) == space){
            if (self.alphaValue == 1) {

                self.animator().alphaValue = 0.1
                NSWorkspace.sharedWorkspace().hideOtherApplications();

                if let screen = desktopGradientWindow.screen {
                    let level:Int = Int(CGWindowLevelForKey(CGWindowLevel(kCGDesktopIconWindowLevelKey)));

                    desktopGradientWindow.level = level - 1;
                    desktopGradientWindow.setFrame(screen.frame, display: true, animate: false);
                    desktopGradientWindow.animator().alphaValue = 1
                    desktopGradientWindow.makeKeyAndOrderFront(self)
                    gradientController.switchViews()
                }
            }
            return;
        }

        if(Int(theEvent.keyCode) == enter){
            gradientController.createNewGradient()
            return;
        }

        super.keyDown(theEvent);
    }

    override func keyUp(theEvent: NSEvent) {

        let enter = 36
        let space = 49

        if(Int(theEvent.keyCode) == space){
            desktopGradientWindow.animator().alphaValue = 0;
            animator().alphaValue = 1;
            gradientController.switchViews()
        }

        super.keyUp(theEvent);
    }

}
