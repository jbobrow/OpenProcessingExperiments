
void setup() {
  size(400,400);
  background(200);
  noStroke();
  frameRate(40);
  smooth();
}

//float a= 1;
void draw() {
  background(255);
  float a = sin(frameCount/12.0)+1.1;
  float b = sin(frameCount/2.7)*10+10;
  float c = cos(frameCount/31.0)*3+10;
  translate(sin(frameCount/12.0)*30+200,cos(frameCount/5.0)*40+200);
  
  fill(0,255,0,50);
  drawFigure(b, 18);
  
  fill(255,0,0,50);
  drawFigure(a,b);
  
  fill(0,255,255,20);
  drawFigure(b,a);

  fill(255,0,255,20);
  drawFigure(a,c);

}

void drawFigure(float a, float b) {
  for (int x=-200; x < 200; x += 10)
    for (int y = -200; y < 200; y += 10) {
      float r = sqrt(x*x+y*y);
      float newx = x*abs(log(a*r)/r) * b;
      float newy = y*abs(log(a*r)/r) * b;
      ellipse(newx,newy,5,5);
    }
}

