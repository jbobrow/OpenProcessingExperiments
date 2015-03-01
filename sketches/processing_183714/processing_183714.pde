
float t = 0.0;
float step = 1.02;
void setup()
{
  frameRate(30);
  size(300,300);
  fill(100,160,255);
  smooth();
  textSize(15);
}
void draw()
{
  background(255);
  translate(0,200);
  stroke(0,117,250, 120);
  for (int i=0; i<width; i+=50) {
    float posY = noise((i+t)/300.0 + 7) * mouseY/2;
    text("wasser", i,posY);
    t+=step;
  }
}
