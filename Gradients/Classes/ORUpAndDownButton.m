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
    [_delegate buttonMouseDown];
}

- (void)keyUp:(NSEvent *)theEvent
{
    [_delegate buttonMouseUp];
}

@end
