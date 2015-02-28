
// set frame size
int frameWidth = 400;
int frameHeight = 400;
// set the number limite of bubble.
Ball[] myBall = new Ball[99];
// set array index
int i = 0;

void setup() {
  size(frameWidth,frameHeight);
  background(0);
  smooth();
  frameRate(10);
}

void draw() {
  if(mousePressed && i < myBall.length){
    myBall[i] = new Ball();
    i = i + 1;
  }


  for(int j = 0; j < myBall.length; j++){
    if(myBall[j] != null) {
      myBall[j].move();
      myBall[j].display();
    }
  }
  // a lazy way to get thumbnail
  if(keyPressed) {
    saveFrame("thumbnail.jpg"); 
  }

}
class Ball {
  color c;
  int xpos;
  int ypos;
  float grownVal;
  float ballSize;
  float Weight;

  Ball() {
    c = color(random(100,255));
    xpos = mouseX;
    ypos = mouseY;
    ballSize = random(10,20);
    grownVal = random(5,20);
    Weight = random(1,5);
  }

  void display() {
    stroke(c);
    strokeWeight(Weight);
    noFill();
    ellipse(xpos,ypos,ballSize,ballSize);
    // set fade-out
    noStroke();
    fill(0,15);
    rect(0,0,frameWidth,frameHeight);
  }

  void move() {
    // set grown limite of bubbles
    if(ballSize > frameWidth / 3 || ballSize < 10){
      grownVal = grownVal * (-1); 
    }
    ballSize = ballSize + grownVal;  
  }
}









