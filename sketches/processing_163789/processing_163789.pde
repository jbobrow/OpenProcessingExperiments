
void setup()
{
  size(700,700, P3D);
  background(0);
  lights();
}

void draw()
{
  background(0);
fill(200,230,170,20);
stroke(255,255,255,60);
pushMatrix();
translate(500, height*0.35, -200);
rotate(radians(mouseY));
sphere(280);
popMatrix();

fill(250,10,30,100);
stroke(255,255,255,60);
pushMatrix();
translate(80, 600, -100);
rotate(radians(mouseX));
sphere(80);
popMatrix();
}

