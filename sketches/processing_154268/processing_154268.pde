
ArrayList poop;
void setup()
{
  size(400, 400);
  smooth();
  poop = new ArrayList();
  background(255);
}

void mouseDragged()
{
  PVector Pnew = new PVector(mouseX, mouseY);
  Triangles Tri = new Triangles(Pnew, 150);
  poop.add(Tri);
}

void draw()
{
  background(255);
  for (int i=0;i<poop.size();i++) {
    Triangles T = (Triangles) poop.get(i);
    T.display();
    T.update();
    if (T.i>40)
      poop.remove(i);
  }
}

class Triangles {

  PVector PV;
  float l, i;
  color c;
  Triangles(PVector _PV, int _l) {
    PV = _PV;
    l = _l;
    int i = (int)random(0, 5);
    if (i == 0) c = color(#FF0808);
    if (i == 1) c = color(#00C5FF);
    if (i == 2) c = color(#FFB700);
    if (i == 3) c = color(#B2FF00);
    if (i == 4) c = color(#FF0077);
  }

  void display() {
    noFill();                                                                                                                                                             
    stroke(c);
    int k = (int)random(0, 2);
    if (k==1)strokeWeight(8);
    if (k==0)strokeWeight(1+i/100);
    pushMatrix();
    translate(PV.x, PV.y);
    scale(i/20);
    rotate(frameCount*radians(90) / 20);
    //-------------------------------------
    beginShape(TRIANGLES);
    vertex(0, - l*sqrt(3)/3);
    vertex(- l/2, l*sqrt(3)/6);
    vertex(l/2, l*sqrt(3)/6);
    endShape();
    //-------------------------------------
    popMatrix();
  }

  void update()
  {
    i=i+0.1;
  }
}

