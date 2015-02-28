
int y=125;
int speed=10;

void setup() {
  size(400,400);

}

void draw() {
  background(#4512AE);
  fill(#FFD773);
  rect(0,320,400,100);
  
  fill(#FF8300);
  
  noStroke();
  frameRate(30);
  
  ellipse(200,y,50,50);
  y=y+speed;
  
  if((y>=300)||(y<=125))
  {speed=speed*-1;
  }
  fill(0);
  rect(375,80,20,275);
  fill(255);
  rect(370,30,10,100);
  quad(320,105,335,145,355,145,370,105);
  fill(#A62F00);
  ellipse(345,105,50,10);

}

