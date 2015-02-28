
ArrayList balls;
int ballWidth = 22;

void setup() {
  size(400, 400);
  smooth();
  noStroke();

  // Create an empty ArrayList
  balls = new ArrayList();

  // Start by adding one element
  balls.add(new Ball(width/2, 0, ballWidth));
}

void draw() {
  background(255);

  // With an array, we say balls.length, with an ArrayList, we say balls.size()
  // The length of an ArrayList is dynamic
  // Notice how we are looping through the ArrayList backwards
  // This is because we are deleting elements from the list  
  for (int i = balls.size()-1; i >= 0; i--) { 
    // An ArrayList doesn't know what it is storing so we have to cast the object coming out
    Ball ball = (Ball) balls.get(i);
    ball.move();
    ball.display();
    if (ball.finished()) {
      // Items can be deleted with remove()
      balls.remove(i);
    }

  }  

  if (mousePressed) {
    // A new ball object is added to the ArrayList (by default to the end)
    balls.add(new Ball(mouseX, mouseY, ballWidth));
  }

}






// Simple bouncing ball class

class Ball {
  float spread=0;
  float x;
  float y;
  float speed;
  float gravity;
  float w;
  float life = 255;

  Ball(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
    speed = 0;
    gravity = 0.01;
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
    } 
    else {
      return false;
    }
  }

  void display() {
    // Display the circle
    float zzz = random(127);
    color fire = color(255,zzz,0);
    fill(fire,life);
    //stroke(0,life);

    x+=random(spread);
    x-=random(spread);
    y+=random(spread);
    y-=random(spread);

      for(int i=0;i<w;i++){
        float q = x;
        q+=random(w);
        q-=random(w);
        float qq = y;
        qq+=random(w);
        qq-=random(w);
        ellipse(q,qq,w,w);
      }
    spread+=0.1;
    if(w>0){    
      w-=0.1;
    }
    if(w<10){
      for(int i=0;i<w;i++){
        float q = x;
        q+=random(w);
        q-=random(w);
        float qq = y;
        qq+=random(w);
        qq-=random(w);
        float qqq = random(127);
        fill(0,qqq,0);
        ellipse(q,qq,w,w);
      }
    }

  }
}  





