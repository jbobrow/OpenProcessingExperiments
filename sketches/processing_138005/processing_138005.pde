
float px, py, px2, py2;
float angle, angle2;
float radius = 25;
float frequency = 2;
float frequency2 = 2;
float x, x2;
 
 
void setup(){
  size(500, 300);
  background (255);
}
 
void draw(){
  fill(0, 8);
  rect(0,0,width, height);
  noStroke();
  fill(255);
 
 
  px = width/8 + cos(radians(angle))*(radius);
  py = 150 + sin(radians(angle))*(radius);
  //rectMode(CENTER);
  fill(255,0,0);
   
  
  angle2 = 0;
 
   
  for (int i = 0; i< width; i++){
    px2 = width/8 + cos(radians(angle2))*(radius);
    py2 = 75 + sin(radians(angle2))*(radius);
    point(width/radius+i, py2);
    angle2 -= frequency2;
  }
 
 
  noStroke();
  ellipse(width/radius+x, py, 50, 50);
  angle -= frequency;
  x+=1;
 
  
  if (x>= width-60) {
    x = 0;
    angle = 0;
  }
  
}
void mousePressed() {
  pct = 0.0;
  beginX = x;
  beginY = y;
  endX = mouseX;
  endY = mouseY;
  distX = endX - beginX;
  distY = endY - beginY;
}
