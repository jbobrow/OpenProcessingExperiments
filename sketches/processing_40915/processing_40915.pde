

int num = 1000; // number of circles
Squiggle[] mySquiggle = new Squiggle [num]; //initializing the object
 
 
void setup() {
  size(300, 300);
  background(0);
  
 
  for (int i=0; i<mySquiggle.length; i++) {  //setting up the array
    mySquiggle[i] = new Squiggle();
  }
}
 
 
void draw() {
 
  for (int i=0; i < mySquiggle.length; i++) {
    mySquiggle[i].update();
    mySquiggle[i].display();
  }
}
 
 
class Squiggle {
 
 
  int x = int(random(width)); //drawing path x
  int y = int(random (height)); //drawing path y
  int c = int(random(width)); //color
 
 
  Squiggle() {
  }
 
  void update() {
    x = x + int(random (1,-1));
    y = y + int(random (-2,2));
    c = color(int(random(height)), 200, 150, 50);

  }
 void display(){
   smooth();
   ellipse (x, y,10,10);
   fill(c); 
  }
}
 




