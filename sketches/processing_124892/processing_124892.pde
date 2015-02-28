
int IMGHEIGHT;
int IMGWIDTH;
int CANVASHEIGHT;
int CANVASWIDTH;
float r;
float g;
float b;
float o;
float s;
float x;
float y;

PImage flute;
void setup() 
{



  IMGHEIGHT=497;
  IMGWIDTH=459;
 CANVASHEIGHT=600;
  CANVASWIDTH=800;
  frameRate(10);

  setParms();

  size(800,600);
  background(255,255,255);
  flute=loadImage("play.png");
}
void draw()
{
  noStroke();
  color c = color(r, g, b, o);
 
  tint(c);


  if (random(400)<2) {
    setParms();
  };
  if (random(400)<200) {
    shiftColor();
  };
  if (random(400)<200) {
    shiftSize();
  };
  if (random(400)<200) {
    shiftPosition();
  };
  if (random(400)<200) {
    shiftAlpha();
  };
  if (random(400)<20) {
    setColor();
  };
  if (random(400)<20) {
    setSize();
  };
  if (random(400)<20) {
    setPosition();
  };
  if (random(400)<20) {
    setAlpha();
  };
 if (random(400)<2) {filter(DILATE);};
 if (random(400)<2) {filter(ERODE);};
  if (random(400)<2) {filter(BLUR);};
  image(flute, x,y,s*IMGWIDTH, s*IMGHEIGHT);
  
  }

void setParms() {

  setColor();
  setSize();
  setPosition();
  setAlpha();
}

void setColor() {
  r=int(random(128));
  g=int(random(128));
  b=int(random(128,256));
  g=r;
}

void setSize() {
  s=random(.3,1.2);
}

void setPosition() {
  x=random(-.6*CANVASWIDTH, .6*CANVASWIDTH);
  y=random(-.6*CANVASHEIGHT, .6*CANVASHEIGHT);
}

void setAlpha() {
  o=random(8,16);
}


void shiftColor() {
  r=r*random(.9, 1.1);
  g=g*random(.9, 1.1);
  b=b*random(.9, 1.1);
}

void shiftSize() {
  s=s*random(.9, 1.1);
}

void shiftPosition() {
  x=x*random(.9, 1.1);
  y=y*random(.9, 1.1);
}

void shiftAlpha() {
  o=o*random(.9, 1.1);
}

void keyPressed()
{
  if ( key == 's' ) save(str(millis())+".jpg");
  if ( key == 'r' ) setup();
  if ( key == 'q' ) exit();
}

void stop()
{

  super.stop();
}


