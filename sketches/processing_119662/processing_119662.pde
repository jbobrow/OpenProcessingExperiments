
/*****************************************
 * Assignment 5
 * Name:    Mike Robb & Mary White
 * Course:      CSC 103 - Creative Computing - Fall 2013
 * Submitted:    10/1/2013
 * 
 *
 * This program draws a Corgi and a bone. 
 * The sun will follow the x coordinate of the mouse and along a
 * predefined path. When the mouse is clicked, the bone drops to
 * the ground. If you click on the bone again, you can pick it back
 * up. If you press the space button on the keyboard, it draws a
 * new Corgi so that you can form a Corgum. If you press the 's'
 * key, it will toggle if the sun is following your mouse.  There is
 * also a random chance that a bird will be spawned and will move
 * across the screen.
 * 
 * Corgi and Bone drawing by Mary in a previous assignment.
 *
 * ***********************************************/
 
final int FALLSPEED = 2;
color bodyColor1 = color(238, 173, 14);
color spotColor = color(255, 255, 255);
color strokeColor = color(205, 149, 12);
color bgColor = color(7, 169, 250);
int bx, by;
boolean boneDropping = false;
boolean movingSun = true;
ArrayList<Corgi> corgis;
ArrayList<Bird> birds;
Sun sun;

class Corgi{
  float x,y,s;
  Corgi(float x, float y, float s){
    this.x = x;
    this.y = y;
    this.s = s;
  }
}


//setup
void setup() {
  size(760, 500);
  smooth();
  corgis = new ArrayList<Corgi>();
  corgis.add(new Corgi(generateX(),generateY(),generateScale()));
  birds = new ArrayList<Bird>();
  birds.add(new Bird());
  sun = new Sun(mouseX, 0);
}

void draw() {
  float birdSpawn = random(1);
  
  if(birdSpawn > .99) {
    birds.add(new Bird());
  }
  
  if(movingSun) {
    sun.x = mouseX;
    sun.setY();
  }
  
  if (boneDropping) {
    if (by < (height - 30))
      by += FALLSPEED;
  }
  else {
    bx = mouseX;
    by = mouseY;
  }

  pushMatrix();
  translate(380, 250);
  background(bgColor);
  drawGround();
  drawCorgis();
  popMatrix();
  sun.draw();
  drawBone(bx, by);
  for(int i = 0; i < birds.size(); i++) {
    Bird cur = birds.get(i);
    
    if(cur.isOffScreen()) {
      birds.remove(i);
    } else {
      cur.move();
      cur.draw();
    }
  }
}

void drawCorgis(){
  for(int i = 0; i < corgis.size(); i++){
    float x = corgis.get(i).x;
    float y = corgis.get(i).y;
    float s = corgis.get(i).s;
    pushMatrix();
    scale(s,s);
    drawBody(x, y);
    drawHead(x, y);
    drawEyes(x, y);
    popMatrix();
  }
}

//allows for the bone to be picked back up or dropped
void mousePressed() {
  if (boneDropping) {
    if (((by <= mouseY) && (mouseY <= (by + 30))) && 
      ((bx <= mouseX) && (mouseX <= (bx+60))))
      boneDropping = false;
  }
  else {
    boneDropping = true;
  }
}

void keyPressed(){
  if(key == ' ') {
    corgis.add(new Corgi(generateX(),generateY(),generateScale()));
  } else if( key == 's') {
    movingSun = !movingSun;
  }
}

//draws the grass
void drawGround() {
  fill(0, 255, 27);
  noStroke();
  rect(-380, 100, 765, 200);
}

//draws the Corgi body
void drawBody(float x, float y) {
  //back feet/legs
  //foot
  fill(spotColor);
  stroke(0, 0, 0);
  ellipse(x-50, y+150, 20, 40);
  ellipse(x+50, y+150, 20, 40);
  //legs
  fill(bodyColor1);
  rect(x-60, y+95, 20, 50);
  rect(x+40, y+95, 20, 50);
  //body
  fill(bodyColor1); 
  stroke(0, 0, 0);
  ellipse(x+0, y+50, 150, 180);
  fill(bgColor);
  stroke(bgColor);
  //front legs/feet
  //foot
  fill(spotColor);
  stroke(0, 0, 0);
  ellipse(x-35, y+150, 20, 40);
  ellipse(x+35, y+150, 20, 40);
  //leg
  fill(bodyColor1);
  stroke(bodyColor1);
  rect(x-45, y+95, 20, 50);
  rect(x+25, y+95, 20, 50);
  //leg outline
  stroke(0, 0, 0);
  line(x-45, y+145, x-50, y+85);
  line(x-25, y+145, x-25, y+125);  
  line(x+25, y+145, x+25, y+125);
  line(x+45, y+145, x+50, y+85);
  line(x-55, y+145, x-25, y+145);
  line(x+25, y+145, x+55, y+145);
  //chest spot
  fill(spotColor);
  stroke(strokeColor);
  ellipse(x+0, y+65, 65, 130);
}

