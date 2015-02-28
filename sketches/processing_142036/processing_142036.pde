
//EASING
/*Reas & Fry. Getting Started with Processing ex.5.8
 Sometimes you want the values to follow the mouse loosely—to lag behind
 to create a more fluid motion. This technique is called easing. 
 With easing, there are two values: the current value  and the value to move toward. 
 At each step in the program, the current value moves a little closer to the target value.
 
 The Value of the x variable is always getting closer to targetX. The speed at
 which it catches up with targetX is set with the easing variable, a number between
 0 and 1. A small value for easing causes more of a delay than a larger  value. 
 With an easing value of 1, there is no delay.
 
 Change easing variable for 0.01, 0.02, 0.03 and 0.04  for a slow to a faster.
 */

float x;
float easing = 0.04;
float diameter = 12;

void setup() {
  size(220, 120);
  smooth();
}
void draw() {
  background(150);
  float targetX = mouseX;

  // Easing happens here : x += 
  x += (targetX - x) * easing;
  /*  The difference between the target and current value is calculated, then
   multiplied by the easing variable and added to x to bring it closer to the target. */

  ellipse(x, 40, 12, 12);
  println(targetX + " : " + x);
}

