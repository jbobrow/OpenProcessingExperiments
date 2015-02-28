
int count = 300; //number of points
PImage img;
 
Dissolve[] wind = new Dissolve [count];
 
 
void setup() {
  img = loadImage("Bride.jpg");
  size(265, 400);
  background(0,0,0);
  smooth();
  strokeWeight(1);
 
  for (int i=0; i<wind.length; i++) {
    wind[i] = new Dissolve(); // feeds the code
  }
}
 
 
void draw() {
 
  for (int i=0; i < wind.length; i++) {
    wind[i].update();
    wind[i].display();
  }
}
 
 
class Dissolve { //starting area
  int x = int(132.5);
  int y = int(200);
  Dissolve() {
  }
 
  void update() { //spread rate
    x = x + int(random (-30, 30));
    y = y + int(random (-3, 3));
  }
 
  void display() {
    color c = img.get(x, y);
    stroke(c);
    point (x,y);
  }
}


