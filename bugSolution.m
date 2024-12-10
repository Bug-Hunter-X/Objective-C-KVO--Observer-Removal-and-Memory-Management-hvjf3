The solution involves adding observer removal in the `dealloc` method:

```objectivec
@interface MyViewController : UIViewController
@property (strong, nonatomic) MyModel *model;
@end

@implementation MyViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.model addObserver:self forKeyPath:@"data" options:0 context:nil];
}

- (void)dealloc {
    [self.model removeObserver:self forKeyPath:@"data"];
}
@end
```

This ensures that the observer is removed before the `model` is deallocated, preventing crashes and ensuring clean memory management.  For more robust solutions, handle potential `nil` values of `self.model` before calling `removeObserver`.