
PImage bg;
PImage deer;

PShape dot1;
PShape dot2;
PShape dot3;
PShape dot4;
PShape dot5;
PShape dot6;
PShape dot7;
PShape dot8;
PShape dot9;
PShape dot10;
PShape dot11;
PShape dot12;
PShape dot13;
PShape dot14;
PShape dot15;
PShape dot16;
PShape dot17;

float easing = 0.5;
int u = 100;
float a = -0.001;

void setup() {
  //SETUP
  size(640, 480);
  smooth();
  
  //LOAD IMAGE ELEMENTS
  bg = loadImage("bg.png");
  deer = loadImage("deer.png");
  dot1 = loadShape("dot1.svg");
  dot2 = loadShape("dot2.svg");
  dot3 = loadShape("dot3.svg");
  dot4 = loadShape("dot4.svg");
  dot5 = loadShape("dot5.svg");
  dot6 = loadShape("dot6.svg");
  dot7 = loadShape("dot7.svg");
  dot8 = loadShape("dot8.svg");
  dot9 = loadShape("dot9.svg");
  dot10 = loadShape("dot10.svg");
  dot11 = loadShape("dot11.svg");
  dot12 = loadShape("dot12.svg");
  dot13 = loadShape("dot13.svg");
  dot14 = loadShape("dot14.svg");
  dot15 = loadShape("dot15.svg");
  dot16 = loadShape("dot16.svg");
  dot17 = loadShape("dot17.svg");
  shapeMode(CENTER);
}

void draw() {
    image(bg, 0, 0);
    image(deer, 0, 0);
    
    //spots
    //dot scaling based on a code from visualID=7300 on openprocessing.org
    float dotSize = ((640 - mouseX) / 30);
    shape(dot1, 272, 248, dotSize, dotSize);
    shape(dot2, 264, 238, dotSize, dotSize);
    shape(dot3, 287, 239, dotSize, dotSize);
    shape(dot4, 272, 226, dotSize, dotSize);
    shape(dot5, 291, 226, dotSize, dotSize);
    shape(dot6, 261, 216, dotSize, dotSize);
    shape(dot7, 283, 217, dotSize, dotSize);
    shape(dot8, 302, 215, dotSize, dotSize);
    shape(dot9, 382, 439, dotSize, dotSize);
    shape(dot10, 404, 433, dotSize, dotSize);
    shape(dot11, 401, 452, dotSize, dotSize);
    shape(dot12, 403, 472, dotSize, dotSize);
    shape(dot13, 417, 461, dotSize, dotSize);
    shape(dot16, 469, 462, dotSize, dotSize);
    shape(dot17, 488, 468, dotSize, dotSize);
    dotSize = ((640 - mouseX) / 20);
    shape(dot14, 436, 456, dotSize, dotSize);
    shape(dot15, 469, 480, dotSize, dotSize);
    antlers(263, 205, u, a);
    antlers(307, 205, u, a);
    a = random(0, .5);
    antlers(263, 205, u, a);
    antlers(263, 205, u, -a);
}

void antlers(int xpos, int ypos, int units, float angle){
  pushMatrix();
  translate(xpos, ypos);
  for (int i = mouseX/50; i > 0; i--){
    strokeWeight(i);
    line(0, 0, 0, 8);
    translate(0, -8);
    rotate(angle);
  }
  popMatrix();
}

