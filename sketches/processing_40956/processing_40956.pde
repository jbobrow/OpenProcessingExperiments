
Cube [] myCube = new Cube [200];    
color [] Colors = new color [2];  //colors array
 
void setup() {
  size(400, 400);
  smooth();
  noStroke();
  background(76, 216, 110);
 
//makes different colors
  Colors[0] = color (36,95,13,100);
  Colors[1] = color (255,100);
  
 
  for (int i=0; i<myCube.length; i++) {
    myCube[i] = new Cube();
  }
}
 
//what the program draws
void draw() {
  for (int i=0; i<myCube.length; i++) {
    myCube[i].update();
    myCube[i].draw();
  }
}
 
//creating a class
class Cube {
  int x = int(random(0, 400));
  int y = int(random(0, 400));
  float rot = random(100);
  color col = Colors[int(random(0, 2))];
 
  Cube() {
  }
 
//tells the drawing where to move
  void update () {
    x = x + int(random(-20, 2));
    y = y + int(random(-20, 4));
  }
 
//what it draws
  void draw() {
    strokeWeight(random(2,10));
    stroke(col);
    noFill();
    rect(random (x), random (y), random(2,24),random(2, 24));
    rotate(radians(rot));
  }
}


