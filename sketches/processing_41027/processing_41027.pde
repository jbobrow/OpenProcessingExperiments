
//Nathan Aaronson
//This sketch represents an animal taking bites out of something till it is completely gone
//The bites are concentrated at first but spread out and seem to move on to the "food" past the sketch

int num =25;
 
Bites[] myBites = new Bites [num]; //Bites created
 
void setup() {
  size(400, 400);
  frameRate(50);
  
  background(0);
 
  for (int a=0; a<myBites.length; a++) {
    myBites[a] = new Bites();
  }
}
 
 
void draw() {
 
  for (int a=0; a < myBites.length; a++) {
    myBites[a].update();
    myBites[a].draw();
  }
}
 
 
class Bites {
  int x = int(random(200, 0));  //begin at top of screen and head downward
  int y = int(random(20, 0));
 
  Bites() {
  }
 
  void update() {
 
    x = x +int(random (-10, 10)); //records bites on screen and creates next bite
    y = y + int(random(-10, 10));
  }
 
  void draw() { //creates bite size and color
      noStroke();
      fill(255);
      ellipse(x,y,15,15); 
    }
  }


