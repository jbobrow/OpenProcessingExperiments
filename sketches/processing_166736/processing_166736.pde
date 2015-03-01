
CircleOne[] circleone = new CircleOne[20];
CircleTwo[] circletwo = new CircleTwo [20];

void setup() {
  size(400, 300);
  smooth();
  for (int i = 0; i < circleone.length; i++) {
    float x = random(width);
    float y = random(height);
    int r = (i + 5)*4;
    circleone[i] = new CircleOne(x, y, r);
  }
  for (int j = 0; j < circletwo.length; j++) {
    float x1 = random(width);
    float y1 = random(height);
    int s = (j + 5)*3;
    circletwo[j] = new CircleTwo (x1,y1,s);
  }
}
void draw() {
  
  background(120,50,50);
 
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
  int diameter;
  float teta;
  float beta;
  float amp = 2;
  float sat; 
  float satAdd = 0.7;


CircleTwo(float tempX, float tempY, int tempDiameter) {
    x = tempX;
    y = tempY;
    diameter = tempDiameter;
   
  }
  void move() {
      x = x+  cos(teta);
    y = y+sin(teta);
     teta = teta + 0.01;
    
   
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
    colorMode(HSB,360,100,100,1.0);
    sat = sat +satAdd;
    
    noStroke();
    fill(360, 100, sat,0.3);
    ellipse(x, y, diameter, diameter);
    if (sat >100)satAdd = -satAdd;
    if (sat<0) satAdd = -satAdd;
  
 

  
  }
}
class CircleOne {
  float x;
  float y;
  int diameter;
  float teta;
  float beta;
  float amp = 2;
  float sat; 
  float satAdd = 0.5;


  CircleOne(float tempX, float tempY, int tempDiameter) {
    x = tempX;
    y = tempY;
    diameter = tempDiameter;
  }
  void move() {
    x = x+  cos(teta);
    y = y+sin(teta);
    teta = teta - 0.01;


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
    colorMode(HSB, 360, 100, 100, 1.0);
    sat = sat +satAdd;

    noStroke();
    fill(60, 100, sat, 0.3);
    ellipse(x, y, diameter, diameter);
    if (sat >100)satAdd = -satAdd;
    if (sat<0) satAdd = -satAdd;
  }
}



