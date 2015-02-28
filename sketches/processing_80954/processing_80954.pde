
float cx1;
float cy1;
float cx2;
float cy2;
float x2,y2;

void setup()
{
  size(400,400);
  smooth();
  noFill();  
  strokeWeight(5);
  frameRate(1);
}
void draw(){
 // background(255);
  stroke(random(0,255),random(0,255),random(0,255));
  cx1=random(0,399);
  cy1=random(0,399);
  cx2=random(0,399);
  cy2=random(0,399);
 x2=random(0,399);
  y2=random(0,399);

bezier(0,0,cx1,cy1,cx2,cy2,x2,y2);
}

