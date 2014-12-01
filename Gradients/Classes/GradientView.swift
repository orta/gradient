import Cocoa

struct GradientPoint {
    let location:NSPoint
    let color:NSColor
    let strength:Int

    func createGradient() -> NSGradient {
        return NSGradient(startingColor: color, endingColor: NSColor.clearColor())
    }

    func drawIntoRect(rect: NSRect) {
        let gradient = createGradient()
        gradient.drawFromCenter(location, radius: 0, toCenter: location, radius: CGFloat(strength), options: NSGradientDrawsBeforeStartingLocation)
    }
}

class GradientView: NSView {

    var gradientPoints:[GradientPoint] = []

    override func drawRect(dirtyRect: NSRect) {
        NSColor.whiteColor().set()
        NSRectFill(self.bounds);

        for point in gradientPoints {
            point.drawIntoRect(self.bounds)
        }
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func empty() {
        gradientPoints.removeAll(keepCapacity: false)
    }

    func addGradientPoint(point: GradientPoint) {
        gradientPoints.append(point)
        self.setNeedsDisplayInRect(self.bounds)
    }
}
