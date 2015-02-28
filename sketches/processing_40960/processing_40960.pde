
int num = 100;//Number of spots
PImage img;//Image...No Fibs
Spot[] mySpot  =  new Spot [num];//Class

void setup() {
  size(300, 300);
  background(145, 13, 135);//Accent background 
  img = loadImage("sayuth2.jpg");
  smooth();

  for (int i=0; i < mySpot.length; i++) {
    mySpot[i] = new Spot();
  }
}

void draw () {
  for (int i=0; i < mySpot.length; i++) {
    mySpot[i].update();
    mySpot[i].display();
  }
}

class Spot {  //Class Setup
  int x = int(random(width));//Random Plot of points using colors from pic. get
  int y = int(random(width));
  int a = int(random(0, img.width));
  int b = int(random(0, img.height));
  color myColor= img.get(a,b);  //Color comes from the sayuth2 image
  
  Spot() {
  }
  
  void update() {  
    x = x + int(random(-5, 5));
    y = y + int(random(-5, 5));
  }
  
  void display() {  //controls color and primative type
    stroke (myColor);
    point(x, y);
  }
}

//Credit goes to Kasko for Code

