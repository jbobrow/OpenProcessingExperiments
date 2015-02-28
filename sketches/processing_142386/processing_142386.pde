
//DECLARE
int num = 2000;
drops [] WATER = new drops[num];


void setup() {
  size(700, 700);
  background(0);
  
  //INITIALIZE
  for (int i = 0; i < WATER.length; i++) {
    WATER[i] = new drops(random(width), -30);
  }
}

void draw() {
  noStroke();
  fill(0, 5);
  rect(0, 0, width, height);
  stroke(1);
  
  //CALL FUNCTIONALITY
  for(int i = 0; i < WATER.length; i++){
  WATER[i].run();
  }
}

class drops {
  // GLOBAL VARIABLES
  float xpos = 0;
  float ypos = 0;
  float yspeed = random(1., 2.);

  //CONSTRUCTOR
  drops(float tempXpos, float tempYpos) {
    xpos = tempXpos;
    ypos = tempYpos;
  }

  //FUNCTIONS
  void run() {
    display();
    raincolor();
    reset();
    move();
  }

  void raincolor() {
    strokeWeight(random(0.5, 1.));
    float r = map(xpos, 0, 700, 0, 255);
    float g = map(ypos, 0, 700, 0, 255);
    float b = random(50, 150);
    stroke(r, g, b);
  }
  
  void display() {
    line(xpos+random(0.1, 2.5), ypos, xpos+random(0.1, 2.5), ypos-20);
  }
  
  void move() {
    ypos += yspeed;
  }
  
  void reset() {
    if (ypos > height+20/2) {
      ypos = -30;
    }
  }

}




