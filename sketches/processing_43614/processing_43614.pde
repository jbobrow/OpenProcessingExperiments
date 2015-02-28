
PImage myPic;
int num = 1500; //amount of pixls
pixl [] pixls = new pixl[num];

void setup() {
  colorMode(HSB, 100);
  size(350, 210);
  myPic = loadImage("project2pic.jpg"); //loading image data
  background(myPic); // sets image so pixels can react
  myPic.loadPixels();

  for (int i=0;i<num;i++) {
    float x = random(width);
    float y = random(height);
    if (myPic.get(int(x), int(y)) == color(0, 0,100)) { //if pixl reaches a white pixel it avoids it
      i--;
    }
    else {
      pixls[i] = new pixl(x, y); //formula moves pixl to new coordiante
    }
  }
}

void draw() {

  for (int i=0; i<num; i++) {
    pixls[i].walk();
    pixls[i].trail();
  }
}

class pixl {
  float x;
  float y;
  float xv = random(1); //spawning point for pxl in x coordinate
  float yv = random(1); //spawning point for pxl in y coordinate

  pixl(float x_, float y_) {
    x=x_;
    y=y_;
  }

  void walk() {
    x+=xv;
    y+=yv;

    if (x>width) x = 0;
    if (x<0) x = width;
    if (y>height) y = 0;
    if (y<0) y = height;

    if (myPic.get(int(x), int(y)) != color(0, 0, 100)) { //pixl avoids white pixels
      if (random(20)>1) {      
        yv = -yv;
      }
      else {
        xv = -xv;
      }
    }
  }

  void trail() {
    stroke(100, 0, 0,10);
    point(x, y);
  }
}

//code varied from Lab 8 "imgWalker" code


