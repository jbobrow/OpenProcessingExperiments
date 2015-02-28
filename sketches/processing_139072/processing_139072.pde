
void setup() {
 
  size(600,600);
}

float t = 0;
float x = 0;
float t1 = 1;
float x1 =0;


void draw() {
  
  
  
 background(245,90,163);
 
  float x = map(noise(t),0.,1.,0, width);
  triangle(x,x+0.1,x+0.3,x+0.5,x+0.2,x+0.4);
   triangle(x,x+0.2,x+0.4,x+0.1,x+0.5,x+0.3);
  stroke(255,206,70);
  strokeWeight(100);
  t +=0.005;
  
 float x1 = map(noise(t1),0.,1.,0,width);
triangle(x1,x1+0.1,x1+0.3,x1+0.5,x1+0.2,x1+0.4);
triangle(x1,x1+0.2,x1+0.4,x1+0.3,x1+0.1,x1+0.5);
stroke(140,50,245);
strokeWeight(150);
 t1 +=0.1;  
  
}
