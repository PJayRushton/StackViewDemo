# StackViewDemo
This is a simple iOS app demonstrating the use of StackViews (in Swift)

![Demo](https://github.com/PJayRushton/StackViewDemo/blob/master/StackViewsDemo/StackViewsDemo.gif?raw=true "Demo video")

## Instructions
### Initial setup
1. Start a blank, single view application
1. Add a UIStackView to the main view controller with 4 UIView subviews.
    - Set the stack views properties as follows:
        - Axis: Horizontal
        - Alignment: Fill
        - Distribution: FillEqually
        - Spacing: Whatever u want (But don't go crazy)
    - Set different background colors for each UIView
    - Constrain the stack view to the edges of the superview
1. Add a UIButton anywhere (Mine is in the left-most view) with title: "Go vertical"
1. Add references to the following views:
    - Stack view (`stackView`)
    - Button - Reference (`axisButton`)
    - Button - Action (`axisButtonPressed`)
        - print something so we know the button is hooked up properly
    - UIView on the right (Name it by its color not `lastView` or `rightView` cause  *Spoiler Alert* that's going to change)
1. Build and run, make sure it looks good.
1. Make sure the button is hooked up properly by printing what you wrote.

### Axis Change
1. Create a new function called `toggleAxis` with one Bool parameter named `animated`
1. In the `axisButtonPressed` call the `toggleAxis` func.
1. In the `toggleAxis` func, toggle the stackView's axis with the following lines:
```
if stackView.axis == .horizontal {
    stackView.axis = UILayoutConstraintAxis.Vertical
  } else {
    stackView.axis = UILayoutConstraintAxis.Horizontal
  }
```
1. Create a new function called `updateAxisButtonTitle` and add this line:
    ```
    let newTitle = stackView.axis == .horizontal ? "Go vertical" : "Go horizontal"
    axisButton.setTitle(newTitle, forState: .Normal)
    ```

1. Call `updateAxisButtonTitle` at the bottom of `toggleAxis`
1. Build and run.
1. Press the axis button and watch the magic. (Flip from a Horizontal to a Vertical stack)
1. **Stretch** Clean the `toggleAxis` func up.

### Animated axis change
1. Add a UISwitch somewhere and add an outlet connection `animatedSwitch`
1. Add the animated parameter to the `toggleAxis` call based on the animated switch status
1. Wrap the `toggleAxis` code in a UIView animation block
1. Call `updateAxisButtonTitle` in the completion
1. Build and run and watch the animation on the axis change. (oohs and ahhs)

### Hiding and showing arranged subviews
1. In the storyboard add a button (anywhere besides the last view).
1. And add an outlet and action connect. (`toggleLastButton`, and `toggleLastButtonPressed`)
1. Add a function entitled `toggle{Color}View(hidden: Bool)`
1. In the function, set the (color)View hidden property to be equal to the hidden parameter
1. Call `toggle(Color)View` from the `removeButtonPressed` action function
1. Build and run to watch the last view appear and reappear

### Animated entry/exit
1. Add another UISwitch somewhere and add an outlet to it
1. Wrap the `toggleColorView` in a UIView animation block based on the switch status.
1. Build and run to watch the animation of the last view getting removed/added
1. **Stretch** Get the last view to fade as it animates out and fade back in as it comes back in.
1. **Stretch** Get the last view to bounce in and out with a spring effect
