


Sun mySun1;
Sun mySun2; // Four Suns
Sun mySun3;
Sun mySun4; // Four Suns

void setup() {
  size(500, 500);
  mySun1 = new Sun(0,0); // Parameters go inside the parentheses when the object is constructed.
  mySun2 = new Sun(0, height);
  mySun3 = new Sun(width, 0);
  mySun4 = new Sun(width, height);
  smooth();
  background(100, 60, 100, 100);
  
}

void draw() {
  
  mySun1.move();
  mySun1.display();
  mySun2.move();
  mySun2.display();
  mySun3.move();
  mySun3.display();
  mySun4.move();
  mySun4.display();
}

class Sun { // Even though there are multiple objects, we still only need one class. No matter how many cookies we make, only one cookie cutter is needed.
  color c;
  float xpos;
  float ypos;
  float sunsize;
  float speed;
  int colorstep; // how much to brighten color each lap?

  Sun(float tempXpos, float tempYpos) { // The Constructor is defined with arguments.
    c = 0;
    xpos = tempXpos;
    ypos = tempYpos;
    sunsize = 100.;
    speed = 1. + random(10.); // start Sun at some random speed
    colorstep = 50;
  }

  void display() {
  
    float tempC = c + xpos/width * colorstep;
    fill(tempC, tempC, tempC);  
    ellipseMode(CENTER);
    stroke(0);
    ellipse(xpos, ypos, sunsize, sunsize); 
  }

  void move() {
    sunsize = sunsize + speed;
    if (sunsize > 800. || sunsize < 0) {
      speed = speed * random(0.8, 1.2); // change speed a little bit
      speed = speed * -1.;
      c = c + colorstep; // make the Sun get brighter on each lap
    }
    if(c > 255) c = 0;
  }
}

