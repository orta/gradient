import Cocoa

class GradientController: NSObject {

    var view: GradientView!

    @IBOutlet weak var mainView: GradientView!
    @IBOutlet weak var previewView: GradientView!

    var colour: NSColor!

    @IBAction func redrawClicked(sender: AnyObject) {
        getRandomColour()
        drawColour()
        view.displayIfNeeded()
    }

    override func awakeFromNib() {
        view = mainView;
        getRandomColour()
        drawColour()
    }

    func switchViews() {
        if view == mainView {
            view = previewView
        } else {
            view = mainView;
        }
        drawColour()
    }

    func getRandomColour() {
        let hueRand = 360.randomLowerInt()
        let hue = CGFloat(hueRand) / 360.0

        colour = NSColor(calibratedHue:hue, saturation: 0.398, brightness: 0.773, alpha: 1.0)
    }

    func drawColour() {
        let point = GradientPoint(startColour: colour, endColour:NSColor.blackColor());

        view.empty()
        view.addGradientPoint(point)
    }

    func randPointAroundBounds() -> NSPoint {
        let bounds = view.bounds
        return NSMakePoint (
            CGRectGetWidth(bounds).randomPushingOutwards(40),
            CGRectGetHeight(bounds).randomPushingOutwards(40)
        )
    }
}

extension Int {
    func randomLowerInt() -> Int {
        return Int(arc4random_uniform(UInt32(self)))
    }
}

extension CGFloat {
    func randomLowerInt() -> Int {
        return Int(arc4random_uniform(UInt32(self)))
    }

    func randomPushingOutwards(outer: Int) -> CGFloat {
        let upper = self + CGFloat(outer * 2)
        return CGFloat(upper.randomLowerInt() - outer)
    }
}

extension ClosedInterval {
    func randomInt() -> Int {
        let x = start as Int
        let y = end as Int
        return Int(arc4random_uniform(UInt32(x))) - y
    }

    func randomRange() -> Range<Int> {
        let x = start as Int
        let y = end as Int
        let top = Int(x + y).randomLowerInt() - x
        return Range(start: x, end: top)
    }
}

