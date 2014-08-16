Changing preferredContentSize of a navigation controller animates too late
===


Summary
---

I'm presenting a UINavigationController as a popover. Each view controller in the nav stack is a UITableViewController, and I want the popover to be the same height as all the rows in each table view controller.

Changing the preferredContentSize of the navigation controller from the -navigationController:willShowViewController:animated: delegate method causes the popover to change size _after_ the push or pop animation is complete, rather than changing _with_ the animation. This is true even if I expressly wrap the assignment in a block that I -animateAlongside... with the navigation controller's transitionCoordinator.


Steps to Reproduce
---

1. Build and run the attached demo app
2. Tap the Popover button
3. Tap an item in the list that has a different number of rows than the current level


Expected results
---

Popover resizes while the navigation controller is animating.


Actual results
---

Popover doesn't begin its resize animation until after the navigation controller has finished animating.


Configuration
---

iOS 8 Simulator


Version & Build
---

iOS 8.0 beta 5 (12A4345d)