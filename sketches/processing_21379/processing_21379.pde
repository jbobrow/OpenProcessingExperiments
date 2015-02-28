
int numDrops = 800;
Drop[] drops = new Drop[numDrops];
float seaLevel =1;

void setup() {
  size(400, 500);
  smooth();
  for (int i = 0 ; i < drops.length; i++) {
    drops[i] = new Drop();
  }
  for (int i = 0 ; i < drops.length; i++) {
    drops[i].display();
  }
}


void draw() {
  background(127, 136, 170);
  for (int i = 0 ; i < drops.length; i ++) {
    drops[i].move();
  }
  drawCloud();
  raiseLevel();
  stop();
}

void raiseLevel() {
  noStroke();
  fill(3, 139, 255);
  rect(0, height - seaLevel, width, seaLevel);
}

void drawCloud() {
  noStroke();
  fill(230);
  rect(0, 0, width, 40);
  int cloudRadius = 50;
  for( int i = cloudRadius - 10 ; i < width + cloudRadius;  i +=2*cloudRadius - 10) {
    arc(i, 38, 2*cloudRadius, 2*cloudRadius, 0, PI);
  }
}

void stop() {
  if (seaLevel > height) {
    noLoop();
    println("flood!");
  }
}


class Drop {
  float xo, yo, v;

  Drop() {
    xo = random(0, width);
    yo = random(-4000, 40);
    v = .1;
  }

  void display() {
    noStroke();
    fill(3, 139, 255);

    //being points

    float theta = PI/6;

    arc(xo, yo, 10, 10, -theta, theta + PI);
    stroke(3, 139, 255);
    beginShape(QUADS);
    vertex(xo, yo - 5*1/cos(theta));
    vertex(xo - 5 * cos(theta), yo - 5*sin(theta));
    vertex(xo, yo);
    vertex(xo + 5* cos(theta), yo - 5 * sin(theta));
    endShape();
    noStroke();
  }

  void move() {
    if ( yo  < height - seaLevel) {
      display();
      v = v *1.025;
      yo = yo + v;
    }
    if ( yo > height && yo < height + 10) {
      seaLevel ++;
      println(seaLevel);
    }
  }

  //spalsh();
}


