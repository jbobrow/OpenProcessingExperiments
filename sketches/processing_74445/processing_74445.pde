
// Lucky Wen, Hundred Random Shapes, CP1 mods 16-17

void setup()
{
  size(300, 300, P3D);
  frameRate(15);
}

void draw()
{
  background(0);
  smooth();
  camera(3*mouseX-100, 3*mouseY-100, 3*mouseY-200, 150, 150, 0, 0, 1, 0);
  int numshapes=0;
  while (numshapes<101)
  {

    int x=int(random(0, 256));
    int y=int(random(0, 256));
    int z=int(random(0, 256));
    stroke(x, y, z, random(150, 250));
    strokeWeight(4);
    fill(y, z, x, random(150, 250));


    pushMatrix();
    int offsetX= int(random(0, 300));
    int offsetY= int(random(0, 300));

    translate(offsetX, offsetY, 0);
    int po=int (random(15, 30));

    box(po);
    popMatrix();
    numshapes++;
  }
}



