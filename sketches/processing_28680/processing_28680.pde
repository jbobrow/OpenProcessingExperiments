
PImage ocean;
PImage [] nemo;
Nemo [] nemos; 

int W = 100; 
int H = 75; 


void setup() {
  frameRate(30); 
  size(640,480);
  nemo = new PImage[3];
  nemos = new Nemo [20]; 
  for(int i = 0; i < nemos.length; i ++) {
    nemos[i] = new Nemo(random(37.5,640), random(0, 480));
  }
  for(int i = 0; i< nemo.length; i ++) {
    nemo[i] = loadImage("nemo" + (i+1) + ".png");
  }
  ocean = loadImage("oceanfloor1.JPG");
}

void draw() {
  image(ocean,0,0,800,600);
  for(int i = 0; i < nemos.length; i++) {
    nemos[i].update();
  }
}

class Nemo {
  float x;
  float y; 
  float velX;
  float velY;
  float destinX;
  float destinY;
  int counter; 
  int frame;
  int speedFrame;
  int speed = 5; 

  Nemo (float xpos, float ypos) {
    x = xpos;
    y = ypos;
    speedFrame = int (random(2, 25));
    destinX = x;
    destinY = y;
  }

  void update() {
    pushMatrix();
    translate(x, y);
    x +=speed; 
    y +=speed;
    if(x >=640 || x <= 37.5) {
      speed *= -1;
    }
    if(y >=480 || y <= 37.5) {
      speed *= -1;
    }
    if(counter%speedFrame==0) {
      frame++;
    }
    if(frame >2) frame = 0; 
    image(nemo[frame], -50, -37.5, W, H);

    popMatrix();
    counter++;
  }
}

  void keyPressed() {
    if(key == '1') {
      ocean = loadImage("oceanfloor1.JPG");
    }
    if(key == '2') {
      ocean = loadImage("oceanfloor2.jpg");
    }
    if(key == '3') {
      ocean = loadImage("oceanfloor3.jpg");
    }
    if(key == 'b') {
      H++;
      W++;
    }
  }



