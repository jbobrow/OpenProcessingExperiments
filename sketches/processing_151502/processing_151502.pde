
PVector pos;    
PVector speed;   
PVector accel;  
float direction; 
float collect = 0;

void setup() {
  size(800, 800);
  pos = new PVector(width/2, height/2, 0);
  speed = new PVector();
  accel = new PVector();
}

void draw() {
  checkKeys();
  background(0);
  speed.add(accel);  
  pos.add(speed);    
  drawShip();
  accel.set(0, 0, 0);                     
  if (speed.mag() != 0) speed.mult(0.99); 
  if (pos.x<0) {
    pos.x = pos.x+width;
  }
  if (pos.x>width) {
    pos.x = 0;
  }
  if (pos.y<0) {
    pos.y = pos.y+height;
  }
  if (pos.y>height) {
    pos.y = 0;
  }
}

void checkKeys() {
  if (keyPressed && key == CODED) {
    if (keyCode == LEFT) {
      direction-=0.1;
    }
    else if (keyCode == RIGHT) {
      direction+=0.1;
    }
    else if (keyCode == UP) {
      float totalAccel = 0.2;                 
      accel.x = totalAccel * sin(direction);  
      accel.y = -totalAccel * cos(direction);
    }
  }
}
void drawShip() {
  pushMatrix();
  translate(pos.x, pos.y);
  rotate(direction);
  noStroke();
  fill(255); 
  triangle(-10, 20, 10, 20, 0, -20);
  if (accel.mag() != 0) {
    float thrusterCol = random(0, 255);
    fill(thrusterCol, thrusterCol/2, 0);
    triangle(-5, 22, 5, 22, 0, 40);
  }
  popMatrix();
}
class Asteroid {
  PVector loc;
  public Asteroid() {
    loc = new PVector(random(-200,width+200), random(-200,height+200));
    if (loc.x >= width && loc.y <= 0) { // going southwest
      loc.x = 700;
      loc.y = -200;
    }
    else if (loc.x >= width && loc.y >= height) { //going northwest
      loc.x = -200;
      loc.y = 700;
    }
    else if (loc.x >= width && loc.y >= 0 ) { // going left
      loc.x = 700;
    }
    else if (loc.x >= 0 && loc.x <= 500 && loc.y <= 0) { // going down
      loc.y = -200;
    }
    else if (loc.x >= 0 && loc.y >= height) { // going up
      loc.y = -700;
    }
    else if (loc.x <= 0 && loc.y >= 0) { // going right
      loc.x = -200;
    }
    else if ( loc.x<=0 && loc.y <= 0) { //going southeast
      loc.x=-200;
      loc.y=-200;
    }
    else if ( loc.x <=0 && loc.y <= height) { //going northeast
      loc.x = 700;
      loc.y=700;
    }
  }
  void display() {
    fill(random(255), random(255), random(255));
    ellipse(loc.x, loc.y, 50, 50);
    move();
    println(loc.x + " display  " + loc.y);
  }
  void move() { 
    float tempX = loc.x;
    float tempY = loc.y;
 
 
    if (tempX >= width && tempY <= 0) { //going southwest
      loc.x-=1;
      loc.y+=1;
    }
    else if (tempX >= width && tempY >= height) { //going northwest
      loc.x-=1;
      loc.y-=1;
    }
    else if (tempX >= width && tempY >= 0 ) { //going left
      loc.x-=1;
    }
    else if (tempX >= 0 && tempY <= 0 ) { // going down
      loc.y+=1;
    }
    else if (tempX >= 0 && tempY >= height) { //going up
      loc.y-=1;
    }
    else if (tempX <= 0 && tempY >= 0) { //going right
      loc.x+=1;
    }
    else if ( tempX <=0 && tempY <= 0) { //going southeast
      loc.x+=1;
      loc.y+=1;
    }
    else if ( tempX <=0 && tempY <= height) { //going northeast
      loc.x+=1;
      loc.y-=1;
    }
    println(tempX + " temp " + tempY);
  }
}




