#import <Cocoa/Cocoa.h>

@protocol ButtonDelegate <NSObject>
- (void)buttonMouseDown;
- (void)buttonMouseUp;
@end

@interface ORUpAndDownButton : NSButton
@property (unsafe_unretained) IBOutlet id<ButtonDelegate> delegate;
@end
