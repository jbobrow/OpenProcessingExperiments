
int count = 300;
PImage img;
 
Dissolve[] wind = new Dissolve [count];
 
 
void setup() {
  img = loadImage("Bride.jpg");
  size(265, 400);
  background(0,0,0);
  smooth();
  strokeWeight(2);
 
  for (int i=0; i<wind.length; i++) {
    wind[i] = new Dissolve(); 
  }
}
 
 
void draw() {
 
  for (int i=0; i < wind.length; i++) {
    wind[i].update();
    wind[i].display();
  }
}
 
 
class Dissolve { 
  int x = int(132.5);
  int y = int(200);
  Dissolve() {
  }
 
  void update() { 
    x = x + int(random (-30, 30));
    y = y + int(random (-3, 3));
  }
 
  void display() {
    color c = img.get(x, y);
    stroke(c);
    point (x,y);
  }
}


