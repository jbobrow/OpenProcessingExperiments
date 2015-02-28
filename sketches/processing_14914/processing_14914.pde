
float y=0;
 float yspeed=1;
 float x=0;
 float xspeed=1;
PImage cat;

void setup(){
  size(300,300);
  cat=loadImage ("image1.jpg");
}
 
 void draw(){ 
   y=y+yspeed;
  x=x+xspeed;
  tint(255,255,255,10);
   image (cat, mouseX, mouseY);
   
    if (y > 300) 
  {yspeed=-random(300);}
  else if (y < 0) {
  yspeed = random (300);}
  if (x < 300)
  {xspeed=-random(300);}
  else if (x < 0)
  {xspeed = random (300);}
   
 }

