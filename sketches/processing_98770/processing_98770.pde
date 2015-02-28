
// DIRECTIONS
//Press N to change to night
//Press F to speed up time
//Press T to slow down time
//Press E to create an eclipse
//Press S to see the stars
//Press L to see a flash of lightning
//Press M to build a mountain range
//Press C to go crazy
//Press J te see the best letter
//Press D to drive a plane
//Press R to make it rain
//Press W to make it snow
//Press H to put on your sunglasses
//Press B to go to the beach!





int cloudq;
int clouda;
int cloudb;
int cloudc;
int cloudd;
int timeR;
int timeB;
int timeG;
int car;
float shark;



void setup () {

  size(800, 600);
  frameRate(100);
  background(0, 100, 400);
  fill(63, 144, 39);
  ellipse(400, 600, 840, 100);
  cloudq=50;
  clouda=50;
  cloudb=50;
  cloudc=50;
  cloudd=50;
  car=10;
  shark=650;





  noStroke();
}

void draw () {



  //background
  background(0, 100, 400);
  noStroke();
  noCursor();


  //nightime/moon
  if (keyPressed) {
    if (key=='n') {
      timeR=168;
      timeG=167;
      timeB=178;
      background(0);
      fill(255, 255, 255);
      ellipse(mouseX, mouseY, 100, 100);
    }
  }
  
  
  
//Snow
 if (keyPressed) {
    if (key=='w') {
      background(162,153,154);
      delay(50);
      fill(255,255,255);
       ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
       ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
     
    }
 }

//Rain

  if (keyPressed) {
    if (key=='r') {
      delay(50);
      background(113, 106, 106);
      fill(0, 0, 255);

      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
       ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
       ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
       ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
       ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
       ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
       ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
       ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);
      ellipse(random(800), random(1000), 5, 5);

      timeR=168;
      timeG=167;
      timeB=178;
    }
  }











  //mountains

  if (keyPressed) {
    if (key=='m') {
      fill(250, 230, 8);
      ellipse(mouseX, mouseY, 100, 100);
      smooth();
      fill(62, 49, 44);
      triangle(150, 575, 350, 575, 250, 450);
      fill(77, 59, 52);
      triangle(250, 575, 450, 575, 400, 450);
      fill(62, 49, 44);
      triangle(400, 575, 650, 575, 600, 500);
    }
  }
  //J
  if (keyPressed) {
    if (key=='j') {
      fill(0, 0, 0);

      ellipse(50, 200, 50, 50);
      ellipse(60, 200, 50, 50);
      ellipse(70, 200, 50, 50);
      ellipse(80, 200, 50, 50);
      ellipse(90, 200, 50, 50);
      ellipse(100, 200, 50, 50);
      ellipse(110, 200, 50, 50);
      ellipse(120, 200, 50, 50);
      ellipse(130, 200, 50, 50);
      ellipse(140, 200, 50, 50);
      rect(65, 225, 40, 100);
      rect(15, 300, 90, 30);
      rect(15, 300, 30, -50);
    }
  }

  //crazy
  if (keyPressed) {
    if (key=='c') {
      background(random(500), random(500), random(500));
    }
  }

  //lightning
  if (keyPressed) {
    if (key=='l') {


      stroke(245, 198, 44);
      rect(cloudq-200, 130, 3, 500);
      rect(clouda, 130, 3, 500);
      rect(cloudb-550, 130, 3, 500);
      rect(cloudc-699, 130, 3, 500);
      rect(cloudd, 130, 3, 500);
     

      timeR=168;
      timeG=167;
      timeB=178;
    }
  }

  //Eclipse
  if (keyPressed) {
    if (key=='e') {
      background(0);  
      stroke(255, 255, 255); 
      strokeWeight(4);
      fill(0);
      ellipse(mouseX, mouseY, 100, 100);
    }
  }


  //city
  if (keyPressed) {
    if (key=='b') {
    }
  }
  //stars
  if (keyPressed) {
    if (key=='s') {
      delay(100);

      background(0);  
      fill(255, 255, 255); 
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3); 
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3); 
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
       ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
      ellipse(random(800), random(600), 3, 3);
 

      timeR=0;
      timeG=0;
      timeB=0;
    }
  }
  //slow down time
  if (keyPressed) {
    if (key=='t') {
      delay(125);
      fill(250, 230, 8);
      ellipse(mouseX, mouseY, 100, 100);
    }
  }

  //fast forward
  if (keyPressed) {
    if (key=='f') {

      cloudq=cloudq+20;
      clouda=clouda+21;
      cloudb=cloudb+19;
      cloudc=cloudc+22;
      cloudd=cloudd+18;
      fill(250, 230, 8);
      ellipse(mouseX, mouseY, 100, 100);
    }
  }

  //Plane
  if (keyPressed) {
    if (key=='d') {
      fill(40, 40, 40);
      rect(mouseX, mouseY, 100, 20);
      triangle(mouseX, mouseY, mouseX+30, mouseY, mouseX, mouseY-20);
      triangle(mouseX+100, mouseY, mouseX+100, mouseY+20, mouseX+150, mouseY+10);
      fill(255, 255, 255);
      rect(mouseX+10, mouseY+5, 10, 10);
      rect(mouseX+30, mouseY+5, 10, 10);
      rect(mouseX+50, mouseY+5, 10, 10);
      rect(mouseX+70, mouseY+5, 10, 10);
      rect(mouseX+90, mouseY+5, 10, 10);
      fill(200, 100, 1);
    }
  }

  //daytime/sun
  else {
    timeR=255;
    timeG=255;
    timeB=255;  
    background(0, 100, 400);
    fill(250, 230, 8);
    ellipse(mouseX, mouseY, 100, 100);
  }




