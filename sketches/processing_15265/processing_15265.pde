
PImage texture1;
PImage texture2;
PImage texture3;
int x=0;
int y=0;
int xspeed=2;
int yspeed=7;

void setup(){
  size(700,600);
  texture1 = loadImage("coral.jpg");
  texture2 = loadImage("paper-texture.jpg");
  texture3 = loadImage("plant-texture.jpg");
  
}

void draw(){
  
  x=x+xspeed;
  y=y+yspeed;
  tint(100,0,100,60);
  image(texture1, 30, 30);

  tint(255,50,100,30);
  image(texture3, x, 450);
  if (x>width){
    xspeed=xspeed*-1;
  } else if (x<0) {
    xspeed=xspeed*-1;}

  tint(235,200,70,50);
  image(texture2, 0, y);
  if (y>height){
    yspeed=yspeed*-1;
  } else if (y<0) {
    yspeed=yspeed*-1;}

  
}

