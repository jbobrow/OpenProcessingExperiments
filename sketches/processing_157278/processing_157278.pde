
PImage cage01;
PImage cage02;
PImage bee;
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

ArrayList bees;

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
  
  bee = loadImage("bee.png");

  walkX = width/2;
  walkY = height/2;
  
//  bee01 = new Bees(width/2, height/2, -10, 10);

 bees = new ArrayList();
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
  for (int i=0; i < bees.size(); i++){ 
  Bees b = (Bees)bees.get(i);
  b.fly();
  b.display();
    if (b.beeYpos > height || b.beeYpos < 0) {bees.remove(i);}
    if (b.beeXpos > width || b.beeXpos < 0) {bees.remove(i);}
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
  for (int i = 0; i<10; i++) {
  bees.add(new Bees(mouseX, mouseY, -10, 10));}
}

class Bees {
  PImage beeImg;
  int beeXpos;
  int beeYpos;
  float beeDx;
  float beeDy;
float minRandom;
float maxRandom;

  Bees(int tempBeeXpos, int tempBeeYpos, float tempminRandom, float tempmaxRandom) {
    beeImg = loadImage("bee.png");
    beeXpos = tempBeeXpos;
    beeYpos = tempBeeYpos;
    minRandom = tempminRandom;
    maxRandom = tempmaxRandom;
  }

  void display() {
    imageMode(CENTER);
    image(beeImg, beeXpos, beeYpos);
  }

  void fly() {
    beeDx = random(minRandom, maxRandom);
    beeDy = random(minRandom, maxRandom);
    
    
    beeXpos += beeDx;
    beeYpos += beeDy;



    if (beeXpos <= -20) {
      beeXpos = width;
    } else if (beeXpos > width+20) {
      beeXpos = 0;
    }
    if (beeYpos <= -20) {
      beeYpos = height;
    } else if (beeYpos > height+20) {
      beeYpos = 0;
    }
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



