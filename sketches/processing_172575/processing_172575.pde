
 ArrayList poop;
boolean flag=false;
int distance=50;
void setup()
{
  size(1000,300);
  smooth();
  poop = new ArrayList();
  for (int i=0;i<100;i++)
  {
    Particle P = new Particle();
    poop.add(P);
  }
}
void mousePressed()
{
}
void draw()
{
  background(-1);
  for (int i=0;i<poop.size();i++)
  {
    Particle Pn1 = (Particle) poop.get(i);
    Pn1.display();
    Pn1.update();
    for (int j = i + 1; j < poop.size(); j++) {
      Particle Pn2 = (Particle) poop.get(j);
      Pn2.update();
      if (dist(Pn1.x, Pn1.y, Pn2.x, Pn2.y)< distance)
      {
        for (int k = j + 1; k < poop.size(); k++) {
          Particle Pn3 = (Particle) poop.get(k);
          if (dist(Pn3.x, Pn3.y, Pn2.x, Pn2.y)< distance) {
            if (flag) {
              stroke(255, 10);
              fill(Pn3.c, 95); // method to access the class property
            }
            else {
              noFill();
              strokeWeight(1);
              stroke(0, 20);
            }
            beginShape(TRIANGLES);
            vertex(Pn1.x, Pn1.y);
            vertex(Pn2.x, Pn2.y);
            vertex(Pn3.x, Pn3.y);
            endShape();
          }
 
          Pn3.update();
        }
      }
    }
  }
}
 
void keyPressed()
{
  flag=!flag;
}
class Particle {
  float x, y, r;
  color c;
  int i=1, j=1;
  Particle( )
  {
    x = random(0, width);
    y = random(0, height);
    r = random(1,5);
    int j = (int)random(0, 4);
    if (j==0)
    {
      c = color(#05CDE5);
    }
    if (j==1)
    {
      c = color(#FFB803);
    }
    if (j==2)
    {
      c = color(#FF035B);
    }
    if (j==3)
    {
      c = color(#3D3E3E);
    }
  }
 
  void display()
  {
    pushStyle();
    noStroke();
    fill(c);
    ellipse(x, y, r, r);
    popStyle();
  }
 
  void update()
  {
    x = x + j*0.01;
    y = y + i*0.01;
    if (y > height-r) i=-1;
    if (y < 0+r) i=1;
    if (x > width-r) j=-1;
    if (x < 0+r) j=1;
  }
}
