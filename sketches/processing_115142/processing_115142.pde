
/* @pjs preload= "hamb.png"; */
PImage img;
int x; //forloop
int y; //forloop
float a = 0.0; //cosine graph
float s = 1.0; //cosine graph
color pix; //pointillization

int rad = 60;

float xpos, ypos;    // Starting position of shape  

float xspeed = 5;  // Speed of the shape
float yspeed = 2;  // Speed of the shape

int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom


void setup() {
  size(800, 600);
  
  imageMode(CENTER);
  img = loadImage("hamb.png");
  noStroke();
  ellipseMode(RADIUS); 
  frameRate(30);
  xpos = width/2;
  ypos = height/2;
}



void draw() {
  image(img, width/2, height/2);
  imageMode(CENTER);
  //background(img);

  a = a + .5;
  s = 1.25 + cos(a)*10;

  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );

  if (xpos > width-rad || xpos < rad) {
    xdirection *= -1;
  }
  if (ypos > height-rad || ypos < rad) {
    ydirection *= -1;
  }
  int tempX = round (xpos);
  int tempY = round (ypos);
  pix = img.get(tempX, tempY);
  noStroke();
  //scale(s);
  fill(pix);
  ellipse(xpos, ypos, rad+2*s, rad+2*s);
  
  
}



