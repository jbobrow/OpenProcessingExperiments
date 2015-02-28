
//Jake Coltrane, Irina Shumskaya, Ryan Coleman
//Project 2
//Code of inspiration came from imgWalker by Nick Senske
//Image/painting by Manuel Duldulao

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//Set image parameters
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

PImage img;                                              //background black and white version of the image
PImage img2;                                             //color pallette color version of the image
int num = 150;
Walker [] Walkers = new Walker[num];

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//Define canvas parameters
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

void setup() {
  size(456, 600);
  img2 = loadImage ("w300abstract.jpg");
  img = loadImage("b&w.jpg");
  background(img);
  img.loadPixels();

  for (int i=0;i<num;i++) {                              //walker starting at random
    float x = random(width);
    float y = random(height);
    if (img.get(int(x), int(y)) == color(0, 0, 0)) {     //changes behavior at black pixels
      i--;
    }
    else {
      Walkers[i] = new Walker(x, y);
    }
  }
}

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//Create walker class and profiles
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

void draw() {
  for (int i=0; i<num; i++) {
    Walkers[i].walk();
    Walkers[i].trail();
    Walkers[i].render();
  }
}

class Walker {                                           //orthoganal change in direction inside black edge and continue in new direction
  float x;                                               //x behavior in white space
  float y;                                               //y behavior in white space
  float xv = 1;                                          //x behavior in black space
  float yv = 1;                                          //y behavior in black space

  Walker(float x_, float y_) {                          
    x=x_;
    y=y_;
  }

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//Set walker parameters
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  void walk() {                                          //edge detection
    x+=xv;
    y+=yv;

    if (x>width) x = 0;                               
    if (x<0) x = width;
    if (y>height) y = 0;
    if (y<0) y = height;

    if (img.get(int(x), int(y)) != color(0, 0, 0)) {    //edge behavior
      if (x>1) {
        yv = -yv;
      }
      else {                                            //redirects at edge
        xv = -xv;
      }
    }
  }

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//Give walkers graphic representation
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  void trail() {                                         //walker and the trail following
    point (x, y);
  }
  
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//Rules for walkers graphic representation
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  void render() {                                        //draws character of the line from the color version of the image
    color Pallette = img2.get (int (x),int (y));
    stroke (Pallette);
    strokeWeight(.1);
  }
}


