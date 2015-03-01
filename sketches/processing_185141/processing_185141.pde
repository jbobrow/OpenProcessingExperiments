
int x=mouseX;
int xspeed=1;
int yspeed=1;
int y=mouseY;
int s=255;
int sspeed=1;
void setup(){
  size(400,400);
  noStroke();
  smooth();
  background(74,1,0);
}
void draw(){
  x=x+xspeed;
  y=y+yspeed;
  fill(173,63+mouseX/2,68+mouseX/2,100);
  ellipse(mouseX,mouseY,15,15);
  if (mousePressed==true){
    fill(74,1,0);
   ellipse(mouseX,mouseY,30,30);
  }
}
  
