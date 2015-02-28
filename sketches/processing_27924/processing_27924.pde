
ArrayList balls;
int ballWidth = (100);
import ddf.minim.*;
 
Minim minim;
AudioPlayer song;
 
void setup() {
  size(500, 500);
  smooth();
  noStroke();
  minim = new Minim(this);
  song = minim.loadFile("Drip2.wav");
 

  balls = new ArrayList();
   

  balls.add(new Ball(width/5, 0, ballWidth));
}
 
void draw() {
  
  background(255);
 
  for (int i = balls.size()-1; i >= 0; i--) {
  
    Ball ball = (Ball) balls.get(i);
    ball.move();
    ball.display();
    if (ball.finished()) {
      // Items can be deleted with remove()
      balls.remove(i);
    }
     
  } 
   
}
 
void mousePressed() {
  song.play();
  song.rewind();

  balls.add(new Ball(mouseX, mouseY, ballWidth));
}
 
 
 
 

 
class Ball {
 
  float x;
  float y;
  float speed;
  float gravity;
  float w;
  float life = 160;
 
   
  Ball(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
    speed = 0;
    gravity = 0.3;
  }
   
    void move() {
    // Add gravity to speed
    speed = speed + gravity;
    // Add speed to y location
    y = y + speed;
    // If square reaches the bottom
    // Reverse speed
    if (y > height) {
      // Dampening
      speed = speed * -0.8;
      y = height;
    }
  }
   
  boolean finished() {
    // Balls fade out
    life--;
    if (life < 0) {
      return true;
    } else {
      return false;
    }
  }
   
  void display() {
    // Display the circle
    fill(100,149,237,life);
    stroke(100,149,237);
    ellipse(x,y,w,w);
  }
} 
// some code an alteration of Daniel Shiffmans tutorial on processing.org

