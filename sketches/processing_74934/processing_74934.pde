
//Eugene Liang, One Hundred Random Shapes, CP1, Mods 16-17


void setup()
{
  size (600,600,P3D);
}

void draw()
{
  frameRate(0.75);
  background(int(random(255)),int(random(255)),int(random(255)));
  lights();
  int i = 1;
  int s = int(random(10,30));
  while(i <= 100)
  {
    pushMatrix();
    fill(int(random(255)),int(random(255)),int(random(255)));
    ellipse(int(random(600)),int(random(600)),s,s);
    translate(int(random(600)),int(random(600)),int(random(-200,10)));
    box(int(random(27,40)));
    translate(int(random(-600)),int(random(-600)),int(random(200,-10)));
    i++;
    popMatrix();
  }
}
