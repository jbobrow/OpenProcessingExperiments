
/*
Date: 2013-06-12
Author: Oliver Roberts (programmin.gs/coursera)
Info: Simple drawing example, with an ArrayList + translate/rotate]

*/
ArrayList<Icon> iconArray;
void setup() {
  size(800, 800);
  iconArray = new ArrayList();
  for (int a = 0; a < 100; a++) {
    iconArray.add(new Icon());
  }
}

void draw() {
  fill(0, 10);
  noStroke();
  for(int i = 0; i < 100; i++){
  rect(0, i*21, 800, 20);
  }
  for (Icon i : iconArray) {
    i.run();
  }  
}

class Icon {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector size;
  float angle = 0;
  float aVelocity = 0;
  float aAcceleration;
  float newX;
  float newY;

  color[] palette = {
    #FFFFFF, #FEEF0C, #1EE107, #EF0AF3
  };
  int randNum = int(random(0, palette.length));
  int lifeSpan = 1;
  Icon() {
    location = new PVector(random(0, width), random(0, height));
    velocity = new PVector(0.5, 0.5);
    acceleration = new PVector(random(-0.1, 0.1), random(-0.5, 0.05));
    size = new PVector(30, 30);
  }

  void edges() {
    if (location.x > width + size.x) {
      location.x = 0;
    }
    if (location.x < 0 - size.x) {
      location.x = width;
    }
    if (location.y > height + size.x) {
      location.y = 0;
    }
    if (location.y < 0 - size.x) {
      location.y = height;
    }
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    aAcceleration = acceleration.x / 20.0;
    aVelocity += aAcceleration;
    aVelocity = constrain(aVelocity, -0.1, 0.1);
    angle += aVelocity;
    acceleration.mult(0);
    if(mousePressed){
    angle += aVelocity*10;
    }  
}
  
  void display() {
    noFill();
    //fill(palette[randNum]);
    stroke(palette[randNum]);
    pushMatrix();
    translate(location.x, location.y);
    rotate(angle);
    scale(0.3);
    //newX =   modelX(50, 50, 0);
    //newY = modelY(50, 50, 0);
    beginShape();
    vertex(0, 100); 
    vertex(0, 60); 
    vertex(10, 60); 
    vertex(10, 50); 
    vertex(20, 50); 
    vertex(20, 40); 
    vertex(30, 40); 
    vertex(30, 30); 
    vertex(20, 30); 
    vertex(20, 20); 
    vertex(30, 20); 
    vertex(30, 30); 
    vertex(40, 30); 
    vertex(40, 40); 
    vertex(40, 40); 
    vertex(60, 40); 
    vertex(60, 30); 
    vertex(80, 30); 
    vertex(80, 20); 
    vertex(70, 20); 
    vertex(70, 30); 
    vertex(70, 40); 
    vertex(80, 40); 
    vertex(80, 50); 
    vertex(90, 50); 
    vertex(90, 60); 
    vertex(100, 60); 
    vertex(100, 100); 
    vertex(90, 100); 
    vertex(90, 70); 
    vertex(80, 70); 
    vertex(80, 90); 
    vertex(60, 90); 
    vertex(60, 100); 
    vertex(70, 100); 
    vertex(70, 80); 
    vertex(30, 80); 
    vertex(30, 100); 
    vertex(40, 100); 
    vertex(40, 90); 
    vertex(20, 90); 
    vertex(20, 70); 
    vertex(10, 70); 
    vertex(10, 100); 
    vertex(0, 100); 
    endShape();
    popMatrix();
  }

  void run() {
    edges();
    update();
    display();
  }
}
