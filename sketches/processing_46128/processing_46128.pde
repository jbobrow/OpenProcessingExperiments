
float x,y,g,angle,a,b,z;

void setup(){
  size(500,500);
  x =0;
  y = 0;
  g=0;
  a=0;
  b=0;
  z = 0;
  angle = 0;
  smooth();
}

void draw(){
  x = sin(radians(angle)) * g + width/2;
  y = tan(radians(angle)) * g + height/2;
  a = cos(radians(angle)) * angle/4 + width/2;
  b = sin(radians(angle)) * angle/4 + height/2;
  z = cos(radians(angle))+ width/2;
  ellipse(x,y,x/5,y/5);
  ellipse(a,b,x,y);
  ellipse(y,x,z/2,z*2);
 
  angle+=0.5;
  g+=0.2;
  z+=0.002;

  
  fill(random(50,65),random(130,240),random(100,140),20);
  stroke(0);
 // ellipse(width/2,height/2,350,350);
}

