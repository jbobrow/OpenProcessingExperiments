
//Prey and Predator Example
//by Brian Schrank
//I used the sketch as an example to get the three things moving in the sketch 
//and to get something afraid of another object
//I mostly changed up the code and deleted few things and all of the comments
//I kept the eclipse and raidus parts of the code because I could not figure out how to get the sketch to run without them
//I also kept hthe aspect that the objects will have a random speed and startung position each time
//I mainly changed the code to make it mine by changing the circles into images of a honey badger, snake, and the rat from rattatoille
//The rat is the white circle and it is afraid of the badger and snake because both could kill it in real life
//I also made the snake (was green circe) afraid of the honey badger because honey badgers eat snakes
//I also changed the code by makeing the honey badger (was red circle) attracted to the snake
//and I did that by making the badger follow the snake path if the snake gets close enough to it
float cY = 0; 
float cX = 0; 
float bY = 0; 
float bX = 0; 
float aY = 0; 
float aX = 0; 
float cMoveY; 
float cMoveX; 
float bMoveY; 
float bMoveX; 
float aMoveY; 
PImage grass;
PImage honeybadger;
PImage rat;
PImage snake;
float aMoveX;
float maxSpeed = 10.0;
float radius = 125.0; 
boolean bScared = false;
boolean aBrave = false;
boolean cScared = false; 
void setup() {
  size(1000, 1000); 
  grass = loadImage("gr.png");
  rat = loadImage("rat.png");
  snake = loadImage("snake.png");
  honeybadger = loadImage("hb.png");
  cMoveX=random(-maxSpeed, maxSpeed); 
  cMoveY=random(-maxSpeed, maxSpeed); 
  bMoveX=random(-maxSpeed, maxSpeed); 
  bMoveY=random(-maxSpeed, maxSpeed); 
  aMoveX=random(-maxSpeed, maxSpeed); 
  aMoveY=random(-maxSpeed, maxSpeed);
  aX=random(width-radius); 
  aY=random(height-radius); 
  bX=random(width-radius); 
  bY=random(height-radius);
  cX=random(radius*2, width-radius*2);  
  cY=random(radius*2, height-radius*2); 
  ellipseMode(RADIUS);
}
void draw() {
  background(0);
  image(grass, 0, 0);
  aX+=aMoveX; 
  aY+=aMoveY;
  if (aX>width-radius/4 || aX<radius/4) {
    aMoveX=-aMoveX;
  }
  if (aY>width-radius/2 || aY<radius/2) {
    aMoveY=-aMoveY;
  }
   if (dist(bX, bY, aX, aY)<radius*2) { 
    if (aBrave==false) {
      aMoveY= bMoveY; 
      aMoveX= bMoveX; 
      aBrave=true;
    }
  }
  else {
    aBrave=false; 
  }
  if (aBrave==true) { 
  }
  else { 
  }
  image(honeybadger, aX, aY, radius, radius);
  bX+=bMoveX; 
  bY+=bMoveY;
  if (bX>width-radius/5 || bX<radius/5) { 
    bMoveX=-bMoveX;
  }
  if (bY>width-radius/4 || bY<radius/4) {
    bMoveY=-bMoveY;
  }
  if (dist(aX, aY, bX, bY)<radius*2) { 
    if (bScared==false) {
      bMoveY=-bMoveY; 
      bMoveX=-bMoveX; 
      bScared=true;
    }
  }
  else {
    bScared=false; 
  }
  if (bScared==true) { 
  }
  else { 
  }
  image(snake, bX, bY, radius, radius);
  cX+=cMoveX;  
  cY+=cMoveY;
  if (cX>width-radius/5 || cX<radius/5) {
    cMoveX=-cMoveX;
  }
  if (cY>width-radius/4 || cY<radius/4) {
    cMoveY=-cMoveY;
  }
  if (dist(aX, aY, cX, cY)<radius*2 || dist(bX, bY, cX, cY)<radius*2) { 
    if (cScared==false) {
      cMoveY=-cMoveY; 
      cMoveX=-cMoveX; 
      cScared=true;
    }
  }
  else {
    cScared=false; 
  }
  if (cScared==true) { 
  }
  else { 
  }
  image(rat, cX, cY, radius, radius); 
}

