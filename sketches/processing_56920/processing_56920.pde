
int x=10;
PImage p;
int size = 50;
float xpos, ypos;    // Starting position of shape    

float xspeed = 2.8;  // Speed of the shape
float yspeed = 2.2;  // Speed of the shape

int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom

//xpos = width/2;
//ypos = height/2;

void setup() {
  size(500, 500);
  

  p = loadImage("cat.png");
  p.resize(200,200);
imageMode(CENTER);
xpos = width/2;
  ypos = height/2;
}

void draw() {
  background(255);
  image(p, xpos,ypos);
  petMoving();
}

void petMoving() {
// Update the position of the shape
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  if (xpos > width-size/2 || xpos < 0 + size/2) {
    xdirection *= -1;
  }
  if (ypos > height-size/2 || ypos < 0 + size/2) {
    ydirection *= -1;
  }
}

