
ArrayList balls;
int ballWidth = 48;
PImage ragdoll1;
PImage ragdoll2;
PImage scene;
PImage star;

void setup() {
  size(641, 641);
  smooth();
  noStroke();
  frameRate(30);
  ragdoll1 = loadImage("ragdoll1.png");
  ragdoll2 = loadImage("ragdoll2.png");
  scene = loadImage("toybox.png");
  star = loadImage("star.png");
  // Create an empty ArrayList
  balls = new ArrayList();
  // Start by adding one element
  balls.add(new Ball(width/2, 0, ballWidth));
}

void draw() {
  background(220);
  // With an array, we say balls.length, with an ArrayList, we say balls.size()
  // The length of an ArrayList is dynamic
  // Notice how we are looping through the ArrayList backwards
  // This is because we are deleting elements from the list  
  for (int i = balls.size()-1; i >= 0; i--) { 
    // An ArrayList doesn't know what it is storing so we have to cast the object coming out
    Ball ball = (Ball) balls.get(i);
    ball.move();
    ball.display();
  image(scene, 0, 250);
  image(ragdoll1, mouseX - 50, mouseY - 100, 138.7, 178);
   if(mousePressed)
   {
     image(ragdoll2, mouseX - 50, mouseY - 100, 138.7, 178);
   }

  //legs
  stroke(0);
  strokeWeight(18);
  strokeCap(ROUND);
  // The legs are drawn according to the mouse location and the previous mouse location.
  line(mouseX-5,mouseY+82,pmouseX-5,pmouseY+112);
  line(mouseX+30,mouseY+82,pmouseX+30,pmouseY+112);
    
  }  
  
}

/*void mouseDragged() {
  // A new ball object is added to the ArrayList (by default to the end)
  balls.add(new Ball(mouseX, mouseY, ballWidth));
}*/

void mousePressed(){
  balls.add(new Ball(mouseX, mouseY, ballWidth));
}

class Ball {
  
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
    gravity = 2;
  }
  
    void move() {
    // Add gravity to speed
    speed = speed + gravity;
    // Add speed to y location
    y = y + speed;
    // If square reaches the bottom
    // Reverse speed
    if (y > height - 80) {
      // Dampening
      speed = speed * -0.8;
      y = height - 80;
    }
  }
  
  
  void display() 
  {
    image(star, x, y, random(20,30), random(20,30));
  }
  
}  

