
PImage ima;
PImage ima2;

class Spring { 

  PVector anchor;
  float len;
  float k = 0.1;
  
  Spring(float x, float y, int l) {
    anchor = new PVector(x,y);
    len = l;
  } 

   void connect(Ball b) {
    
    PVector force = PVector.sub(b.location,anchor);
    
    float d = force.mag();
    
    float stretch = d - len;
    
    force.normalize();
    force.mult(-1 * k * stretch);
    b.applyForce(force);
  }

   void constrainLength(Ball b, float minlen, float maxlen) {
    PVector dir = PVector.sub(b.location,anchor);
    float d = dir.mag();
    
    if (d < minlen) {
      dir.normalize();
      dir.mult(minlen);
      b.location = PVector.add(anchor,dir);
      b.velocity.mult(0);
    
    } else if (d > maxlen) {
      dir.normalize();
      dir.mult(maxlen);
      b.location = PVector.add(anchor,dir);
      b.velocity.mult(0);
    }
  }

  void display() { 
    imageMode(CENTER);
    ima2 = loadImage("ping.png");
    image(ima2,anchor.x,anchor.y);
  }
 
}

class Ball { 
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass = 20;
  float damping = 1.01;
  PVector drag;
  boolean dragging = false;

  Ball(float x, float y) {
    location = new PVector(x,y);
    velocity = new PVector();
    acceleration = new PVector();
    drag = new PVector();
  } 

   void update() { 
    velocity.add(acceleration);
    velocity.mult(damping);
    location.add(velocity);
    acceleration.mult(0);
  }

  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
  }

  void display() { 
    imageMode(CENTER);
    ima = loadImage("ball.png");
    image(ima, location.x,location.y);
  } 

  void clicked(int mx, int my) {
    float d = dist(mx,my,location.x,location.y);
    if (d < mass) {
      dragging = true;
      drag.x = location.x-mx;
      drag.y = location.y-my;
    }
  }

  void stopDragging() {
    dragging = false;
  }

  void drag(int mx, int my) {
    if (dragging) {
      location.x = mx + drag.x;
      location.y = my + drag.y;
    }
  }
}



// Spring object
Spring spring;
Ball ball;

void setup() {
  size(500, 450);
  smooth();
  spring = new Spring(width*0.5,height*0.5,100); 
  ball = new Ball(width/2,100); 

}

void draw()  {
  background(51,90,23); 
  PVector gravity = new PVector(0,0);
  
  spring.connect(ball);
  spring.constrainLength(ball,30,250);
  spring.display(); 
  ball.applyForce(gravity);
  ball.display();
  ball.update();
  ball.drag(mouseX,mouseY);
  
}

void mousePressed()  {
  ball.clicked(mouseX,mouseY);
}

void mouseReleased()  {
  ball.stopDragging(); 
}


