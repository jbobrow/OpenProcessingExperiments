
float px, py, px2, py2;
float angle, angle2;
float radius = 90;
float frequency = 2;
float frequency2 = 2;
float x, x2;
  
  
void setup(){
  size(400, 250);
  background (0);
}
  
void draw(){
  fill(0,10);
rect(0,0,width, height);
  noStroke();
  fill(random(255),random(255),random(255));
  
  
  px = width/8 + cos(radians(angle))*(radius);
  py = 150 + sin(radians(angle))*(radius);
 
  fill(90,60,150);
    
   
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

