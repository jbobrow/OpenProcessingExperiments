
int ellipsexpos = 20;
int ellipseypos = 20;
int speed = 1;
int xspeed = 1;
void setup()
{
  size (200,200);
  background(255,255,255,255);
}
void draw()
{
  background(255,255,255,255);
  fill(255,0,0);
 ellipse(ellipsexpos,ellipseypos,20,20);
 ellipseypos +=speed;
 ellipsexpos +=xspeed;
 if(ellipsexpos>200){
 xspeed =-5;
 }
  if(ellipsexpos<0){
 xspeed =4;
 }
   if(ellipseypos>200){
 speed =-3;
 }
    if(ellipseypos<0){
 speed =2;
 }
}
