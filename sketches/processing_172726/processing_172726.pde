
Object[] Objects = new Object[69];

void setup() {
  size(1000, 1000);
  for(int i=0; i<Objects.length; i++) {
    Objects[i] = new Object(20, random(height), #7DF231);
  }
}
void draw() {
  background(#775DED);
  for(int i=0; i<Objects.length; i++) {
    Objects[i].Movement(i);
  }
}



class Object {
  float x;
  float y;
  color c;
  
  Object(float Objectx, float Objecty, color Objectcolor) {
    x = Objectx;
    y = Objecty;
    c = Objectcolor;
  }
  void Movement(int speed) {
    x = x + speed;
    if(x > width) {
      x = 0;
    }
    fill(c);
    rect(x, y, 40, 10);
  }
}

void mousePressed(){
   setup();
   background(0);
   translate(mouseX, mouseY);
   fill(#F9FF67);
   stroke(255);
   strokeWeight(2);
   beginShape();
   vertex(0, -50);
   vertex(14, -20);
   vertex(47, -15);
   vertex(23, 7);
   vertex(29, 40);
   vertex(0, 25);
   vertex(-29, 40);
   vertex(-23, 7);
   vertex(-47, -15);
   vertex(-14, -20);
   endShape(CLOSE);
}
  






