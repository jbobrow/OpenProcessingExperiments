

//Michael and Eddie's THINGYS
//Michael Kinard & Eddie Winn
//Project 2



PImage img; //accesses the image to be used in sketch
int num = 5000; //number of thingys
Thingy [] Thingys = new Thingy[num]; //sets up array for thingys object



void setup() {
  size(500, 291);
  background(0);
  smooth();
  img = loadImage("batman.jpg"); //loads the image
  img.loadPixels(); //lods pixels from image

  for (int i=0;i<num;i++) { //loop to seed Thingys array
    float x = random(width);//variable to be associated with Thingy
    float y = random(height);//variable to be associated with Thingy
    if (img.get(int(x), int(y)) == color(255, 255, 255)) { //if Thingy hits a white pixel starts moving
      i--;
    }
    else {
      Thingys[i] = new Thingy(x, y); //if the Thingy doesn't hit white, it starts a new Thingy in another random location
    }
  }
}

void draw() {
  for (int i=0; i<num; i++) { //size of Thingys array
    Thingys[i].travel(); //starts a method -- the Thingys move
    Thingys[i].make(); //starts a method -- the Thingys create a color where they go
  }
}

//the variables have to pass from the constructor to the object
class Thingy { //creates the class "Thingy" -- following, create variables associated to Thingy class
  float x; //variable x
  float y; //varialbe y
  float xv = 1; //speed of the walker in the x direction
  float yv = 1; //speed of the walker in the y direction

  Thingy(float x_, float y_) { //object constructor; x and y are local variables
    x=x_; //pass the local variable to the object
    y=y_; //pass the local variable to the object
  }

  void travel() { //method of Thingys -- moves the Thingy point around sketch
    x = x + random(-2, 2); 
    y = y + random(-2, 2);

    if (x>width) x = 0; //restricts the Thingys from leaving the boundaries of the sketch
    if (x<0) x = width;
    if (y>height) y = 0;
    if (y<0) y = height;

    if (img.get(int(x), int(y)) != color(255, 255, 255)) { //if Thingy is on a black pixel of image
      if (random(2)>1) { //computer chooses 1 or 2 at random -- if 2      
        yv = -yv; //Thingy moves opposite direction in Y axis
      }
      else {
        xv = -xv; //Thingy moves opposite direction in X axis
      }
    }
    if (img.get(int(x), int(y)) != color(0, 0, 0)) { //if Thingy is on a white pixel
      if (random(2)>1) { //computer chooses 1 or 2 at random -- if 2        
        yv = -yv; //Thingy moves opposite direction in Y axis
      }
      else {
        xv = -xv; //Thingy moves opposite direction in X axis
      }
    }
  }


  void make() { // method -- making the color that the Thingy leaves on sketch

    if (img.get(int(x), int(y)) != color(255, 255, 255)) { //if the pixel being called from the image is black
    }
    else {                                               //otherwise, pixel is white, and Thingy moves around leaving Yellow pixel
      stroke(255, 255, 0);
      strokeWeight(.5);
      point(x, y);
    }

    if (img.get(int(x), int(y)) != color(0, 0, 0)) { //if the pixel being called from the image is white
    }
    else {                                           //otherise, pixel is black, and Thingy moves around leaving Gray pixel
      stroke(100);
      strokeWeight(1);
      point(x, y);
    }
  }
}


