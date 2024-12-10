# Objective-C KVO: Observer Removal and Memory Management

This repository demonstrates a common bug related to Key-Value Observing (KVO) in Objective-C.  Failure to remove KVO observers before the observed object is deallocated can lead to crashes.  The `bug.m` file contains the problematic code, while `bugSolution.m` provides a corrected version.

**Bug:** The observer is added but not removed in `dealloc`, leading to a potential crash.

**Solution:**  Properly remove the observer in `dealloc` to prevent memory management issues.  Consider also removing observers in `viewWillDisappear` or other appropriate lifecycle methods depending on the scenario.

This example highlights the importance of careful memory management in Objective-C when using KVO.