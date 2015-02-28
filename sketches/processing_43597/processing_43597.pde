
//Project Two: Figure-Ground Exploration
//Melissa Diamond & Gina DeMatteo
//October 23,2011
//Code derived from Nick Senske's Image Walker

PImage sym; 
int num = 100; //Establishes the number of walkers
Walker [] Walkers = new Walker[num]; //Establish the array of the walkers

void setup() {
  size(444, 444);
  background(195);
  smooth();
  fill(195);

  sym = loadImage("test3.png"); //Loads the image used for composition
  sym.loadPixels(); //loads the color pixels from the image which establishes the barriers for the walkers



    for (int i=0; i<num; i++) {
    float x = random(1);
    float y = random(1);
    if (sym.get(int(x), int(y)) == color(0, 0, 0)) { //Establishes the barrier for the walkers, Cannot intterupt the black areas in the image
      i++;
    }
    else {
      Walkers[i] = new Walker(x, y); //Directs the walkers in the opposite direction of the black space barriers
    }
  }
}


void draw() {
  for (int i=0; i<num; i++) {
    Walkers[i].walk(); //The walker walks throughout the composition
    Walkers[i].follow(); //The walker leaves a drawn path as it moves throughout the composition
  }
}

//Sets up the Class of the Walker
class Walker { 
  float x; 
  float y; 
  float xv = random(1); //The speed of the walker in the x-direction
  float yv = random(1); //The speed of the walker in the y-direction

  Walker(float x_, float y_) {
    x=x_;
    y=y_;
  }

  //Establish variables for the swag of the walker
  void walk() {
    x+=xv;
    y+=yv;

    x = x + random(4, -4);
    y = y + random(4, -4);

    if (x>width) x = 0; 
    if (x<0) x = width;
    if (y>height) y = 0;
    if (y<0) y = height;

    if (sym.get(int(x), int(y)) != color(255)) {
      if (random(2)>1) {    
        yv = -yv;
      }
      else {
        xv = -xv;
      }
    }
  }


  void follow() {

    for (int a=10; a<height; a+=30) {
      if (sym.get(int(x), int(y)) != color(0)) { //Adds color where white pixels are found in composition; continues to respect the barrier formed by black pixels.

        stroke(0, 0, 0, 50);
        strokeWeight(1);
        point(x, y);

        if ((frameCount>0) &&(frameCount<3000)) { //When framecount is greater than 0 but less than 3000 the walker leaves a purple trail 
          stroke(125, 1, 139, 50);
          point(x, y);
        }
        if ((frameCount>30)&&(frameCount<5000)) { //When framecount is between 30 and 5000 the walker leaves a black trail resulting in the black and gray end result
          stroke(0, 0, 0, 50);
          point(x, y);
        }
      }
    }
  }
}


