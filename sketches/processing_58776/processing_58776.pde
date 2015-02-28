
float x;
float dx;
float y;
float dy;

float x1;
float dx1;
float y1;
float dy1;

float x2;
float y2;
float dx2;
float dy2;

float x3;
float y3;
float dx3;
float dy3;

float c;

int  r = 25;

int numPoints=0;
int numPoints2=0;
PImage img;

void setup() {
  size(800, 450);
  img = loadImage("http://myweb.stedwards.edu/michaelo/Bus.png");
  smooth();
  noStroke();

  x = 0;
  dx = 1;
  y = 0;
  dy = 1;

  c = 1;
  r = 25;

  x1 = 0;
  dx1 = 1;
  y1 = 0;
  dy1 = 1;

  x2 = 0;
  y2 = 0;
  dx2 = 1;
  dy2 = 1;
  
  x3 = 0;
  y3 = 0;
  dx3 = 1;
  dy3 = 1;
}

void draw() {
  image(img, 0, 0);
  noStroke();
  
//The Balls
  fill(255, x-10, y-c);
  ellipse(x, y, r*2, r*2);
  ellipse(x1, y1, r*2, r*2);
  ellipse(x2, y2, r*2, r*2);

//The Weapons  
  fill(0);
  rect(x2-30,y2,10,11);
  stroke(random(220,255), random(76,139), random(0,46));
  ellipse(x2-r,y2,10,10);
  noStroke();
  ellipse(x-r, y, 10, 10);
  ellipse(x-20, y, 10, 10);
  ellipse(x1-r, y1-10, 20, 20);

  
  c += 10;
  
  x += 4*dx;
  y += 3*dy;
  
  x1 += 2*dx1;
  y1 += 2*dy1;
  
  x2 += 4*dx2;
  y2 += 5*dy2;
    
  x3 += 1*dx3;
  y3 += 6*dy3;
//Ball 1
  if (x >=800-25) {
    dx = -1;
  }
  if (x <= 25) {
    dx = +1;
  }
  if (y >= 450-25) {
    dy = -1;
  }
  if (y <= 25) {
    dy = +1;
  }
//Ball 2
  if (x1 >=800-25) {
    dx1 = -1;
  }
  if (x1 <= 25) {
    dx1 = +1;
  }
  if (y1 >= 450-25) {
    dy1 = -1;
  }
  if (y1 <= 25) {
    dy1 = +1;
  }
//Ball 3
  if (x2 >=800-25) {
    dx2 = -1;
  }
  if (x2 <= 25) {
    dx2 = +1;
  }
  if (y2 >= 450-25) {
    dy2 = -1;
  }
  if (y2 <= 25) {
    dy2 = +1;
  }
  
//Ball 4
  fill(255, x-10, y-c);
  ellipse(x3,y3,r*2,r*2);
//Ball 4 Weapons
  noFill();
  stroke(0);
  ellipse(x3,y3,10,10);
  line(x3,y3-10,x3,y3+10);
  line(x3-10,y3,x3+10,y3);
  fill(0);
  noStroke();
  ellipse(x3,y3+10,10,10);
//Ball 4 Text
  text("Sniper", x3-r,y3);
//Ball 4 Bounce
  if (x3 >=800-25) {
    dx3 = -1;
  }
  if (x3 <= 25) {
    dx3 = +1;
  }
  if (y3 >= 450-25) {
    dy3 = -1;
  }
  if (y3 <= 25) {
    dy3 = +1;
  }
  if (mouseX == 400 && mouseY == 300) {
    numPoints2 += random(100);
  }
  text("Bazooka", x1-r, y1);
  text("Shotgun", x-r, y);
  text("SMG", x2-r, y2); 
  if (mousePressed == true) {
    fill(c, c, c);
    strokeWeight(3);
    stroke(90, 255, 100);
    line(mouseX, mouseY, 800, 450);
    if (mouseX > (x1-r) && mouseX < (x1+r) && mouseY > (y1-r) && mouseY < (y1+r)) {
      x1 = random(1400,1900);
      y1 = random(500);
      numPoints += 25;
      numPoints2 += 25;
    }
    if (mouseX > (x-r) && mouseX < (x+r) && mouseY > (y-r) && mouseY < (y+r)) {
      x = random(1400,1900);
      y = random(500);
      numPoints += 50;
      numPoints2 += 50;
    }
    if (mouseX > (x2-r) && mouseX < (x2+r) && mouseY > (y2-r) && mouseY < (y2+r)) {
      x2 = random(1400,1900);
      y2 = random(500);
      numPoints += 75;
      numPoints2 += 75;
    }
      if (mouseX > (x3-r) && mouseX < (x3+r) && mouseY > (y3-r) && mouseY < (y3+r)){
      x3 = random(1400,1900);
      y3 = random(500);
      numPoints += 100;
      numPoints2 += 100;
      }
    }
  noStroke();
  noFill();
  strokeWeight(2);
  stroke(100, 10, 250, 220);
  ellipse(mouseX, mouseY, 24, 24);
  line(mouseX-25, mouseY, mouseX+25, mouseY);
  line(mouseX, mouseY-25, mouseX, mouseY+25);
  noStroke();
  fill (30, 200, 255);
  text ("Click to shoot the Armed Circles", mouseX-50, mouseY);
  text ("This is your Head Up Display.", mouseX-50, mouseY+20);
  fill(255, 20, 200);
  text ("Intel is SAFE.", 600, 400);
  fill(0, 255, 0);
  text ("Altitude is at 10 feet.", 600, 100);
  textSize(20);
  text("Your Points: " + numPoints, 10, 40);
  textSize(11);
  fill(0, 255, 0);
  text("<*Sever*> Squad Created", 20, 415);
  fill(255, 0, 0);
  text("I am BEASTIST! -Bazooka", 20, 400);
  textSize(20);
  text("Team Points: " + numPoints2, 10,60);
  textSize(11);
  if (mousePressed == false) {
    fill(255,0,0);
    textSize(22);
    text("FIRE!!!", 450,255);
    }
    textSize(11);
}
