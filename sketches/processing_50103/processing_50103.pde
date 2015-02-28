
int NUM_TRANS = 100;
int arrPos = 0;
int NUM_BALLS = 700;
Ball[] myBall = new Ball[NUM_BALLS];
Tran[] tranArr = new Tran[NUM_TRANS];

void setup() {
  size(900,450);
  background(0);
  
  for (int i = 0; i<NUM_TRANS; i++) {
   tranArr[i] = new Tran();
   tranArr[i].posX = random(0, width);
   tranArr[i].posY = random(0, height);
 }
  for (int i = 0; i<NUM_BALLS; i++) {
    myBall[i] = new Ball();
    myBall[i].posX = random(0,width);
    myBall[i].posY = random(0, height);
    myBall[i].speedX = random(0.5, 0.5);
    myBall[i].speedY = -5;
    myBall[i].diam = random(7,13);
    myBall[i].colorPick = color(random(0, 255), random(0, 255), random(0, 255));
 }
 
 smooth();
}

float gravity = .5;
int cspeed = 10;

void draw() {
  
  // fader
  noStroke();
  fill(0, 5);
  rectMode(CORNER);
  rect(0,0,900,450);
  
  // line drawing
  stroke(250);
  strokeWeight(5);
  line(pmouseX,pmouseY,mouseX,mouseY);
  
  for (int i = 0; i<NUM_TRANS; i++) {
   tranArr[i].update();  //object.method (calls on method that lies within the object
  }
  for (int i = 0; i<NUM_BALLS; i++) {
   myBall[i].update();  //object.method (calls on method that lies within the object
  }
}

void mouseClicked() {
  fill(255);
  for (int i = 0; i<NUM_BALLS; i++) {
    myBall[i].posX = mouseX + random(-10,10);
    myBall[i].posY = mouseY + random(-20,20);
    myBall[i].speedY = random(0, 40);
    myBall[i].speedX = random(-5,5);
   }
  
}

class Tran {
  
  float posX;
  float posY;
  
  void update() {
    float r = random(101);
    
    if (arrPos < NUM_TRANS-1) {
    // draw a transformer at arrPos, increment
    posX = pmouseX;
    posY = pmouseY;
    arrPos++;
    println(arrPos);
  } else {
    // set arrPos at 0, draw transformer, increment
    arrPos = 0;
    posX = pmouseX;
    posY = pmouseY;
    arrPos++;
    println(arrPos);
  }
    
    if (r < 33) {
      fill(random(255), random(255), random(255));
      noStroke();
      ellipse(posX, posY, 50,50);
    } else if (r < 66) {
      fill(random(255), random(255), random(255));
      noStroke();
      rectMode(CENTER);
      rect(posX, posY, 50,50);
    } else {
      fill(random(255), random(255), random(255));
      noStroke();
      triangle(posX, posY-25, posX-25, posY+25, posX+25, posY-25);   
    }
    
  }
}

class Ball {
  float diam = random(10,15);
  float posX;
  float posY;
  float speedY = random(-10,-20);
  float speedX = random(-30,30);
  float waver = 0;
  color colorPick = (#B97ADB);
   
  void update() {
    fill(colorPick);
    ellipse(posX, posY, diam, diam);
     
    posX += speedX;
    speedX += random(-.2, .2);
 
    posY += speedY;
    speedY += gravity;
     
    if (posY > height-30 || posX<0 || posX>(width+30)) {
      posY= mouseY;
      speedY=-10;
    }
     
 
  }
}