//moves clouds
  cloudq=cloudq+1;
  clouda=clouda+1;
  cloudb=cloudb+2;
  cloudc=cloudc+2;
  cloudd=cloudd+1;

  //cloud #1
  fill(timeR, timeG, timeB);
  ellipse(cloudq-200, 130, 150, 50);
  ellipse(cloudq-191, 105, 50, 50);
  ellipse(cloudq-50, 110, 50, 50);
  ellipse(cloudq-231, 110, 50, 50);
  ellipse(cloudq-190, 145, 50, 50);
  ellipse(cloudq-225, 135, 50, 50);
  ellipse(cloudq-171, 135, 50, 50);
//loops cloud
  if (cloudq>1100) {
    cloudq=1;
  }
  //cloud #2
  fill(timeR, timeG, timeB);
  ellipse(clouda-390, 100, 150, 50);
  ellipse(clouda-399, 75, 50, 50);
  ellipse(clouda-360, 80, 50, 50);
  ellipse(clouda-430, 80, 50, 50);
  ellipse(clouda-399, 115, 50, 50);
  ellipse(clouda-430, 105, 50, 50);
  ellipse(clouda-360, 105, 50, 50);
//loops cloud
  if (clouda>1300) {
    clouda=1;
  }
  //cloud #3
  fill(timeR, timeG, timeB);
  ellipse(cloudb-550, 130, 125, 50);
  ellipse(cloudb-591, 105, 50, 50);
  ellipse(cloudb-550, 110, 50, 50);
  ellipse(cloudb-550, 110, 50, 50);
  ellipse(cloudb-550, 145, 50, 50);
  ellipse(cloudb-550, 135, 50, 50);
  ellipse(cloudb-571, 135, 50, 50);

  if (cloudb>1400) {
    cloudb=1;
  }
  //cloud #4
  fill(timeR, timeG, timeB);
  ellipse(cloudc-699, 100, 150, 50);
  ellipse(cloudc-699, 75, 50, 50);
  ellipse(cloudc-660, 80, 50, 50);
  ellipse(cloudc-730, 80, 50, 50);
  ellipse(cloudc-699, 115, 50, 50);
  ellipse(cloudc-730, 105, 50, 50);
  ellipse(cloudc-660, 105, 50, 50);
//loops cloud
  if (cloudc>1500) {
    cloudc=1;
  }

  //cloud #5
  fill(timeR, timeG, timeB);
  ellipse(cloudd-899, 100, 150, 50);
  ellipse(cloudd-899, 75, 50, 50);
  ellipse(cloudd-860, 80, 50, 50);
  ellipse(cloudd-930, 80, 50, 50);
  ellipse(cloudd-899, 115, 50, 50);
  ellipse(cloudd-930, 105, 50, 50);
  ellipse(cloudd-860, 105, 50, 50);



//loops cloud
  if (cloudd>1800) {
    cloudd=1;
  }

  //cloud #6
  fill(timeR, timeG, timeB);
  ellipse(cloudq+10, 100, 150, 50);
  ellipse(cloudq+1, 75, 50, 50);
  ellipse(cloudq+40, 80, 50, 50);
  ellipse(cloudq-30, 80, 50, 50);
  ellipse(cloudq+1, 115, 50, 50);
  ellipse(cloudq-30, 105, 50, 50);
  ellipse(cloudq+40, 105, 50, 50);




  //ground
  fill(63, 144, 39);
  ellipse(400, 600, 840, 100);
  
 //Sunglasses
  if(keyPressed){
    if(key=='h'){
      fill(250, 230, 8);
    ellipse(mouseX, mouseY, 100, 100);
      fill(40,40,40,150);
      rect(0,1,1000,1000);
      
      
    }
  }
  
  //beach
  if(keyPressed){
    if(key=='b'){
      fill(250, 230, 8);
      ellipse(mouseX, mouseY, 100, 100);
      fill(1,15,131);
      rect(0,400,800,300);
      fill(234,255,100);
      rect(0,500,800,100);
      
      fill(160,134,2);
      rect(0,500,800,25);
       fill(250, 230, 8);
       fill(0);
       triangle(shark,440,shark+20,440,shark+20,420);
    
    }
  }
  
  //makes the shark move
  shark=shark-.5;
  //loops the shark
  if(shark<-50){
    shark=width;
  }
}





