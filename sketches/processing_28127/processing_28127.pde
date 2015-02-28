
//*Boyun Yang's Final Coding Project

int num,cnt,colNum,colScheme;
float h,maxSpeed;

boolean initialised;
float[] colR,colG,colB;


PFont font;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
PImage img8;
PImage img9;
PImage img10;
PImage img11;

int x;

float angle = 0.0;
float offset = 60;
float scalar = 30;
float speed = 0.05;

void setup() {
  size(720, 720);
  font = loadFont("Eureka-48.vlw");
  textFont(font);
  noStroke();
  smooth();
  frameRate(10);

  img1 = loadImage("Hand#2-1.png");
  img2 = loadImage("Tree.png");
  img3 = loadImage("tree2.png");
  img4 = loadImage("tree3.png");
  img5 = loadImage("tree4.png");
  img6 = loadImage("tree5.png");
  img7 = loadImage("Hand#2-2.png");
  img8 = loadImage("Hand#2-3.png");
  img9 = loadImage("Hand#2-4.png");
  img10 = loadImage("Hand_3.png");
  img11 = loadImage("Hand_4.png");
}
  float x1, y1, rad1;
float x2, y2, rad2;

int deg=0;
int r=255;
int g=255;
int b=255;




void draw() {

  fill(270, 10);
  rect(0, 0, width, height);

  fill(255);
  text("Boyun", random(60, 60), random(-20, 100));

  pushMatrix();
  image(img1, random(90, 100), random(-20, 120));
  image(img7, random(60, 80), random(-20, 90));
  image(img8, random(-50, 100), random(10, 10));
  image(img9, random(-30, 70), random(-700, -700));
  image(img1, random(5, 10), random(5, 20));
  image(img7, random(-80, -800), random(-800, 4));
  image(img8, random(150, -100), random(500, -110));
  image(img9, random(120, -120), random(90, 40));
  image(img1, random(30, 90), random(90, 40));
  image(img7, random(2, 10), random(10, 3));
  image(img8, random(-700, 70), random(-470, 70));
  image(img9, random(-20, 20), random(30, -30));
  image(img1, random(-600, 100), random(-200, 100));
  image(img9, random(80, 2), random(-2, 80));
  image(img8, random(3, 3), random(5, 5));
  image(img7, random(-1, -1), random(1, -2));
  image(img1, random(700, 1), random(700, 1));
  image(img1, random(700, 710), random(700, -710));
  image(img1, random(600, -600), random(-600, 100));
  image(img9, random(-600, 100), random(-200, 60));
  image(img8, random(600, -500), random(50, -500));
  image(img9, random(-600, -100), random(-700, -600));
  image(img1, random(900, -600), random(-600, 100));
  image(img9, random(-600, 100), random(-900, 900));
  image(img8, random(-900, -500), random(-1000, -500));
  image(img1, random(900, -600), random(-600, 100));
  image(img9, random(-980, 100), random(-900, 950));
  image(img8, random(-990, -500), random(-1000, -550));
  image(img9, random(-1080, 100), random(-900, 950));
  image(img8, random(-930, -500), random(-1000, -550));
  popMatrix();

  pushMatrix();
  image(img10, random(40, 40), random(10, -40));

  popMatrix();
  
  pushMatrix();
    deg=deg+5;
  rad1=radians(deg); //(PI/180)*deg;
  x1=sin(rad1)*100+(width/2);
  y1=cos(rad1)*100+(height/2);
  point(x1,y1);
  fill(r,g,b);
  image(img2, x1, y1, 50, 50);
  popMatrix();

    pushMatrix();
      deg=deg+10;
  rad2=radians(deg);
  x2=sin(rad2)*50+(width/4);
  y2=cos(rad2)*50+(height/4);
  point(x2, y2);
  image(img3, x2, y2, 20, 20);
  popMatrix();

    if (deg>=360) {
      r=int(random(255));
      g=int(random(255));
      b=int(random(255));
      deg=0;
    } 
    else if (deg==180||deg==90 || deg==270) 
    {
      r=int(random(255));
      g=int(random(255));
      b=int(random(255));
    }
}




