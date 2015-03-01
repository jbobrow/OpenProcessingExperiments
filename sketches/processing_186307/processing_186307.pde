
int px; 
int py; 
float vx =random(0.5,2); 
float vy =random(0.5,2);
float i=0;

void setup() {
size(600,300);
colorMode(HSB);
background(255);
}
 
void draw() {
  px+=vx; 
  py+=vy;
  i=i+0.002;
  Float c=122+(122*sin(i));
  
  if(px>width||px<0){ 
  vx=vx*-1; 
  }
  if(py>height||py<0){
  vy=vy*-1;
  }

  if(px>width||px<0){
    fill(c,255,255);
  }
       
 ellipse(px,c,30,30);
}

