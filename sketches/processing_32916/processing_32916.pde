
PFont CC101;
PFont whatup;
float x=4;
float y=1;
float a=3;
float b=5;
float f=2;
float h=3;
float c=1.5;
float d=3.5;
float bpos=random(30,380);
float apos=random(0,250);
float xpos=random(0,250);
float ypos=random(30,380);
float fpos=random(0,250);
float hpos=random(30,380);
float cpos=random(0,250);
float dpos=random(30,380);

void setup() {
  size(400,400);
}
void draw() {
  background(0,0,0);
  fill(150,0,255);
  CC101=loadFont("Amienne-48.vlw");
  textFont(CC101,50);
  text("World!",xpos,ypos);
// whatup=loadFont("Arnprior-48.vlw");
 //textFont(whatup,50);
  fill(80,0,90);
  text("Hello", fpos,hpos);
  fill(150,0,0);
   if (ypos<=30 || ypos>=height-20) {
    y=y*-1;
  }
  if (xpos<=0 || xpos>=width-150) {
    x=x*-1;
  }
  if (hpos<=30 || hpos>=height-20) {
    h=h*-1;
  }
  if (fpos<=0 || fpos>=width-150) {
    f=f*-1;
  }

  ypos=ypos+y;
  xpos=xpos+x;
 fpos=fpos+f;
 hpos=hpos+h;
  }



