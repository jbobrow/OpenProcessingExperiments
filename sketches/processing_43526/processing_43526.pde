
//Project 2_Systems
//Corinne Bridges, Chanel Brown, and Angie Scharrer
//October 23, 2011

/* Source code is derived off of Nicholas Senske's imgWalker code.
 As well as a study of the SeekArrive code derived off Daniel Shiffman 
 <http://www.shiffman.net> Nature of Code, Spring 2009 */


//Uploading image and setting up variables
PImage img; 
int num = 50; //number of arrays
Walker [] Walkers = new Walker[num]; //setting up walker array for 50 objects

void setup() {
  size(533, 422); //Image size
  img = loadImage("veins.JPG"); //upload image
  background(0); //make the background black so it hides image
  img.loadPixels(); //load pixel information from image onto sketch

  for (int i=0;i<num;i++) { //if a number is less than the numbre of objects(50), then continuously +1
    float x = random(width); //variables for random x pixel selection
    float y = random(height); //variable for random y pixel selection
    if (img.get(int(x), int(y)) == color(0, 0, 0)) { //if the random x,y selected is black
      i--; //go in the opposite direction of travel
    }
    else { //otherwise, use the array at position i, and continue to position x,y and try again.
      Walkers[i] = new Walker(x, y);
    }
  }
  frameRate(10000); //speed
}

void draw() {
  for (int i=0; i<num; i++) { //if a given number is less than the number of objects(50) then continuously +1
    Walkers[i].walk(); //draw movement of object within the array of walkers for number i
    Walkers[i].trail(); //draw the trail of the object within the array of walkers for number i
  }
}

class Walker {
  float x; //x-position of object
  float y; //y-position of object
  float xv = random(2); //x velocity of object
  float yv = random(2); //y velocity of object

  Walker(float x_, float y_) {
    x=x_; //command walker x-position
    y=y_; //command walker y-position
  }

  void walk() { //movement of the object
    x+=xv; //vaviable to move in x-position plus velocity
    y+=yv; //variable to move in y-position plus velocity

    if (x>width) x = 0; //if the object goes beyond the x or y boundaries
    if (x<0) x = width; //then reset it to 0 and loop across the screen
    if (y>height) y = 0; 
    if (y<0) y = height;

    if (img.get(int(x), int(y)) != color(255, 255, 255)) { //if the color at the position of the object is not white
      if (random(2)>1) {  //half of the time    
        yv = -yv; //then go in the opposite direction
      }
      else {
        xv = -xv; //go in the opposite x-direction
      }
    }
  }

  void trail() {
    if (img.get(int(x), int(y)) != color(0, 0, 0)) { //if the color at the position of the object is black
      strokeWeight(1); //keep it black and draw a trail behind it
      stroke(50); //that is grey
    }
    else {
      strokeWeight(1); //otherwise make it red
      stroke(255, 0, 0);
    }

    point(x, y); //object is a point at position (x,y)
  }
}


