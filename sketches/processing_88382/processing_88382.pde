
// Moving Spotlights - code by Rodrigo Siqueira - http://js.do/
float k = 0;
void setup() {
  size(620,400); 
}
void draw() {
  k=k+0.005;
  background(20,30,50);
  fill(255,240,200,110);
  for (int i=0; i<=10; i++) {
    float x1 = width/2-sin(i*k/10)*160;
    float y1 = sin(k/5)*70+20*sin(i*k/2)+70;
    float x2 = sin(i/4)*i*50+150;
    float y2 = height;
    float x3 = x2-40*0;
    float y3 = y2;
    float x4 = x1+50;
    float y4 = y1;
    quad(x1,y1,  x2,y2, x3,y3,  x4,y4);
  }
  if (k>=10*2*PI) {
    k=0;
  }
}
