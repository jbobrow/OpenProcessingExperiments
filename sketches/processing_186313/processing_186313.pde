
int px; 
int py; 
float vx =random(0.5,2); 
float vy =random(0.5,2);
float c=0;

void setup() {
size(500,300);
colorMode(HSB);
}
 
void draw() {
  px+=vx; 
  py+=vy;
  c=c+0.02;
  float i=122+(122*sin(c));
  float j=122+(122*sin(c+PI));
  if(px>width||px<0){ 
  vx=vx*-1; 
  }
  if(py>height||py<0){
  vy=vy*-1;
  }
  if(px>width||px<0){
    background(i,255,255);
  }
  if(py>height||py<0){
    fill(j,255,255);
  }
  ellipse(px,py,30,30);
 }

