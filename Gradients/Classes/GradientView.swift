import Cocoa

struct GradientPoint {
    let startColour:NSColor
    let endColour:NSColor

    func createGradient() -> NSGradient {
        return NSGradient(startingColor: startColour, endingColor: endColour)
    }

    func drawIntoRect(rect: NSRect) {
        let gradient = createGradient()
        let endPoint = NSPoint(x: rect.size.width, y: 0);
        gradient.drawFromPoint(NSPoint(x: 0, y: 0), toPoint: endPoint, options: NSGradientDrawsBeforeStartingLocation);
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
