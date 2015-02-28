
int radius = 100;
int ydistance = radius/2;
int xdistance = radius/2;

int speed = 7;
int xdirection = 1;
int ydirection = 1;

void setup() {
  size (600, 1000);
  smooth();
}

void draw() {
  fill(255);
  noStroke();
  background(126, 176, 178);


  ellipse(xdistance, ydistance, radius, radius);

  ydistance += speed*ydirection;
  xdistance += speed*xdirection;
  
  rectMode(CENTER);
  rect(mouseX, height-100, 100, 10);


  ////////STUFF

  //  ellipse(width/2, ydistance, radius, radius);
  //  ydistance = ydistance + speed*ydirection;
  //
  if (ydistance > height-radius/2) {
    ydirection = -ydirection;
    println("started from the bottom");
  }
  //
  if (ydistance < 0 + radius/2) {
    ydirection = -ydirection;
    println("now I'm here");
  }
  //  
  //  ellipse(xdistance, 100, radius, radius);
  //  xdistance = xdistance + speed*xdirection;
  //  
    if (xdistance > width-radius/2) {
      xdirection = -xdirection;
      println("right");
    }
  
    if (xdistance < 0+radius/2) {
      xdirection = -xdirection;
      println("wrong");
    }

  //  if (side > width-radius/2) {
  //    direction = -direction;
  //  }
  //  
  //  if (side < 0) {
  //    direction = -direction;
  //  }


  //    if (distance > height-radius/2) {
  //      direction = -direction;
  //    }
  //   if (distance < 0) {
  //     direction = -direction;
  //  
  //   }
}
