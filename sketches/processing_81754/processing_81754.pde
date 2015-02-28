
Tri a,b,c,d,e, f;


void setup() {

size(400, 400);
background(255);


a = new Tri (0,0, 0, 255, 0);
b = new Tri (40,50, 0, 255, 0);
c = new Tri (200, 200,  0, 0, 255);
d = new Tri (0, 0, 200, 0, 100);
e = new Tri (0, 0, 0, 100, 100);
f = new Tri (20, 20, 255, 0, 0);
}

void draw() {
 frameRate(100);
  a.update();
  a.display();
  
  frameRate(50);
  b.update();
  b.display();
  
  frameRate(20);
  c.update();
  c.display();
  
  frameRate(100);
  d.update();
  d.display();
  
  frameRate(50);
  e.update();
  e.display();
  
  frameRate(20);
  f.update();
  e.display();
  
 
}
/*
void mousePressed() {
 saveFrame("##.png"); 
}
*/

//ahora la clase


class Tri {
  float xpos;
  float ypos;
  float xoff;
  float c1;
  float c2;
  float c3;
  float rota;

  Tri (float x, float y, int ca, int cb, int cd) {
    xpos = x;
    ypos = y;
    c1 = ca;
    c2 = cb;
    c3 = cd;
  }


  void update() {
    xpos = xpos+15;
    ypos = ypos+7;
    rota = rota+0.1;

    if (ypos > height) {
      ypos*= -1;
      xpos*=-1;
    }
  }

  void display() {
    pushMatrix();
    translate (width/2, height/2);
    scale(0.3);
    rotate (rota);
    stroke(c1,c2,c3);
    noFill();
    beginShape();
    vertex(1+xpos, 1+ypos);
    vertex(40+xpos, 20+ypos);
    vertex(20+xpos, 50+ypos);
    endShape(CLOSE);
    popMatrix();
  }
}
