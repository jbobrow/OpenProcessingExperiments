
Prick[] myPrick = new Prick[500]; //sets the number of point at start


color[] myColors = new color[4]; //creates a color array


void setup() {
  size(300, 300);
  background(255);

  myColors[0] = color(200, 40, 35, 50); //colors from Nick Senske
  myColors[1] = color(65, 185, 54, 50);
  myColors[2] = color(255, 217, 0, 50);
  myColors[3] = color(0, 168, 255, 50);


  for (int j=0; j < myPrick.length;j++) {
    myPrick[j] = new Prick(random(0, width), random(0, height)); //seeds the array and sets the random starting possision
  }
}





void draw() {

  for (int j=0; j < myPrick.length; j++) {
    myPrick[j].move(); 
    myPrick[j].display();
  }
}





class Prick {

  float x;
  float y;
  color farg = myColors[floor(random(0, 4))];

  Prick(float x_, float y_) {
    x = x_;
    y = y_;
  }



  void display() {
    stroke(farg);
    point(x, y);
  }



  void move() {
    x = x + random(-1, 1);
    y = y + random(-1, 1);
  }
}


