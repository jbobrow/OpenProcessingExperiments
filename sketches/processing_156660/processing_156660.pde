
PImage cage01;
PImage cage02;
float x;
float y;
float xArg;
float yArg;
float time;
float walkX;
float walkY;
float walkdx;
float walkdy;
float prevwalkx;
float prevwalky;

boolean cageWalk;
boolean cageFollow;

int num = 15;
float mx[] = new float[num];
float my[] = new float[num];

void setup() {
  size(800, 800);
  background(255);

  time = millis();

  cage01 = loadImage("cage01.png");
  cage02 = loadImage("cage02.gif");

  walkX = width/2;
  walkY = height/2;
}

void draw() {
  background(255);
  //draw buttons
  rect(0, 0, 25, 25);
  rect(25, 0, 25, 25);


  if (cageWalk) {
    cageAutoWalk();
  }
  if (cageFollow) {
    cageMouseFollow();
  }
}



void drawCage01(float x, float y) {
  imageMode(CENTER);
  image(cage01, x, y);
}

void drawCage02(float x, float y) {
  imageMode(CENTER);
  image(cage02, x, y);
}

void drawCage() {
  if (mousePressed) {
    drawCage02(xArg, yArg);
  } else {
    drawCage01(xArg, yArg);
  }
}



void mousePressed () {

  if (mouseX > 0 && mouseX < 25 && mouseY > 0 && mouseY < 25) {
    cageFollow = false;
    cageWalk = true;
  }
  if (mouseX > 25 && mouseX < 50 && mouseY > 0 && mouseY < 25) {
    cageWalk = false;
    cageFollow = true;
  }
}

void cageMouseFollow() {

  int delay = frameCount % num;
  mx[delay] = mouseX;
  my[delay] = mouseY;

  for (int i = 0; i < num; i++) {
    // delay+1 is the smallest (the oldest in the array)
    int index = (delay+1 + i) % num;
    xArg = mx[index];
    yArg = my[index];

    drawCage();

//    println("MOUSE FOLLOW IS WORKING");
  }
}

void cageAutoWalk() {
 
  walkdx = random(-5, 10);
  walkdy = random(-10, 10);
  walkX += walkdx;
  walkY += walkdy;


  if (walkX <= -20) {
    walkX = width;
  } else if (walkX > width+20) {
    walkX = 0;
  }
  if (walkY <= -20) {
    walkY = height;
  } else if (walkY > height+20) {
    walkY = 0;
  }
int delay = frameCount % num;
  mx[delay] = walkX;
  my[delay] = walkY;

  for (int i = 0; i < num; i++) {
    // delay+1 is the smallest (the oldest in the array)
    int index = (delay+1 + i) % num;
    xArg = mx[index];
    yArg = my[index];

    drawCage();

}
}


