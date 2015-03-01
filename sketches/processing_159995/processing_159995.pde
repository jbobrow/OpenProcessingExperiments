
// bouncing ball edited

PImage photo;
int posx;
int posy;
int xd = 10;
int yd = 10;
int w = 50;
int h = 50;

// setup

void setup(){
  size(700, 500);
  frameRate(20);
  noLoop();
}

//draw

void draw(){
  photo = loadImage("soccer_field.png");
  image(photo, 0, 0, 700, 500);
  ball (posx, posy, w, h);
  posx = posx + xd;
  posy = posy + yd;
  if (posx>(width-60)) {
    xd = -xd;
  }
  if (posy>(height-60)) {
    yd = -yd;
  }
  if (posx<0) {
    xd = -xd;
  }
  if (posy<0) {
    yd = -yd;
  }
}


// click and release loop&noLoop

void mousePressed() {
  noLoop();
}
void mouseReleased() {
  loop();
}

// ball void (function)
void ball (int x,int y,int w,int h) {
    stroke(255);
    fill(255);
    strokeWeight(0);
    ellipseMode(CORNER);
    photo = loadImage("brazuca.png");
    image(photo, x, y, w, h);
//    ellipse (x, y, w, h);
}




  



