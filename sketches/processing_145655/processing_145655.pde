
// set frame size
int frameWidth = 500;
int frameHeight = 500;
// set the number limite of bubble.
Ball[] myBall = new Ball[500];
// set array list
int i = 0;
 
void setup() {
  size(frameWidth,frameHeight);
  background(255);
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
  float life;
  float ballSize;
  float Weight;
 
  Ball() {
    c = color(random(100,255));
    xpos = mouseX;
    ypos = mouseY;
    ballSize = 0.5;
    life = 200;
    Weight = random(1,5);
  }
 
  void display() {
    stroke(c);
    strokeWeight(0);
    fill(0, 120, 170);
    ellipse(xpos,ypos,ballSize,ballSize);
    // set fade-out
    noStroke();
    fill(0,30);
   
    rect(0,0,frameWidth,frameHeight);
  }
 
  void move() {
    // set grown limite of bubbles
    if(ballSize > frameWidth / 3 || ballSize < 10){
      life = life * (0.05);
      //life = 0;
    }
    ballSize = ballSize + life; 
  }
}

