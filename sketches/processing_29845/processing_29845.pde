
//DECLARE Sperm class/Array/ArrayList


ArrayList spermCum;                      


void setup() {
  frameRate(30);
  size(600,600);
  smooth();

  //INITIALIZE Sperm class
  spermCum = new ArrayList();
}

void draw()    {
  background(0);
  
  Sperm mySperm = new Sperm(random(0,width),random(0,height));
  spermCum.add(mySperm);
 
  //CALL FUNCTIONALITY

  for(int i = 0; i < 100; 1++) {
  Sperm mySperm = (Sperm) spermCum get(i);
  mySperm.run();
  }
}




class Sperm {
  // GLOBAL VARIABLES
  float x = 0;
  float y = 0;
  float speedX = 4;
  float speedY = 0.5;

  //CONSTRUCTOR
  Sperm(float _x, float _y) {

    x = _x;
    y = _y;
  }

  //FUNCTIONSS  
  void run() {
    display();
    move();
    bounce();
    gravity();
  }

  void bounce() {
    if (x > width) {
      speedX = speedX * -1;
    }   

    if (x < 0) {
      speedX = speedX * -1;
    }  

    if (y > height) {
      speedY = speedY * 0;
    }

    if (y < 0) {
      speedY = speedY * -1.2;
    }
  }

  void move() {
    x += speedX;
    y += speedY;
  }

  void gravity() {
    speedY -= 0.2;
  }

  void display() {
    noStroke();
    fill(255);
    
    ellipse(x,y,8,8);
    
    beginShape();
    vertex( x + 3, y + 1);
    bezierVertex( x - 4, y + 5, x + 4, y + 5, x - 3, y + 1);
    bezierVertex( x - 2, y + 5, x - 1, y + 7, x , y + 30);
    bezierVertex( x + 1, y + 7, x + 2, y + 5, x + 3, y + 1);
    endShape();
  }
}                                                               
