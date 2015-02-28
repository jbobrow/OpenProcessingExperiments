

Dots [] myDots = new Dots [300];    //Dots array
color [] myColors = new color [5];  //colors array

void setup() {
  size(400, 400);
  smooth();
  noStroke();
  background(0);

//makes different colors to use
  myColors[0] = color (0, 30);
  myColors[1] = color (50, 30);
  myColors[2] = color (100, 30);
  myColors[3] = color (200, 30);
  myColors[4] = color (0,255,255,10);

  for (int i=0; i<myDots.length; i++) {
    myDots[i] = new Dots();
  }
}

//what the program draws
void draw() {
  for (int i=0; i<myDots.length; i++) {
    myDots[i].update();
    myDots[i].draw();
  }
}

//creating a class
class Dots {
  int x = int(random(0, 400));
  int y = int(random(0, 400));

  color col = myColors[int(random(0, 5))];

  Dots() {
  }

//updates the variables so that they move downward
  void update () {
    x = x + int(random(-2, 2));
    y = y + int(random(-2, 4));
  } 

//what the class draws
  void draw() {
    fill(col);
    ellipse(x, y, 4, 4);
  }
}


