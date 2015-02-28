
ArrayList poop;
int distance =50;
boolean flag=true;
void setup()
{
  size(500, 500);
  smooth();
  poop = new ArrayList();
  for (int i=0;i<120;i++) {
    PVector PD = new PVector(random(-150, 150), random(-150, 150));
    Dots D = new Dots(PD);
    poop.add(D);
  }
}


void draw()
{
  background(255);
  translate(width/2, height/2);
  pushStyle();
  fill(0);
  stroke(0,50);
  ellipse(0,0,400,400);
  popStyle();
  //----------------
  for (int i=0;i<poop.size();i++) {
    Dots dots1 = (Dots) poop.get(i);
    dots1.display();
    dots1.update();
    for (int j=i+1;j<poop.size();j++) {
      Dots dots2 = (Dots) poop.get(j);
      dots2.update();
      if (dist(dots1.location.x, dots1.location.y, dots2.location.x, dots2.location.y)<distance) {
        for (int k=j+1;k<poop.size();k++) {
          Dots dots3 = (Dots) poop.get(k);
          dots3.update();
          if (flag) {
            fill(dots3.c, 50);
            noStroke();
          }
          else
          {
            noFill();
            stroke(255,50);
          }
          if (dist(dots3.location.x, dots3.location.y, dots2.location.x, dots2.location.y)<distance) {
            beginShape();
            vertex(dots3.location.x, dots3.location.y);
            vertex(dots2.location.x, dots2.location.y);
            vertex(dots1.location.x, dots1.location.y);
            endShape();
          }
        }
      }
    }
  }
  //----------------
}
void keyPressed()
{
  flag=!flag;
}
class Dots {
  PVector location;
  PVector velocity;
  color c;
  int radius=200;
  Dots(PVector _PV)
  {
    location = _PV;
    int j = (int)random(0, 5);
    if (j==0) c = color(#05CDE5);
    if (j==1) c = color(#FFB803);
    if (j==2) c = color(#FF035B);
    if (j==3) c = color(#3D3E3E);
    if (j==4) c = color(#D60FFF);
    float xt = random(-0.01, 0.01);
    float yt = random(-0.01, 0.01);
    velocity = new PVector(xt, yt );
  }

  void display()
  {
    fill(c);
    noStroke();
    ellipse(location.x, location.y, 2, 2);
  }
  void update()
  {
    if (dist(location.x, location.y, 0, 0)>radius) {
      velocity.mult(-1);
      location.add(velocity);
    }
    else {
      location.add(velocity);
    }
  }
}
