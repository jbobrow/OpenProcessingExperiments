
//Homework 4.1_Conditional Composition
//Created by Adrianne Blossom
//September 14, 2011

//This is a loop created by using the for() command. I was able to create a random pattern using line() and dots to emphasize the boundary of where the hue begins to change. 

float random=10;

void setup() {
  size(400, 400);
}

void draw() {
  for (int x=0; x<width; x++) {
    stroke(HSB, 160, x-25, 50);
    strokeWeight(0);
    line(x, 0, x*2, height); //Multiplying by 3 or some other integer is what introduces the swirl or ripple pattern.
  }

  for (int x=0; x<width; x++) { //This for() simply creates a mirror image of the for() above across the diagonal.
    stroke(HSB, 160, x-25, 50); //Must repeat stroke in order to mirror the balance in color.
    line(0, x, width, x*2);
  }

  for (int x=0; x<=height; x+=25) {
    noFill();
    stroke(300, 40, 93);
    strokeWeight(5);
    point(x, 3*height/4); //Horizontal row of points.
    point(3*width/4, x); //Vertical row of points.
  }
}


