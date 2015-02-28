
void setup()
{
 size(400, 600);
 background(0, 0, 0);
 smooth();
 frameRate(10);
}

void draw()
{
  fill(random(0,255),random(0,255),random(0,255));
ellipse(mouseX,mouseY,80,80);

}
