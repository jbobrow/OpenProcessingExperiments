
int population = 50;
Ant[] ants = new Ant[population];

void setup() {
  size(400,400);
  for (int i=0;i<ants.length;i++) {
    ants[i] = new Ant(random(width*.5), random(height*.25));
  }
}

void draw() {
  background(200);
  pushMatrix();
  translate(mouseX,mouseY);
  rect(0,0,width*.5,height*0.25);
  for (int i=0;i<ants.length;i++) {
    ants[i].display();
  }
  popMatrix();
}

class Ant {
  float x;
  float y;
  
  Ant(float i, float j) {
    x = i;
    y = j;
  }
  
  void display() {
    // brownian movement
    x += random(-0.8,0.8);
    y += random(-0.8,0.8);
    if (x>width*.5) x=width*.5;
    if (x<0) x=0;
    if (y>height*.25) y=height*.25;
    if (y<0) y=0;
    ellipse(x,y,2,2);
  }
}

