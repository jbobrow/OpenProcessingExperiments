
Orb[] orb = new Orb[1];

PVector gravity = new PVector(0, 0.05);
float nestPulse;
float nestSize;
float fade = 255;

void setup() {
  size(300, 800);
  smooth();
  orb[0] = new Orb(0.5*width, 0.2*height, 10);
}

void draw() {
  background(0);
  nestPulse = nestPulse += 0.10;
  nestSize = (15*sin(nestPulse))+20;
  strokeWeight(3);
  stroke(75, 75, 40);
  fill(0);
  ellipse(0.5*width, 0.2*height, nestSize, nestSize);
  noStroke();
  for (int i = 0; i < orb.length; i++) {  //Loops through all orb objects
    orb[i].run();
  }
}

void mouseClicked() {
  setup();
}

/*void mousePressed() {
 Orb orbInstance = new Orb(0.5*width, 0.1*height, 10);
 orb = (Orb[]) append(orb, orbInstance);
 }
 */
class Orb {

  float fontSize = 15;

  PVector position;
  PVector velocity;
  float totalDistance;
  PVector totalVelocity = new PVector();
  PVector magVelocity = new PVector();
  float damping = random(0, 0.9);
  float r;
  float x;
  float y;

  PVector startPoint = new PVector (0.5*width, 0.1*height);
  PVector distance = new PVector (x, y);
  PVector calculatedHeight = new PVector(0, y);

  Orb(float x, float y, float r_) {
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
    r = r_;
  }

  void run() {
    move();
    display();
    checkWallCollision();
    calculateDistance();
  }

  void move() {
    velocity.add(gravity);
    position.add(velocity);
  }

  void display() {
    noStroke();
    fill(150, 125, 150);
    ellipse(position.x, position.y, r*2, r*2);
    textAlign(CENTER);
    fill(100, 100, 75);
    ellipse(position.x, position.y, r*1.5, r*1.5);
    fill(255, 200, 150);
    ellipse(position.x, position.y-4, r*0.7, r*0.7);
  }

  void checkWallCollision() {
    if (position.x > width-r) {
      position.x = width-r;
      velocity.x *= -damping;
    } else if (position.x < r) {
      position.x = r;
      velocity.x *= -damping;
    }
    if (position.y > height-r) {
      position.y = height-r;
      velocity.y *= -damping;
    } else if (position.y < r) {
      position.y = r;
      velocity.y *= -damping;
    }
  }

  void calculateDistance() {
    distance.y = startPoint.dist(position);
    calculatedHeight.y = round(10*(map(distance.y, height*0.1, height*0.89, 10, 0)));
    magVelocity.y = velocity.mag();
    totalVelocity.add(magVelocity);
    totalDistance = (round(10*(map((totalVelocity.y), height*0.89, height*0.1, 10, 0)))+13);
    
    textSize(fontSize);
    
    String totalDistanceFIN = nf(totalDistance, 3, -1);
    text("Total Distance", 0.5*width, 0.04*height);
    text(totalDistanceFIN, 0.5*width, 0.06*height);
    
    fill(150, 125, 150);
    
    text("Click to Restart", 0.5*width, 0.16*height);
    
    fill(175, 175, 125);
    
    text("Damping", 0.5*width, 0.10*height);
    text(damping, 0.5*width, 0.12*height);

    textSize(fontSize*0.9);
    

    if (calculatedHeight.y < 10) {
      String calculatedHeightFIN = nf(calculatedHeight.y, 1, -1);
      text(calculatedHeightFIN, position.x, position.y-16);
    }
    if (calculatedHeight.y >= 10 && calculatedHeight.y < 100) {
      String calculatedHeightFIN = nf(calculatedHeight.y, 2, -1);
      text(calculatedHeightFIN, position.x, position.y-16);
    }
    if (calculatedHeight.y >= 100) {
      String calculatedHeightFIN = nf(calculatedHeight.y, 3, -1);
      text(calculatedHeightFIN, position.x, position.y-16);
    }
  }
}



