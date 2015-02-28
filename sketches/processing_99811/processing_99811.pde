
int timer=0;
float fX=200;
float fY=200;
float eX=250;
float eY=250;
float pX=300;
float pY=300;

void setup(){
  size(500,500);
  frameRate(24);
}
void draw(){
  background(0);
  food();
}
void food(){
  //respawn
  timer++;
  if(timer >= 48){
    fX=random(width);
    fY=random(height);
    timer=0;
}
ellipse(fX,fY,30,30);

}
