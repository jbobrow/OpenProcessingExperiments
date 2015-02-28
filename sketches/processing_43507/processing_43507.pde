
/* Group Members: Alexander Suryandono, Dian Luo and Yashika Gulati
 creating butterfly geometry out of falling points. The points hit the black portion of the image to change the
 course of the falling points.
 Code is derived from image walkers by Prof Nick Senske
 */

PImage img;
int num = 50; //number of circles
Circ [] Circs = new Circ [num]; //array to get the new number of circles
color myblack=color(0, 0, 0);
color mywhite=color(255, 255, 255);

void setup() {
  size(400, 400);
  img = loadImage("butterfly.jpg");//load the picture processing
  background(myblack);
  img.loadPixels();

  for (int i=0;i<num;i++) {
    float x = random(width);
    float y = random(height);
    if (img.get(int(x), int(y)) == color(myblack)) {//get pixel data from image
      i--;//slower the movement of circles when it hits the black portion of the butterfly
    }
    else {
      Circs[i] = new Circ(x, y);//vertical movement of the falling points if its not hitting the butterfly
    }
  }
}

void draw() {
  for (int i=0; i<num; i++) {
    Circs[i].walk();
    //draw and move ellipse with stroke
  }
}

class Circ {
  float x;
  float y;

  float xv = random(5);
  float yv = random(1);//to control the speed of the points in x and y direction.

  Circ(float x_, float y_) { //set constructor of circle
    x=x_;
    y=y_;
  }

  void walk() {// defining the movement of the x and y direction
    x+=xv;
    y+=yv;
    // rules governing the formation of the points
    if (x>width) x = 0;
    if (x<0) x = width;
    if (y>height) y = 0;
    if (y<0) y = height;

    if (img.get(int(x), int(y)) != color(mywhite)) {//retrieves the black pixels from the image
      yv = yv;
      strokeWeight(3);// varying the stroke of the points when it hits the black portion
      stroke(random(y), random(x), y-10);//Assigning random color inside the black portion of the image and loops so the butterfly will stay dynamic
      point(x, y);
    }
    else {//retrieving the white pixels from the image
      xv = -xv;/*once the pixel reading moves from black to white portion of the image, the zig zag movement of the 
       points within the black area get converted to vertical movement on the white pixels*/
      strokeWeight(1);
      stroke(x, y, 0);//Assigning random color to the vertical falling points
      point(x, y);
    }
  }
}


