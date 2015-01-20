import Cocoa

class ORKeyWindow: NSWindow {

    @IBOutlet weak var desktopGradientWindow: NSWindow!
    @IBOutlet weak var gradientController: GradientController!
    @IBOutlet weak var gradientScroll: NSScrollView!

    override func keyDown(theEvent: NSEvent) {
        println(theEvent.keyCode);
        let enter = 36
        let space = 49
        let up = 126
        let down = 125
        let left = 123
        let right = 124

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

        let keycode = Int(theEvent.keyCode)
        if (keycode == up || keycode == right || keycode == left || keycode == down ){
            let d = 50
            let t = (keycode == up) ? d : 0
            let l = (keycode == left) ? d : 0
            let r = (keycode == right) ? d : 0
            let b = (keycode == down) ? d : 0
            scrollBy( NSEdgeInsets(top: CGFloat(t), left: CGFloat(l), bottom: CGFloat(b), right: CGFloat(r)));
            return
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

    func scrollBy(insets:NSEdgeInsets) {
        NSAnimationContext.beginGrouping()
        NSAnimationContext.currentContext().duration = 0.15

        let clipView = self.gradientScroll.contentView
        var newOrigin = clipView.bounds.origin
        newOrigin.y += insets.top
        newOrigin.y -= insets.bottom;
        newOrigin.x += insets.right;
        newOrigin.x -= insets.left;

        clipView.animator().setBoundsOrigin(newOrigin)
        NSAnimationContext.endGrouping()
    }

}
