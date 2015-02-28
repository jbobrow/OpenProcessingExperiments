
float angle = 0.0;
float speed = 0.06;
float radius = 89;
float sx = 1.621;
float sy = 0.6;

void setup(){
  size(377,377);
  smooth();
  noStroke();
  //frameRate(30);
  background(0);
}

void draw(){
  fill(0,3);
  rect(0,0,width,height);
  
  angle += speed;
  float sinval = sin(angle);
  float cosval = cos(angle);
  
  float x = width/2 + (cosval * radius);
  float y = height/2 + (sinval * radius);
  
  
  
  float x2 = x + cos(angle * sx) * radius/2;
  float y2 = y + sin(angle * sy) * radius/2;
  
  fill(#FFFFFF);
  
  ellipse(x,y2,89,89);

  ellipse(width-x2,y,55,55);

  ellipse(y2,x2,34,34);

  ellipse(y2,height-x,21,21);
}


