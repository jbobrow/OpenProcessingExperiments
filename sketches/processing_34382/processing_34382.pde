
int n=0;

void setup(){
  size(400,400,P3D);
  colorMode(HSB,100);
  background(100);
}

void draw(){
  background(100);
  translate(58, 48, 0); 
  rotateX(sin(n)*0.1);
  box(40);
  n++;
}

