
int savedTime;
int totalTime = 2000;
int redLight = 3000;

int a; //wall
float y;
float x;
int speed = 8; //set speed forthe ball 

void setup() {
  size(600, 100);
  background(50);
  frameRate(50);

  savedTime = millis();

  x=100; //init pos
  a=width-20; //wall
}

void draw() {
  smooth();
  background(50);

  int passedTime = millis() - savedTime;

  noStroke();
  ellipse(x, 50, 40, 40);


  if ((passedTime < totalTime)== true) {

    fill(0, 255, 0);
    x=x+speed;

    if (x > a) {
      speed=speed*-1;
    } 
    if (x < 0) {
      speed=speed*-1;
    }
  } 
  else {
    fill(255, 0, 0);
    x=x;
  }

  if ((passedTime > redLight) == true) {
    savedTime = millis();
  }
}


