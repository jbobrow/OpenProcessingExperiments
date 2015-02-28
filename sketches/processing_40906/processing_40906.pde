
//Bryan Williams
//October 5, 2011
//Computational Methods
//Homework 7.1

//number of lines being drawn
int num = 170;
//size of rectangles dictate thickness and lightness of line
int rectSize = 4;

//color of array
color[] myColor = new color[5];
//path of array
Path[] myPath = new Path[num];

void setup() {
  size(300, 300);
  background(255);
  strokeWeight(.09); // this controls the lightness for the rectangles which draw the lines
  smooth();

  //this is the color palette I have chosen (mainly warm colors like red, orange, and yellow)
  myColor[0] = color(125, 0, 0);
  myColor[1] = color(255, 0, 0);
  myColor[2] = color(255, 98, 0);
  myColor[3] = color(255, 200, 0);
  myColor[4] = color(255, 255, 0);

  for (int bryan=0; bryan<myPath.length; bryan++) {  //this seeds the array
    myPath[bryan] = new Path();
  }
}

void draw() {

  for (int bryan=0; bryan<myPath.length; bryan++) {
    myPath[bryan].move();
    myPath[bryan].draw();
  }
}

//setup for the class
class Path {

  color paint = myColor[int(random(0, 5))];
  int x = int(random(width));
  int y = int(random(height));

  Path() {
  }

  //this sets the direction of the rectangles
  void move() {
    x = x + int(random(1, 0));
    y = y + int(random(1, 0));
  }

  //This creates the rectangles which trickle down the composition
  void draw() {
    noFill();
    stroke(paint);
    rect(x, y, random(CENTER), random(CENTER));
  }
}

//my goal with this assignment was to create a composition with lines composed
//of smaller shapes which move across the window like beams of light.


