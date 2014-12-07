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

@end
