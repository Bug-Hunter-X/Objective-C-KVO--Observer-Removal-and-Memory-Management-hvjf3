In Objective-C, a subtle bug can arise from the interaction between KVO (Key-Value Observing) and memory management.  If an observer is not removed properly before the observed object is deallocated, it can lead to crashes or unexpected behavior. This often happens when an observer is added in a method (like viewDidLoad) but not removed in a corresponding method (like dealloc or viewWillDisappear). For example:

```objectivec
@interface MyViewController : UIViewController
@property (strong, nonatomic) MyModel *model;
@end

@implementation MyViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.model addObserver:self forKeyPath:@"data" options:0 context:nil];
}

// Missing removal of observer in dealloc
- (void)dealloc {
    // [self.model removeObserver:self forKeyPath:@"data"];  // Missing!
}
@end
```

Failing to remove the observer in dealloc can result in a `EXC_BAD_ACCESS` or similar error when the `model` is released.