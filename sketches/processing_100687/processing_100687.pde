
  ArrayList balls;
  ArrayList badballs;
  PFont f;
  int count = 0;
  int score=0;
  boolean gameOver = false;
  boolean intro = true;
  Catcher bowl;

  
void setup() {
  size(500, 800);
  frameRate(100); // draw loop runs N times per second

  bowl = new Catcher();
  balls = new ArrayList(); // Create an empty ArrayList
  balls.add(new Ball());

  badballs = new ArrayList(); // Create an empty ArrayList
  badballs.add(new badBall());

  noStroke();

  f = loadFont("OpenSans-Light-48.vlw");
}

void draw() {
  
  if (intro) { 
    background(#edeceb);
    textAlign(CENTER);
    fill(#424246);
    textFont(f);
   textSize(30);
   text("Tap to start",width/2, height/2);
    return;
  }
  if (gameOver) return;
  
  background(#ec817f);
   fill(#424246);
  rect(0,0,width,50);
  textSize(20);
  fill(#edeceb);
  text("Score: " + score, 50, 30);
  
   
  //catch rice, add score
  for (int i = 0; i < balls.size(); i++) {
    Ball ball = (Ball) balls.get(i);
    ball.move();
    ball.draw();
    if (bowl.intersect(ball)) 
    {
      balls.remove(i);
      score++;
    }
    
     if (ball.yPos >= 800) { 
       showGameOverScreen();
     }
  }

  for (int i = 0; i < badballs.size(); i++) {
    badBall badball = (badBall) badballs.get(i);
    badball.move();
    badball.draw();
    if (bowl.intersect(badball)) 
    {
      badballs.remove(i);
      score--;
    }
  }

  bowl.display();

  if (count%50 == 0) balls.add(new Ball());
  if (count%40 == 0) badballs.add(new badBall());
  count++;
  if (count >= 1000000) count = 0;
}

void showGameOverScreen() {
  
  textSize(50);
  background(#414145);
  fill(255);
  textAlign(CENTER);
  textSize(55);
  text("Game Over", width/2, height/2-30);
 textSize(30);
   text("Score: " + score, width/2, height/2+40);
   textSize(15);
   text("Tap to play again", width/2, height/2+200);
  //count = 0;
  gameOver = true;
  
}

void reset(){
  for (int i = 0; i < balls.size(); i++) {
    Ball ball = (Ball) balls.get(i);
    ball.yPos = 0;
  }
  
  score = 0;
}

void mousePressed(){
  if (intro) {
    intro = false; 
    reset();
  }
  if (gameOver) {
    intro = true;
    gameOver = false;
  }
  
}

class badBall {
  int xbPos, ybPos;
  int sizeb1, sizeb2;
  float speedb;

  badBall() {
    xbPos = floor(random (0, 500));
    ybPos = 0;
      sizeb1= 20;
   sizeb2=10;
    speedb = random(2, 5);  
    // fill (255);
    // myColor = color(int(random(240, 255)));
  }

  void move() {
    ybPos += speedb;
  }
  boolean reachedBottom() {
    // If we go a little beyond the bottom
    if (ybPos > height) { 
      return true;
    } 
    else {
      return false;
    }
  }

  void draw() {
    fill(#424246);
    ellipse(xbPos, ybPos, sizeb1, sizeb2);
  }
  void caught() {
    // Stop it from moving by setting speed equal to zero
    speedb = 0; 
    // Set the location to somewhere way off-screen
    ybPos = - 1000;
  }
}
class Ball {
  int xPos, yPos;
  int size1, size2;
  float speed;
  color ballColor;

  Ball() 
  {
    xPos = floor(random (0, 500));
    yPos = 0;
    //size1 = floor(random(20, 25));
    //size2 = floor(random(10, 15));
   size1= 20;
   size2=10;
    speed = random(2, 3);  
   // ballColor = 250;
  }

  void move() {
    yPos += speed;
  }
 
  void draw() {
    fill(#edeceb);
    
    ellipse(xPos, yPos, size1, size2);      
  }
 /*  boolean reachedBottom() {
    // If we go a little beyond the bottom
    if (yPos > height) { 
      return true;
    } 
    else {
      return false;
    }
  }*/
  void caught() {
    speed = 0; 
    yPos = - 1000;
  }
}
class Catcher {
  float x = 0, y = 0;
  int w = 180;
  int h = 100;
 
  void display() {
    fill(#edeceb);
    noStroke();
    x = mouseX-0.7*w;
    y = mouseY-0.5*h;
    translate (x, y);
    //scale(1.2);
    bezier(0, 0, 0, h, w, h, w, 0);
    rect(65, 70, 50, 10);
  }

  boolean intersect(Ball b) {
    if (b.xPos > x && b.xPos < x + 2*w)/*(w+0.3*w))*/ {
      if (b.yPos >= y && b.yPos < y + (h+0.5*h)) return true;
      else return false;
    }
    else return false;
  }
  
  boolean intersect(badBall bb) {
    if (bb.xbPos > x && bb.xbPos < x + 2*w)/*(w+0.3*w))*/ {
      if (bb.ybPos >= y && bb.ybPos < y + (h+0.5*h)) return true;
      else return false;
    }
    else return false;
  }
}


