


// from http://processing.org/learning/topics/arraylistclass.html
// with fading!!!!!!!!!!!


ArrayList balls;
int ballWidth = 48;

// =====================================================================

void setup() {

  size(500, 500);
  // size(screen.width, screen.height);  

  smooth();
  noStroke();

  // Create an empty ArrayList
  balls = new ArrayList();

  // Start by adding one element
  balls.add(new Ball(width/2, 0, ballWidth, color (random(0, 255), random(0, 255), random(0, 255))));
}

void draw() {
  // delete
  background(111);
  // maybe add new Ball 
  if (random (0, 1000)>940) {
    // A new ball object is added to the ArrayList (by default to the end)
    balls.add(new Ball(random(width), random(-400, height), ballWidth, color (random(0, 255), random(0, 255), random(0, 255))));
  }
  // With an array, we say balls.length, with an ArrayList, we say balls.size()
  // The length of an ArrayList is dynamic
  // Notice how we are looping through the ArrayList backwards
  // This is because we are deleting elements from the list  
  for (int i = balls.size()-1; i >= 0; i--) { 
    // An ArrayList doesn't know what it is storing so we have to cast the object coming out
    Ball ball = (Ball) balls.get(i);
    ball.move();
    ball.diminish();    
    ball.display();
    // maybe kill it 
    if (ball.finished()) {
      // Items can be deleted with remove()
      balls.remove(i);
    } // if
    if (ball.finishedByOpacity () ) {
      // Items can be deleted with remove()
      balls.remove(i);
    } // if
  }
}

// =====================================================================

void mousePressed() {
  // A new ball object is added to the ArrayList (by default to the end)
  balls.add(new Ball(mouseX, mouseY, ballWidth, 
  color (random(0, 255), random(0, 255), random(0, 255))));
}


// =====================================================================
// Simple bouncing ball class

class Ball {

  float x;
  float y;
  color myColor; 
  float speed;
  float gravity;
  float opacity;
  float w;
  float life = 255;

  Ball(float tempX, float tempY, float tempW, color tempmyColor1) {
    x = tempX;
    y = tempY;
    w = tempW;

    myColor=tempmyColor1; 

    speed = 0;
    gravity = 0.1;
    opacity=255;   // opacity
  }

  void move() {
    // Add gravity to speed
    speed = speed + gravity;
    // Add speed to y location
    y = y + speed;
    // If square reaches the bottom
    // Reverse speed
    if (y >= height-19) {
      // Dampening
      speed = speed * -0.8;
      y = height-19;
    }
  }

  boolean finished() {
    // Balls fade out
    // life--;
    if (life < 0) {
      return true;
    } 
    else {
      return false;
    }
  }

  boolean finishedByOpacity () {     
    if (opacity<=0) {
      return true;
    } 
    else {
      return false;
    }
  }// func 

  void display() {
    // Display the circle
    //fill(0, life);
    fill(myColor, opacity); 
    //stroke(0,life);
    ellipse(x, y, w, w);
  }

  void diminish() {
    opacity = opacity-0.5;
  } // func
} // class 

// =====================================================================

// Processing was initiated by Ben Fry and Casey Reas


