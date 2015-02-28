
//Tim Blanks
//Project 2 Behavior of Things
//Modified code from proxDemo and imgWalker from Lab 8


PImage img;
int num = 500;  //number of things
Thing [] Things = new Thing[num];  //sets up array for things
 
void setup() {
  size(300, 300);
  img = loadImage("dots2.jpg");  //loads image
  img.loadPixels();  // loads pixels from image
  smooth();
  noStroke();
   float x = random(-1, 1);
    float y = random(-1, 1);
  for (int i = 0; i < num; i++) {  //loop to seed things array
    Things[i] = new Thing((width/2),(height/2));
    if (random(2) > 1) {
      Things[i].flip = true;
    }
    if (img.get(int(x),int(y)) == color (0)) {
      i++;
    }
    else {
      Things[i] = new Thing(x, y);
    }
  }
}
 
 
void draw() {

  background(255);
  for (int i = 0; i < num; i+= 1) {
 
    Things[i].check(Things, i);
    Things[i].display();
    Things[i].move();
  }
}
 
 
 
// set up for variables of class things
class Thing {
  float x;
  float y;
  float xv = random(-1,1); //limits velocity to a random direction
  float yv = random(-1,1);
  boolean flip;  //boolean used to determine fill of things
  float r = 10;


 
  Thing(float x_, float y_) {
    x = x_;
    y = y_;
  }
 
  void move() {
    y+=xv;
    x+=yv;
    if (x>width) x = 0;  //limits things to drawing
    if (x<0) x = width;
    if (y>height) y = 0;
    if (y<0) y = height;
    
 // tests pixel color of image, if not equal to white then change velocity direction
 
    if (img.get(int(x), int(y)) != color(255)) {
      if (random(2) > 1) {     
        yv = -yv;
      }
      else {
        xv = -xv;
      }
    }   
  }
 // Checks the distance between things in both the x & y axis, if either one
 // is less than the radius of a thing, it will be assigned true 
 // if the distance is greater than the radius, it is false
  void check(Thing[] a, int num) {
 
    for (int i=0; i<a.length; i++) {
      if (i != num) {
      if (dist(x, y, a[i].x, a[i].y) < r) {
      flip = true;
      break;
    }
      else {
       flip = false;
        }
      }
    } 
  }
 //  if a thing is true, it is green
 //  if false, it is blue
  void display() {
    if (flip == true) {
      fill(58, 155, 64);
    }
    else  {
      fill(52, 75, 142);
    }
 
    ellipse(x, y, r, r);
  }
}


