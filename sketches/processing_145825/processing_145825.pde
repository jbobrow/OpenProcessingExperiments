
///////////////////////////////////////
/**************************************
 //www.geneatcg.com/
  
 Processing 101 - 04
 Wriiten by Gene Kao
 Date --- 2014/04/09
  
 **************************************/
///////////////////////////////////////
 
 
Ball b; 
boolean status; 
int batSize = 150; 
int batThick = 10; 
int AddSpeed = 1;
int score = 0; 
 
void setup() {
  size(650, 450);
  rectMode(CENTER);
  smooth();
  b = new Ball(new PVector(width/2, height/2));
  status = true;
}
 
void draw() {
  background(200);
  b.draw();
}
 
void mousePressed() {
  b = new Ball(new PVector(width/2, height/2));
  status = true;
  score = 0;
}
 
void keyPressed() {
  if (key == CODED)
    if (keyCode == UP) {
      batSize += 10;
    } 
    else if (keyCode == DOWN) {
      batSize -= 10;
    }
}
 
class Ball {
 
  PVector pos; 
  PVector dir = new PVector(mouseX-width/2, mouseY-height/2);
  PVector vel; 
  int rad = 20; 
 
  Ball(PVector pos) {
    this.pos = pos;
    vel = PVector.div(dir, (width/2)/5);
  }
 
  void draw() {
 
    if (status) {
      display();
      bound();
      run();
    }
    bat();
    fill(0, 102, 153);
    text("Ball Position = " + (int)pos.x + ", " + (int)pos.y, 10, 20);
    text("Ball Velocity = " + vel.mag(), 10, 40);
    fill(255,0,239);
    text("Score = " + score, 10, 60);
  }
 
 
 
  void bound() {
 
    if (pos.x < rad - batThick/2 && (pos.y < mouseY+batSize/2 && pos.y > mouseY-batSize/2) ) {
      vel.x *= -1;
      vel.x += AddSpeed; 
      vel.y += AddSpeed;
 
      score++;
    } 
    else if (pos.x < rad - batThick/2 && (pos.y < mouseY+batSize/2 && pos.y > mouseY-batSize/2) ) {
      status = false;
    }
 
    if (pos.x > width-rad + batThick/2 && (pos.y < mouseY+batSize/2 && pos.y > mouseY-batSize/2)) {
 
      vel.x += AddSpeed; 
      vel.y += AddSpeed;
      vel.x *= -1;
      score++;
    } 
    else if (pos.x > width-rad + batThick/2 && !(pos.y < mouseY+batSize/2 && pos.y > mouseY-batSize/2)) {
      status = false;
    }
 
    if (pos.y < rad - batThick/2 && (pos.x < mouseX+batSize/2 && pos.x > mouseX-batSize/2) ) {
 
      score++;
      vel.y *= -1;
    } 
    else if (pos.y < rad - batThick/2 && !(pos.x < mouseX+batSize/2 && pos.x > mouseX-batSize/2) ) {
      status = false;
    }
 
    if (pos.y > height-rad + batThick/2 && (pos.x < mouseX+batSize/2 && pos.x > mouseX-batSize/2)) {
      vel.y *= -1;
 
      score++;
    } 
    else if (pos.y > height-rad + batThick/2 && !(pos.x < mouseX+batSize/2 && pos.x > mouseX-batSize/2)) {
      status = false;
    }
  }
 
  void run() {
    pos.add(vel);
  }
 
  void display() {
    fill(255);
    noStroke();
    ellipse(pos.x, pos.y, rad, rad);
    displayArrow();
  }
 
  void displayArrow() {
    strokeWeight(dist(width/2, height/2, mouseX, mouseY)/100);
    stroke(255, 100);
    line(width/2, height/2, mouseX, mouseY);
    stroke(255, 255, 0);
    fill(255, 255, 0, 100);
    ellipse(mouseX, mouseY, 20, 20);
    if (mousePressed) {
      stroke(255, 255, 0);
      fill(255, 255, 0);
      ellipse(mouseX, mouseY, 40, 40);
    }
  }
 
  void bat() {
    fill(255);
    noStroke();
    rect(mouseX, height-5, batSize, batThick);
    rect(mouseX, 5, batSize, batThick);
 
    fill(255, 0, 0);
    rect(width-5, mouseY, batThick, batSize);
    rect(5, mouseY, batThick, batSize);
  }
   
}
