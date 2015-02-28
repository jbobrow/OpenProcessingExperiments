
float px, py, px2, py2;
float angle, angle2;
float radius = 50;
float frequency = 2;
float frequency2 = 2;
float x, x2;
 
 
void setup(){
  size(400, 250);
  background (0);
}
 
void draw(){
  fill(0,15);
  rect(0,0,width, height);
  noStroke();
  fill(0);
 
 
  px = width/8 + cos(radians(angle))*(radius);
  py = 150 + sin(radians(angle))*(radius);
  //rectMode(CENTER);
  fill(250,150,0);
   
  
  angle2 = 0;
 
   
  for (int i = 0; i< width; i++){
    px2 = width/8 + cos(radians(angle2))*(radius);
    py2 = 70 + sin(radians(angle2))*(radius);
    point(width/radius+i, py2);
    angle2 -= frequency2;
  }
 
 
  noStroke();
  ellipse(width/radius+x, py, 40, 40);
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


