
void setup ()
{
  size(640, 640, P3D);
  background(50, 50, 100);
  

}

float r=random(255);
float i=random(480);
int g=0;
int b=0;

void draw()
{
  directionalLight(126, b, 126, 0, 30, -1);
  ambientLight(255, 100, 100);
  pushMatrix();
  translate(320, 320, -100);

  stroke(r+100);
  fill(r, g, b);
  r=random(255);
  background(r, g-100, b/2);
  r=random(100);
  i=random(400);
  rotate(frameCount / 10.5);
  sphere(i);
  sphere(r/50);
  stroke(r);
  line(r, r, mouseX, mouseY);
  line(i, i, i+r, r*20);
  line(i, r+20, i/2, i*30);
  line(i, r+20, i+2, i*20);
  line(r+i, r+i, r*r, r+50);
  line(r+i, r-i, r*r, r+10);
  translate(50, 50, -100);
  rotate(frameCount * 5.5);
    popMatrix();
          textSize(48);
  text("Hello, world", r, i); 
      popMatrix();
}
