
//Dongjae "Krystofer" Kim
//Trippy Travellor


Krys k;
int rectSize;

void setup() {
  size(400, 400);
  k = new Krys();
  rectSize = 205;
  frameRate(20);
  background(255);
}

void draw() {
  rectMode(CENTER);
  noFill();
  stroke(random(255),random(255),random(255));
  rect(width/2,width/2,rectSize,rectSize);
  if (rectSize < width) {
   rectSize += 10;
  } 
  
  k.step();
  k.render();
  
}

class Krys {
  int x, y;

  Krys() {
    x = width/2;
    y = height/2;
  }

  void render() {
    noStroke();
    fill(random(255),random(255),random(255));
    ellipse(x, y,5,5);
  }

  void step() {
    int choice = int(random(4));

    if (choice == 0) {
      x += 5;
    } 
    else if (choice == 1) {
      x -= 5;
    } 
    else if (choice == 2) {
      y += 5;
    } 
    else {
      y -= 5;
    }

    x = constrain(x, 100, 300);
    y = constrain(y, 100, 300);
  }
}



