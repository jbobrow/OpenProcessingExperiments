
// Carla Campos-Rodriguez
// March 17,2013
// Class Sketch

int circleX = 250; 
int circleXSpeed = 2;
Circle sketch = new Circle ();

void setup () {
  size (600, 600);
  background(0);
  //background(174, 227, 219); light blue
  smooth();
  sketch . y=200;
  sketch . x=100;
}

void draw () {
  sketch.drawstuff();
  sketch.display ();
}

class Circle {
  float circleamount;
  int x;
  int y;
  int w;
  int h;
  boolean isClicked;

  Circle() {
    circleamount=300;
    isClicked=false;
  }
  void display () {
    fill(240, random(255), random(255), 50);
    noStroke();
    ellipse(mouseX, circleX, 20, 20);
    circleX = circleX + circleXSpeed;
    if (circleX > width) {
      circleXSpeed = -2;
      if (circleX < 0) {

        circleXSpeed = 2;
      }
    }
  }
    void drawstuff () {
      fill(0, random(255), random(255), 50);
      noStroke();
      ellipse(circleX, mouseY, 20, 20);
      fill(100, random(250), random(236), 50);
      ellipse(circleX+20, mouseY+20, 20, 20);
      ellipse(circleX+100, mouseY+100, 20, 20);
    
  
    circleX = circleX + circleXSpeed;//move the circle
  if (circleX > width) {
    circleXSpeed = -2;
  }
  if (circleX < 0) {

    circleXSpeed = 2;
  }
  fill(174, 227, 219, 130);//light blue
  ellipse(mouseX+20, mouseY+20, 15, 15);
  fill(246, 192, 192, 130);//pink
  ellipse(mouseX+40, mouseY+40, 15, 15);
}
}
