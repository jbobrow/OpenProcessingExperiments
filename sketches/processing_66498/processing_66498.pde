
float d;
float xPos;
float yPos;
float xVel;
float yVel;
int currentColor = 0;
float randomNum;

void setup () {
  size(600, 600);
  background(255);
  smooth();
  frameRate(60);
  fill(currentColor);

  d = random(40, 120);
  xPos = random(d/2, width - (d/2));
  yPos = random(d/2, height - (d/2));
  xVel = random(-10, 10);
  yVel = random(-5, 5);
}

void draw () {
  background(255);
  noStroke();
  fill(currentColor);
  ellipse(xPos, yPos, d, d);

  if (xPos <= (d/2)) {
    xVel = xVel*(-1);
    currentColor = color(random(255), random(255), random(255));
  } 
  if (yPos <= (d/2)) {
    yVel = yVel*(-1);
    d = random(30, 120);
    yPos=0+d/2;
  } 
  if (xPos >= width-(d/2)) {
    randomNum = (random(0.5, 1.5));
    println("randomNum: " + randomNum); 
//    println(xVel);
//    println(yVel);
    xPos = width-(d/2);
    xVel= xVel*(-1)*(randomNum);
    println(xVel);
    println(yVel);
  } 
  if (yPos >= height-(d/2)) {
    yPos=height-d/2;
    println(yVel); 
    yVel= yVel*(-1)*(random(.5, 1.1));
    println(yVel);
  }  
  xPos= xPos + xVel;
  yPos= yPos + yVel;
  println(xVel);
  println(yVel);
}


