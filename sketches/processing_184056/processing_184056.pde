
float angle = 0;
int distance = 80;
float x1,y1, x2,y2, x3,y3, centerX, centerY;
 
void setup(){
  size (400,400);
  background(200);
  centerX = 300;
  centerY = 300;
  smooth();
  frameRate(60);
}
 
 
void draw(){
  fill(20,10);
  noStroke();
  rect(0,0,width/2,height/2); 
  fill(random(233));
 
  x1 = centerX+(distance*cos(angle));
  y1 = centerY+(distance*sin(angle));
 
  x2 = centerX+(distance*cos(angle+PI*2/3));
  y2 = centerY+(distance*sin(angle+PI*2/3));
 
  x3 = centerX+(distance*cos(angle+PI*4/3));
  y3 = centerY+(distance*sin(angle+PI*4/3)); 
  triangle(x1,y1,x2,y2,x3,y3);
  ellipse(x1,y1, mouseX, mouseY);
  angle+=10;
  angle+=+100;
}

