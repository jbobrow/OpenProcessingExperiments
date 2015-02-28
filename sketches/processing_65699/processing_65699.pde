
//Workshop 6 - Aimee Shimizu
//In honor of the 2012 London Olympics, a new event that will have audiences *roaring* with satisfaction.
//Inspired by the gladiator games of yore, lion-running pits humans against voracious jungle cats.
//Who will come out on top? You'll have to tune in to see!

int girl = 30; //sprinting girl
float x = 30;
float speed = 2;
int direction = 1;
int cat = 570; //pouncing cat
float y = 570;
float pounce = 2.5;
int directionTwo = -1;
float angle = 0.0; //clockhand
float angleDirection = 1;
float angleSpeed = 0.07;



PImage canyon;
PImage runner;
PImage runneropp;
PImage clockhands;
PImage olympics;
PImage lion;
PImage lionopp;
PImage lionmouth;

void setup() {
  size(600, 300);
  smooth();
  imageMode(CENTER);
  runner = loadImage("runner.png");
  runneropp = loadImage("runneropp.png");
  canyon = loadImage("canyon.jpg");
  clockhands = loadImage("clockhands.png");
  olympics = loadImage("olympics.png");
  lion = loadImage("lion.png");
  lionopp = loadImage("lionopp.png");
  lionmouth = loadImage("lionmouth.png");
}
 
void draw() {
  background(0);
  image(canyon, 300, 150); //background image of canyon
  image(olympics, 300, 60); //olympic clock
  

  angle += angleSpeed * angleDirection;
    if ((angle > TWO_PI)) {
    }
   
  pushMatrix();
  translate(300, 60); //spinning clockhand
  imageMode(CORNER);
  rotate(angle);
  image(clockhands, -30, -48, 40, 56);
  popMatrix();  
  
  imageMode(CENTER);
      
  y += pounce * directionTwo;  //pouncing lion
  if ((y < width - cat) || (y > cat)) {
   directionTwo = -directionTwo;
  }
  if (directionTwo == 1) {
    image(lionopp, y, 220);
  } else {
    image(lion, y, 220);
  } 
 
  imageMode(CENTER);
  x += speed * direction; //sprinting girl
  if ((x > width - girl) || (x < girl)) {
    direction = -direction; 
  }
  if (direction == 1) {
    image(runner, x, 120);
  } else {
    image(runneropp, x, 120);
  }
 

  
}

