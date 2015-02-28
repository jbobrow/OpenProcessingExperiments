
Circle[] tinini = new Circle[250];

void setup() {
  background (255);
  size(536, 750);
  smooth();
  
  

  for (int i = 0; i < tinini.length; i++) {

    float x = random(width);
    float y = random(height);
    float diam = random(50, 50);
    float speed = 4000;
    float scalar = 100;

    tinini[i] = new Circle(x, y, diam, speed, scalar);
  }
}

void draw(){
 fill(187, 137, 244);
   stroke(105,32,158);
  strokeWeight(0.02);
  for (int i = 0; i < tinini.length; i++) {
    if (mousePressed == true) {
      tinini[i].update();
      tinini[i].display();
    }
  }
}


//Clase

class Circle {

  float x;
  float y;
  float diam;
  float speed;
  float angle;
  float scalar;
  float angle2;

  Circle(float tempX, float tempY, float diamH, float speedH, float scalarH) {

    x = tempX;
    y = tempY;
    diam = diamH;
    speed = speedH;
    scalar = scalarH;
    //angle = angleH;
  }

  void update () {

    x+=cos(angle)*scalar;
    y+=sin(angle)*scalar;
    angle+=4;
    scalar+=0.5;
  }

  void display() {

    ellipse(x, y, noise(diam)*3, noise(diam)*3);
    angle2+=100;
  }
}
