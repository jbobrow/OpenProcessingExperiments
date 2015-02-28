
//Alvin Ha, 4-5 Computer Programming, Mr. Simon
//One Hundred Random Shapes

void setup()
{
  size(800, 800, P3D);
  smooth();
  frameRate(10);
  noStroke();
}

void draw()
{
  background(0);
  lights() ;
  int x = 1;
  while (x<101)
  {

    int transX = int(random(800));
    int transY = int(random(800));
    int transX2 = int(random(800));
    int transY2 = int(random(800));
    int q = int(random(800));
    int w = int(random(800));
    int e = int(random(2));
    int r = int(random(2));
    rotateX(e);
    rotateY(r);

    translate(transX, transY, 0);
    fill(255, 0, 0, 100);
    box(random(0,100));
    translate(-transX, -transY, 0);
    translate(transX2, transY2);
    sphere(random(0, 50));
    translate(-transX2, -transY2);
    translate(q, w);
    fill(105, 4, 111);
    sphere(random(0,100));
    translate(-q, -w);
    x++;
  }
}
