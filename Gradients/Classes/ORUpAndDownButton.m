#import "ORUpAndDownButton.h"

@implementation ORUpAndDownButton

- (void)mouseDown:(NSEvent *)event
{
    [_delegate buttonMouseDown];
}

- (void)mouseUp:(NSEvent *)event
{
    [_delegate buttonMouseUp];
}

- (void)keyDown:(NSEvent *)theEvent
{
    if (theEvent.keyCode == 49) {
        [_delegate buttonMouseDown];
    }
    [super keyDown:theEvent];

}

- (void)keyUp:(NSEvent *)theEvent
{
    if (theEvent.keyCode == 49) {
        [_delegate buttonMouseUp];
    }
    [super keyUp:theEvent];
}

@end
