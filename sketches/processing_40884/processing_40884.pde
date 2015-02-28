
//HW 7.1
//Danielle Scesney

//creates number of objects.
squiggle [] squiggle = new squiggle [50];

void setup() {
  size(300, 300);
  background(30);
  smooth();

  for (int i=0; i<squiggle.length; i++) {
    squiggle[i] = new squiggle();
  }
}

void draw() {
  for (int i=0; i< squiggle.length; i++) {
    squiggle[i].update();
    squiggle[i].display();
  }
}

class squiggle {

  //variables

  //controls x coordinate.
  float x1 = random(0, 300);
  //controls y coordinate.
  float y2 = random(0, 300);
  //random red color.
  color c1 = color(random(255), 0, 0, 50);



  squiggle() {
  }

  void update() {
//updating y value of ellipse.
    y2 = y2 + random(-10, 10);
  }

  void display() {
    fill(c1);
    noStroke();
    ellipse(x1, y2, 10, 10);
  }
}


