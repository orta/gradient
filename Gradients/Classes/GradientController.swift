import Cocoa

class GradientController: NSObject {

    @IBOutlet weak var view: GradientView!

    override func awakeFromNib() {

        let count = 8.randomLowerInt()

        for i in 0..<count {
            let hueRand = 360.randomLowerInt()
            let hue = CGFloat(hueRand) / 360.0

            let colour = NSColor(calibratedHue:hue, saturation: 0.398, brightness: 0.773, alpha: 1.0)

            let point = GradientPoint(location: randPointAroundBounds(), color: colour, strength: 400.randomLowerInt() )
            view.addGradientPoint(point)
        }
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
    func random() -> Int {
        let x = self.start as Int
        let y = self.end as Int
        return Int(arc4random_uniform(UInt32(x))) - y
    }
}

