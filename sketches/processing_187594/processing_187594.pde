
Ball[] balls;
PVector mouse;
int ballCount;
float colWidth, colOffset;

void setup() {
  size(900, 700);
  background(222, 222, 222);
  NoCursor();
 
  reset();
}

void draw() {
  colorMode(HSB);
  background(50);
  fill(25, 25);
  //rect(0, 0, width, height);
  
  mouse = new PVector(mouseX, mouseY);
  
  for(int i=0; i<balls.length; i++) {
    balls[i].update();
  }
  
  for(int i=0; i<balls.length; i++) {
    balls[i].checkEdges();
  }
  
  for(int i=0; i<balls.length; i++) {
    balls[i].display();
  }
}

class Ball {
  
  float size, topSpeed, col;
  PVector loc, vel, acc, dir;

  Ball() {
    loc = new PVector(random(0, width), random(0,height));
    vel = new PVector(0, 0);
    acc = new PVector(0.01, 0.01);
    size = random(1, 10);
    topSpeed = random(5, 20);
    col = random(colOffset,colOffset+colWidth);
  }

  void update() {
    dir = PVector.sub(mouse, loc);
    dir.normalize();
    
    acc = dir;
    vel.add(acc);
    vel.limit(topSpeed);

    loc.add(vel);
  }

  void checkEdges() {
    if(loc.x + size < 0) {
      loc.x = width + size;
    } else if (loc.x - size > width) {
      loc.x = 0-size;
    }
    
    if(loc.y + size < 0) {
      loc.y = height + size;
    } else if (loc.y - size > height) {
      loc.y = 0-size;
    }
  }

  void display() {
    colorMode(HSB);
    noStroke();
    fill(col, 250, 200, 200);
    ellipse(loc.x, loc.y, size, size);
  }  
}

public void reset() {
  ballCount = random(5, 5000);
  balls = new Ball[ballCount];
  colWidth = random(0, 200);
  colOffset = random(0, 300-colOffset);
  
  for(int i=0; i<balls.length; i++) {
    balls[i] = new Ball();
  }
}

public void mouseClicked() {
  reset();
}
 
public boolean sketchFullScreen() {
    return true;
}
