
float xPos;
float yPos;
float ySpeed;
float gravity;
boolean shouldJump;
boolean flashing;

void setup() {

  size(600, 600);
  xPos = -25; 
  yPos = height/2;
  ySpeed = 5;
  smooth();
  shouldJump = false;
  flashing = false;
}

void draw() { 

  println();
  background(80, 80, 150);

  fill(225, 0, 0);
  ellipseMode(CENTER);
  ellipse(xPos, yPos, 50, 50);

  xPos+=5; 

  if (xPos >=width+25) {
    xPos=-25;
  }

  if (shouldJump==true) {    
    jump();
  }
  if (shouldJump==false) {
    fall();
  }
  if (flashing == true) {
    flash();
  }
  println(flashing);
}
void keyPressed() {
  if (keyCode==UP) {
    shouldJump = true;
  }

  if (keyCode==DOWN) {
    shouldJump = false;
  }
  if (key == ' ') {
    if (flashing == false) {
      flashing = true;
    }
    else if (flashing == true) {
      flashing = false;
    }
  }
}
void flash() {
  fill(random(250), random(250), random(250));
  ellipse(xPos, yPos, 50, 50);
  for (int i = 4; i > 0; i --) {
    ellipse(xPos, yPos, i*50, i*50);
  }
}


void jump() {
  if (yPos>(height/2 - 100)) {
    yPos-=ySpeed;
  }
}
void fall() {
  if (yPos < height/2) {
    yPos += ySpeed;
  }
}
