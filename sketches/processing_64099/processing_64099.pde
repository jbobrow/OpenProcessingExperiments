
PImage logo;
PImage po1;
PImage po2;
PImage lo1;
PImage lo2;
PImage en1;
PImage en2;
float px, py;



ArrayList balls;
int ballWidth = 8;

void setup() {
  size(500, 200);
  smooth();
  noStroke();
  
  logo = loadImage("huffpostlogo.png");
po1 = loadImage("po1.png");
po2 = loadImage("po2.png");
lo1 = loadImage("lo1.png");
lo2 = loadImage("lo2.png");
en1 = loadImage("en1.png");
en2 = loadImage("en2.png");

px = 30;
py = 20;


  // Create an empty ArrayList
  balls = new ArrayList();
  
  // Start by adding one element
  balls.add(new Ball(width/2, 0, ballWidth));
}

void draw() {
  background(255);
  
image(logo,75, 100);


image(po1, px, py);
image(lo1, px, py+30);
image(en1, px+110, py);


if ((mouseX>px)&&(mouseX<px+100)&&(mouseY>py)&&(mouseY<py+20))
{
image(po2, px, py);

  
}
  
  
  if ((mouseX>px)&&(mouseX<px+100)&&(mouseY>py+30)&&(mouseY<py+50))
{
image(lo2, px, py+30);

  
}



if ((mouseX>px)&&(mouseX<px+220)&&(mouseY>py)&&(mouseY<py+20))
{
image(en2, px+110, py);

  
}
  

  // With an array, we say balls.length, with an ArrayList, we say balls.size()
  // The length of an ArrayList is dynamic
  // Notice how we are looping through the ArrayList backwards
  // This is because we are deleting elements from the list  
  for (int i = balls.size()-1; i >= 0; i--) { 
    // An ArrayList doesn't know what it is storing so we have to cast the object coming out
    Ball ball = (Ball) balls.get(i);
    ball.move();
    ball.display();
//    if (ball.finished()) {
//      // Items can be deleted with remove()
//      balls.remove(i);
//    }
    
  }  
  
}

void mousePressed() {
  // A new ball object is added to the ArrayList (by default to the end)
  balls.add(new Ball(mouseX, mouseY, ballWidth));
}




// Simple bouncing ball class

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
    gravity = 0.25;
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
    color temp = get(mouseX,mouseY);
    
    fill(temp);
    //stroke(0,life);
    ellipse(x,y,w,w);
  }
}  


