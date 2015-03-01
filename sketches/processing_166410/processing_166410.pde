
CircleOne[] circleone = new CircleOne[50];
CircleTwo[] circletwo = new CircleTwo [50];

void setup() {
  size(800, 600);
  smooth();
  for (int i = 0; i < circleone.length; i++) {
    float x = random(width);
    float y = random(height);
    int r = i + 1;
    circleone[i] = new CircleOne(x, y, r);
  }
  for (int j = 0; j < circletwo.length; j++) {
    float x1 = random(width);
    float y1 = random(height);
    int s = j + 1;
    circletwo[j] = new CircleTwo (x1,y1,s);
  }
}
void draw() {
  background(255);
 
  for (int j = 0; j <  circletwo.length;j++){
     circletwo[j].display();
    circletwo[j].move();
    circletwo[j].display();
    circletwo[j].move();
    circletwo[j].display();
  }
   for (int i = 0; i < circleone.length; i++) {
    circleone[i].display();
    circleone[i].move();
    circleone[i].display();
    circleone[i].move();
    circleone[i].display();
  }
}
class CircleTwo {
  float x;
  float y;
  float changeBlue;
  int diameter;
  float teta;
  float beta;
  float amp = 10;

CircleTwo(float tempX, float tempY, int tempDiameter) {
    x = tempX;
    y = tempY;
    diameter = tempDiameter;
  }
  void move() {
    x = x+ amp * cos(-teta);
    y = y+amp * sin(-beta);
    teta = teta - 0.05;
    beta = teta - 0.01;
   
    if (x>width) {
      x = 0;
    } else if (x<0) {
      x= width;
    }
    if (y<0) {
      y = height;
    } else if (y>height) {
      y = 0;
    }
  }
  void display() {
    changeBlue = map(mouseY,0,height,0,200);
   
    fill(220, random(255), changeBlue);
    ellipse(x, y, diameter, diameter);
  }
}
class CircleOne {
  float x;
  float y;
  int diameter;
  float teta;
  float beta;
  float amp = 10;
  float changeGreen;

CircleOne(float tempX, float tempY, int tempDiameter) {
    x = tempX;
    y = tempY;
    diameter = tempDiameter;
  }
  void move() {
    x = x+ amp * cos(teta);
    y = y+amp * sin(beta);
    teta = teta + 0.1;
    beta = -teta + 0.1;
    println(teta+","+x+","+y);
    if (x>width) {
      x = 0;
    } else if (x<0) {
      x = width;
    }
    if (y<0) {
      y = height;
    } else if (y>height) {
      y = 0;
    }
  }
  void display() {
    changeGreen = map(mouseX,0,width,0,255);
    fill(random(200), changeGreen, 150);
    ellipse(x, y, diameter, diameter);
  }
}


