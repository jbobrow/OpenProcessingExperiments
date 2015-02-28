
Mover[] mover = new Mover[10];


void setup() {

  size(640, 480);

  smooth();

  background(0);

  for (int i = 0; i < mover.length; i++) {

    mover[i] = new Mover();

  }

}

void draw() {

  background(0, 0, 0);

  for (int i = 0; i < mover.length; i++) {

    mover[i].checkEdges();

    mover[i].update();

    mover[i].display();

  }

}

class Mover {

  PVector location;

  PVector velocity;

  PVector acceleration;
  
  PVector jitter;

  float topspeed;
  
  float [] holdX = new float[20];
  float [] holdY = new float[20];
  color col = color(random(255),random(255),100,255);

  Mover() {

    location = new PVector(random(width), random(height));

    velocity = new PVector(0, 0);
    
    // adds a random jitter factor to each worm to stop them clumping
    float l = .5 - random(1); 
    float m = .5 - random(1);
    jitter = new PVector(l,m);
    
    topspeed = 7;

  }

  void update() {

    PVector mouse = new PVector(mouseX, mouseY);

    PVector dir = PVector.sub(mouse, location);

    dir.normalize();

    // any key pressed will stop them following mouse, q,w,e have specific effects
    if (keyPressed) {
      if (key == 'q') {

      dir.mult(0.2);

    } else if (key == 'e') {

      dir.mult(1);

    } else if (key == 'w') {

      dir.mult(5);

    } else {

      dir.mult(0.000001);

    }
    }


    acceleration = dir;

    acceleration.add(jitter);
    
    velocity.add(acceleration);

    velocity.limit(topspeed);

    location.add(velocity);

  }

  void display() {

    stroke(location.x, location.y, location.y);

    fill(col);

    ellipse(holdX[0], holdY[0] , 20, 20);
  
  // generates the tail drawing
   for (int i=0; i<20; i++) {
    fill(col - i*(col/20));
    ellipse(holdX[i],holdY[i], 20-i,20-i); 
   } 
    
   // stores the current location and shifts previous locations down the tail
   for (int i=19; i>=1; i--) {
     holdX[i] = holdX[i - 1];   
     holdY[i] = holdY[i - 1];
   }
   holdX[0] = location.x;
   holdY[0] = location.y;
//   println(holdX[0]);
//   println(holdY[0]);
  }

  void checkEdges() {

    if ((location.x > width) || (location.x < 0)) {

      velocity.x = velocity.x * -1;

    } 

    if ((location.y > height) || (location.y < 0)) {

      velocity.y = velocity.y * -1;

    }

  }

}

