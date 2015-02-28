
//I based this project off of the previously completed lab assignment as a means of further investigation
//The changes made are significant enough to produce a new, unique sketch
//The random elements are the color and shape of the central figure, and the height of the blue rectangles
//The constant element is the stroke weight of each figure, and the shape of the white ellipses

void setup() {
  size(500, 500);
  smooth();
  background(0);
  colorMode(HSB, width);
  noFill();
}

int x=50; //used to determine the revolution around the center
int y=0; //used for determining the rotation of the objects
int a=50; //the width of the central ellipses
int b= floor(random(150)); //random value determining the height of the central ellipses

void draw() {
  if (y<=height*3.65) { //ensures that the white ellipse and blue rectangle tesselation stops
    strokeWeight(1);
    pushMatrix();
    translate(width/2, height/2); //new origin is now center
    rotate(radians(x));
    translate(175, 175); //new origin of objects
    rotate(radians(y+50));
    stroke(300, 250, width); //pale blue
    rectMode(CENTER);
    rect(0, 0, 10, random(200, 400)); //rectangle figure that rotates around center with random heights
    stroke(0, 0, width); // white
    ellipse(0, 0, 100, 50);
    popMatrix();
  }

  if (a>=0) { //this makes the loop finite
    if (b>=0) {
      pushMatrix();
      translate(width/2, height/2);
      rotate(radians(y+15));
      strokeWeight(2);
      stroke(random(width), random(height), width); //random color genorator
      ellipse(0, 0, a, b);
      popMatrix();
      a--;
      b--;
    }
  }

  if (mousePressed) { //restarts the sketch with the click of a mouse
    background(0);
    x=50;
    y=0;
    a=50;
    b=floor (random(150));
  }

  x++;
  y+=5;
}


