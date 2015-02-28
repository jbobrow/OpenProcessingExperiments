
//Catherine Hong
//PETALDANCE - 2013

PImage p;
float xaxis, yaxis;
float ranx, rany;
float x1, y1, s1;
int counter;
float red, green, blue, alph;
boolean dilate;
boolean loop=true;

void setup() {
  size(1000, 1000);
  p=loadImage("upsidedownpetal.png");
  imageMode(CORNER);
  frameRate(35);
  background(255);
  counter=0;

  ranx=0.2;
  rany=1.5;

  xaxis=width/2;
  yaxis=height/2;

  s1=.1;

  red=random(100, 255);
  green=random(0, 100);
  blue=random(0, 100);
  alph=0;
  dilate=true;
}

void draw() {
  red++;
  green--;
  alph++;
  tint(red, green, blue, alph);
  pushMatrix();
  translate(xaxis, yaxis);
  rotate(frameCount);
  float bgw=p.width;
  float bgh=p.height;
  x1=50*sin(frameCount);
  y1=50*cos(frameCount);
  if (dilate)
    s1=s1+.1;
  else
    s1=s1-.1;
  image(p, x1, y1, bgw/s1, bgh/s1);
  popMatrix();
}

void mouseClicked() {

  dilate=!dilate;
  ranx=random(0.1, 0.5);
  rany=random(0.75, 3);
  red=random(100, 255);
  green=random(0, 100);
  blue=random(0, 100);
  alph=random(50, 100);
  tint(red, green, blue);
}

void mouseMoved() {
  red=random(100, 255);
  green=random(0, 100);
  blue=random(0, mouseX);
  alph=random(50, 100);
  dilate=true;
  s1=.1;
  xaxis=mouseX;
  yaxis=mouseY;
  counter++;
}

void keyPressed() {
  if (key==' ')
  {
    loop=!loop;
    if (loop)loop();
    else noLoop();
  }
  else if (key=='s')
  {
    save("groovymaaan" + counter + ".png");
  }
}



