
/* @pjs preload="batt_card.gif,batt_cardalpha.gif,batteat_skull.gif,batteat_skullalpha.gif,body_body0000.gif,body_body0001.gif,body_body0002.gif,body_body0003.gif,body_body0004.gif,body_body0005.gif,body2_vortex0000.gif,body2_vortex0001.gif,body2_vortex0002.gif,body2_vortex0003.gif,body2_vortex0004.gif,head.gif,headalpha.gif,head2.gif,poop0000.gif"; */ 

int bodyFrame = 6;
int bodyframe = 0;
int vortexFrame = 5;
int vortexframe = 0;
int skullFrame = 6;
int skullframe = 0;

PImage batt, battalpha, batteat, batteatalpha, head, head2, headalpha,poop;
PImage [] body = new PImage[bodyFrame];
PImage [] body2 = new PImage[vortexFrame];

float mx = -100;
float my = -10;
float delay = 100.0;
float sinval;
float angle;
float speed = -.9;

void setup() {
  size(800, 700);
  batt = loadImage("batt_card.gif");
  battalpha = loadImage("batt_cardalpha.gif");
  batt.mask(battalpha);
  batteat = loadImage("batteat_skull.gif");
  batteatalpha = loadImage("batteat_skullalpha.gif");
  batteat.mask(batteatalpha);
  body[0] = loadImage("body_body0000.gif");
  body[1] = loadImage("body_body0001.gif"); 
  body[2] = loadImage("body_body0002.gif");
  body[3] = loadImage("body_body0003.gif"); 
  body[4] = loadImage("body_body0004.gif");
  body[5] = loadImage("body_body0005.gif");
  body2[0] = loadImage("body2_vortex0000.gif");
  body2[1] = loadImage("body2_vortex0001.gif"); 
  body2[2] = loadImage("body2_vortex0002.gif");
  body2[3] = loadImage("body2_vortex0003.gif"); 
  body2[4] = loadImage("body2_vortex0004.gif");
  head = loadImage("head.gif");
  head2 = loadImage("head2.gif");
  headalpha = loadImage("headalpha.gif");
  head.mask(headalpha);
  head2.mask(headalpha);
  poop = loadImage("poop0000.gif");
  
  frameRate(12);
}

void draw() {
  noCursor();
  background (255);
  pushMatrix();
  interpolate();
  translate (mx-100,my-150);
  angle = angle + speed;
  sinval = sin(angle);
  vortexframe = (vortexframe+1) % vortexFrame;
  int vortexoffset = 0;
  bodyframe = (bodyframe+1) % bodyFrame;
  int bodyoffset = 0;
  
  if (abs(my-mouseY)>20 && abs(mx-mouseX)>5){
    image (body[(bodyframe+bodyoffset) % bodyFrame],0,135);
    bodyoffset += 2;
    image (head,-35,sinval*15-85);
  }
  else{
    image (head2,200,sinval*30-250);
    image (body2[(vortexframe + vortexoffset) % vortexFrame],0,sinval*20+40);
    vortexoffset +=2;
  }
  interpolate();
  popMatrix();
  pushMatrix();
  if (abs(my-mouseY)>20 && abs(mx-mouseX)>5){
    battery(true);
  }
  else{
    battery (false);
  }
  popMatrix();
}

void battery(boolean test){
  int skulloffset = 0;
  if (test==true){
    image (batt, mouseX-50, mouseY-20);
  }
  else{
  image (batteat, mouseX+100+random(-20,20), mouseY+random(-20,20));
  if (mousePressed==true){
    image(poop, mouseX, mouseY);
  }
  }
}

void interpolate(){
  float diffx = mouseX-mx;
  if(abs(diffx) > 1) {
    mx = mx + diffx/delay;
  }
  float diffy = mouseY-my;
  if(abs(diffy) > 1) {
    my = my + diffy/delay;
  }
}



