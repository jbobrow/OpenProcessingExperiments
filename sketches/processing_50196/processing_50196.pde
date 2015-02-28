
// Asignment 3
//Max Perim, Andrew ID: mperim copyright 2012

float x=100;
float y=100;
float posX=random(1,5);
float posY= random(5,10);


void setup() {
  size(200, 200);
  background (255);
}
void draw() {
  x=x+posX;
  y=y+posY;

  if ((x > width)) {
    posX = posX * -1;
  }
  if (((x < 0))){
    posX=posX*-1;
  }
  if ((y > height)) {
    posY = posY * -1;
  }
if((y < 0)){
  posY=posY*-1;
}
fill (mouseX, mouseY, mouseX,mouseY); 
rect(x,y,10,10);
}
