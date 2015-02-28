
PFont myFont;
//mouse arrays - xPos, yPos, xVel, 
PImage [] mice = new PImage [30];
float [] miceXPos = new float [30];
float [] miceYPos = new float [30];
float [] miceVel = new float [30];

//rat arrays
PImage [] rats = new PImage [30];
float [] ratsXPos = new float [30];
float [] ratsYPos = new float [30];
float [] ratsVel = new float [30];

//kitten arrays
PImage [] kittens = new PImage [15];
float [] kittensXPos = new float [10];
float [] kittensYPos = new float [10];
float [] kittensVel = new float [10];

PImage cat; 
PImage miceImage;
PImage ratsImage;
//PImage kittImage;
//variables that will change
int cPosX;
//int lazer;
//int Score;
boolean leftPressed;
boolean rightPressed;
//int gameStart; //0= pre game 1= in game 2=game over

//variables hat will not change
int cPosY; //cat at bottom of the screen only on y axis
int catSpeed;

void setup() {
  size(500, 500);
  frameRate(30);
  smooth();
  //  imageMode(CENTER);
  myFont = loadFont ("SnellRoundhand-Bold-30.vlw");
  //  gameState = 0;

  cat = loadImage("tempcat.gif");
  ratsImage = loadImage("rat.gif");
  miceImage = loadImage("mouse1.gif");
  // kittensImage = loadImage("");
  // image(cat, 250, height); 

  cPosY= height;
  cPosX = width/2;
  catSpeed = 10;

  leftPressed = false;
  rightPressed = false;

  for (int i=0; i<30; i++) {
    miceXPos[i] = 30*(i-1);
    miceYPos[i] = random(0, height-100);
    miceVel[i] = random(1, 2.5);
    mice[i] = miceImage;
  }

  for (int i=0; i<30; i++) {
    ratsXPos[i] = 10*(i-1);
    ratsYPos[i] = random(0, height-100);
    ratsVel[i] = random(1, 2.5);
    rats[i] = ratsImage;
  }
  //  for (int i=0; i<10; i++) {
  //    kittensXPos[i] = 10*(i-1);
  //    kittensYPos[i] = random(0, height-100);
  //    kittensVel[i] = random(1, 2.5);
  //    kittens[i] = kittensImage;
  //  }
}
void draw() {
  background(255);
  image(cat, cPosX, height-50);

  if (leftPressed == true) {
    if (cPosX >0 && cPosX < width) {
      cPosX -= catSpeed;
    }
  }

  if (rightPressed == true) {
    if (cPosX >= 0 && cPosX < width-50) {
      cPosX += catSpeed;
    }
  }
  for (int i =0; i<30; i++) {
    image(mice[i], miceXPos[i], miceYPos[i]);
    miceVel[i] = miceVel[i] + random(-.4, 0.4);
    miceXPos[i] = miceXPos[i] + miceVel [i];
  }
  for (int i =0; i<30; i++) {
    image(rats[i], ratsXPos[i], ratsYPos[i]);
    ratsVel[i] = ratsVel[i] + random(-0.7, 0.7); //updating speed
    ratsXPos [i] = ratsXPos [i] + ratsVel[i];
    //using your current speed to update position //find out how and why things are moving.
  }

for(int i=0; i<30; i++){
  if(ratsXPos [i] >= width+25 || ratsXPos [i] <= -50){
   ratsVel[i] = ratsVel[i]*(-1); 
  }
}
for(int i=0; i<30; i++){
  if(miceXPos [i] >= width+25 || miceXPos [i] <= -50){
   miceVel[i] = miceVel[i]*(-1); 
  }
}
if(mousePressed){
 fill(250, 0, 0);
 ellipse(100,100, 4,4);
} 

}
//
//void update(){
//  for(int i =0; i<10; i++){
//  image(mice[i], miceXPos[i], miceYPos[i]);
//  miceVel[i] = miceVel[i] + random(-0.4, 0.4);
// }


void keyPressed() {

  if (keyCode == LEFT) {
    println("thyu46gy");
    leftPressed = true;
  }
  println(leftPressed);

  if (keyCode == RIGHT) {
    rightPressed = true;
  }
}

void keyReleased() {
  if (keyCode == LEFT) {
    leftPressed = false;
  }
  println(leftPressed);

  if (keyCode == RIGHT) {
    rightPressed = false;
  }
}


