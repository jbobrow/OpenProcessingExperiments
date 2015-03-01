
float i=1;
float r=2;
float a=0.1;
float t=11;
float inc=0.8;

void setup(){
size(800,400,P2D);
}

void draw(){
  background (255);
  stroke(0.0012);

  for(i=0;i<200;i+=1){
  a=noise(i/64)*9+t/r;
  point (200+cos(a)*0.5,200+sin(a)*r/2);
  r=abs(noise(i))*mouseX;
  point (300+cos(a)*r, 200+sin(a)*r/2);
  r=abs(noise(i)*inc)*mouseY;
  t++;
  }
}

