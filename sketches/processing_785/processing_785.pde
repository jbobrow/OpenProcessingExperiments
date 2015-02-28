
/* 
By Sajid Saiyed 
http://www.ssdesigninteractive.com/g2 
http://www.ssdesigninteractive.com/blog 
Do let me know if you happen to imrovise this code 

Flowers (v.0.0.1)  --- {early explorations}
*/ 

float w = width;
float h = height;
float r;
void setup()
{
  size(500, 500, P3D);
  noStroke();
  smooth();
  background(255);
  flower(random(10, 100), random(10, 100), random(10, 100), random(10, 100));
  r = random(10, 30);
}

void draw(){
  
}

public void flower(float p1x, float p1y, float p2x, float p2y){
  background(255);
  fill(134,231,111,90);
  translate(width/2, height/2);
  for(int i=0; i<10; i++){
    bezier(0,0, -1*p1x, p1y, -1*p2x, p2y, 0, p2y);
    bezier(0,p2y, p2x, p2y, p1x, p1y, 0, 0);
    rotate(r);
  }
  fill(211,123,111, 70);
  ellipseMode(RADIUS);
  ellipse(0,0,10,10);
  //translate(w/2, h/2);
}

void mousePressed(){
  flower(random(10, 100), random(10, 100), random(10, 100), random(10, 100));
  r = random(10, 30);
}

