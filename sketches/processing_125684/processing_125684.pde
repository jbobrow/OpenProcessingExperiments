

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

PImage i1;
PImage i2;
float mood;
void setup() 
{



  IMGHEIGHT=400;
  IMGWIDTH=400;
 CANVASHEIGHT=600;
  CANVASWIDTH=600;
  frameRate(6);

  

  size(600,600);
  background(0,0,0);
  i1=loadImage("1.png");
  i2=loadImage("2.png");
  setParms();
  mood=random(1);
}
void draw()
{
  noStroke();
  if (random(300)<15){mood=random(1);setParms();};
 
  if (random(1)>mood){
    show(i2);
  }
    else{
    show(i1);
  }
}
void show(PImage i){
color c = color(255,255,255, o);

  tint(c);


  if (random(1)>mood) {
    //setParms();
  };
  
  if (random(1)>mood) {
    shiftColor();
  };
  if (random(1)>mood) {
    shiftSize();
  };
  if (random(1)>mood) {
    shiftPosition();
  };
  if (random(1)>mood) {
    //shiftAlpha();
  };
  if (random(1)>mood) {
   // setColor();
  };
  if (random(1)>mood) {
   // setSize();
  };

  if (random(1)>mood) {
    //setPosition();
  };
  if (random(1)>mood) {
   // setAlpha();
  };
 
//if (random(1)>mood) {filter(DILATE);};
//if (random(1)>mood) {filter(ERODE);};
//if (random(1)>mood) {filter(BLUR);};

  image(i, x,y,s*IMGWIDTH, s*IMGHEIGHT);
 
  }

void setParms() {
  
  setColor();
  setSize();
  setPosition();
  setAlpha();
}

void setColor() {

}

void setSize() {
  s=random(1.4,1.6);

 
}

void shiftColor(){
}

void setPosition() {
  x=random(-.01*CANVASWIDTH, .01*CANVASWIDTH);
  y=random(-.01*CANVASHEIGHT, .01*CANVASHEIGHT);


}

void setAlpha() {
  o=random(12,24);


}



void shiftSize() {
  s=s*random(.95,1.05);
 
}

void shiftPosition() {
  x=x*random(.95,1.05);
  y=y*random(.95,1.05);
}

void shiftAlpha() {
  o=o*random(.95,1.05);
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