void drawHead(float x, float y) {
  //ears
  fill(bodyColor1);
  stroke(0, 0, 0);
  //ear 1
  beginShape();
  curveVertex(x+10, y-120);
  curveVertex(x+10, y-120);
  curveVertex(x+55, y-170);
  curveVertex(x+65, y-82);
  curveVertex(x+65, y-82);
  endShape();
  //ear 2
  beginShape();
  curveVertex(x-10, y-120);
  curveVertex(x-10, y-120);
  curveVertex(x-55, y-170);
  curveVertex(x-65, y-82);
  curveVertex(x-65, y-82);
  endShape();
  fill(spotColor);
  stroke(strokeColor);
  //inner ear 1
  beginShape();
  curveVertex(x+20, y-115);
  curveVertex(x+20, y-115);
  curveVertex(x+50, y-150);
  curveVertex(x+60, y-62);
  curveVertex(x+60, y-62);
  endShape();
  //inner ear 2
  beginShape();
  curveVertex(x-20, y-115);
  curveVertex(x-20, y-115);
  curveVertex(x-50, y-150);
  curveVertex(x-60, y-62);
  curveVertex(x-60, y-62);
  endShape();
  //head
  fill(bodyColor1);
  stroke(0, 0, 0);
  ellipse(x+0, y-55, 140, 140);
  //snout
  //mouth
  fill(spotColor);
  stroke(0, 0, 0);
  ellipse(x+0, y-30, 30, 50);
  ellipse(x+0, y-40, 30, 50);
  stroke(spotColor);
  ellipse(x+0, y-30, 27, 47);
  stroke(0, 0, 0);
  //tongue
  fill(255, 114, 86);
  ellipse(x+0, y-30, 20, 40);
  fill(255, 255, 255);
  stroke(255, 255, 255);
  rect(x-10, y-55, 20, 20);
  stroke(0, 0, 0);
  line(x-15, y-35, x+15, y-35);
  stroke(138, 51, 36);
  line(x+0, y-35, x+0, y-13);
  //nose
  stroke(0, 0, 0);
  fill(0, 0, 0);
  ellipse(x+0, y-50, 20, 12);
}

void drawEyes(float x, float y) {
  //eyes
  fill(255, 255, 255);
  stroke(strokeColor);
  ellipse(x-30, y-80, 25, 25);
  ellipse(x+30, y-80, 25, 25);
  //pupils
  fill(0, 0, 0);
  stroke(0, 0, 0);
  ellipse(x-30, y-80, 10, 10);
  ellipse(x+30, y-80, 10, 10);
}

// generates a random x-coordinate for a Corgi
float generateX() {
  return random(-600, 600);
}

// generates a random y-coordinate for a Corgi
float generateY() {
  return random(355, 360);
}

//generates a random scale for a Corgi
float generateScale() {
  return random(.2, .6);
}

//draws the bone
void drawBone(int x, int y) {
  fill(255, 246, 143);
  stroke(255, 246, 143);
  //top left nub
  ellipse(x-12, y+5, 10, 12);
  //bot left nub
  ellipse(x-12, y+20, 10, 12);
  //top right nub
  ellipse(x+37, y+5, 10, 12);
  //top left nub
  ellipse(x+37, y+20, 10, 12);
  //shaft
  rect(x-12, y+7, 50, 10);
}

final float MaxSpeed = 5;
final float MinSpeed = 1;

public class Bird {  
  float x;
  float y;
  int direction;  // 0: right, 1: left
  float speed;
  int wingPos;
  
  public Bird(float x, float y, int direction, float speed) {
    this.x = x;
    this.y = y;
    this.direction = direction;
    this.speed = speed;
    this.wingPos = 0;
  }

  public Bird() {
    this.direction = round(random(1));
    this.x = direction == 1 ? width + 5 : -5;
    this.y = random(0, 300);
    this.speed = random(MinSpeed, MaxSpeed);
  }
  
  public boolean isOffScreen() {
    if(direction == 0) { // going right
      return x >= width + 5;
    } else {
      return x <= -5;
    }
  }
  
  public void move() {
    if(direction == 0) {
      this.x += this.speed;
    } else {
      this.x -= this.speed;
    }
    
    wingPos = (wingPos+1) % 100;
  }
  
  public void draw() {
    noStroke();
    fill(0);
    if(wingPos < 25) {
      ellipse(x, y - 10 + wingPos, 40, 10);
    } else {
      ellipse(x, y + 15 - ((wingPos-25)/3), 40, 10);
    }
    ellipse(x, y, 50, 10);
  }
}
public class Sun {
  float x;
  float y;
  
  public Sun(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  public float generateY() {
    float fromCenter = abs(width/2 - x);
    return .0005 * pow(fromCenter, 2) + 50;
  }
  
  public void setY() {
    this.y = generateY();
  }
  
  public void setY(float y) {
    this.y = y;
  }
  
  public void draw() {
    noStroke();
    fill(253, 184, 19);
    ellipse(x, y, 100, 100);
  }
}


