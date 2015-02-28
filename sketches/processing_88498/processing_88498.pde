
/*
 *  Title: P06_05_Easing
 *  By:    Barton Poulson (bartdoesart.com)
 *  Date:  06 February 2013
 *
 *  Assignment:
 *    Create a dynamic sketch in which one or more objects approach a 
 *    position (e.g., a random coordinate on the screen, a specified 
 *    data value, or the mouse) by “easing” towards that target. 
 *
 *    To do so, first create global float variables for the x and y 
 *    positions of each object that you want to ease
 *
 *    Next, create a variable that specifies the speed of easing, with a
 *    value between 0 and 1, like this (give the variable any name you want): 
 *      float easingSpeed = .05;
 *
 *    Finally, after the function in draw() that places the object, increment
 *    its position by a fraction of the distance remaining to the target,
 *    like this:
 *      ellipse(x, y, 20, 20);
 *      x += (targetX - x) * easingSpeed;
 *      y += (targetY - y) * easingSpeed;
 */
 
// This palette is "Indispensible" by dlgombert.
// See https://kuler.adobe.com/#themeID/2220568

color[] palette = {#414F73, #34888C, #2DA65D, #67BF47, #EEF272};

int wide = 600;
int high = 200;

int d = 20;

float x1 = random(wide);
float y1 = random(high);
float easing1 = .02;

float x2 = random(wide);
float y2 = random(high);
float easing2 = .035;

float x3 = random(wide);
float y3 = random(high);
float easing3 = .05;

void setup(){
//  size(wide, high);  // You can use variables for the window in Processing...
  size(600, 200);      // ...but have to use values in OpenProcessing
  smooth();
  strokeWeight(3);
  noCursor();
}

void draw(){
  background(palette[0]);
  
  // Directions in the bottom left of the window
  fill(palette[1]);
  text("circles follow mouse", 10, height-25);
  text("press any key to scatter", 10, height-10);
  
  // Circle 1
  stroke(palette[1]);
  noFill();
  ellipse(x1, y1, d+15, d+15);
  x1 += (mouseX - x1)*easing1;
  y1 += (mouseY - y1)*easing1;

  // Circle 2
  stroke(palette[2]);
  noFill();
  ellipse(x2, y2, d+10, d+10);
  x2 += (mouseX - x2)*easing2;
  y2 += (mouseY - y2)*easing2;

  // Circle 3
  stroke(palette[3]);
  noFill();
  ellipse(x3, y3, d+5, d+5);
  x3 += (mouseX - x3)*easing3;
  y3 += (mouseY - y3)*easing3;

  // Dot on cursor
  noStroke();
  fill(palette[4]);
  ellipse(mouseX, mouseY, d, d);
}

// This scatters the circles if any key is pressed
void keyPressed() {
  x1 = random(wide);
  y1 = random(high);

  x2 = random(wide);
  y2 = random(high);

  x3 = random(wide);
  y3 = random(high);
}
