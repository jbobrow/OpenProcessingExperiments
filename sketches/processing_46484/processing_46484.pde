
int x = 500;
int y = 200;

PImage back;
PImage owl;

void setup() {
  size(500,500);
  smooth();
  owl = loadImage ("owlfly.png");
  back = loadImage ("fly.png");
}

void draw () {
  image(back,0,0);
  image (owl,x,y);
  x = x-3;
  
  if (x<-25) {
    x=500;
    y = y-50;
  }
}
  

