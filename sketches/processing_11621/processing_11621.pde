
PImage opening;
PImage leftdial;
PImage rightdial;
PImage img;
PImage shake;
int x = 400;
int y = 300;
int l = 10;
int r = 11;
float thetaL = 0;
float thetaR = 0;
float speed = 1.5;
float shakex;
float shakey;
int clickCounter = 0;


void setup() {
size(800, 600);
img = loadImage("etchasketch.jpg");
leftdial = loadImage("dial.png");
rightdial = loadImage("dial.png");
opening = loadImage("opening.jpg");
//image(leftdial, 0, 0);
//image(rightdial, 0, 0);
image(opening, 0, 0);
//imageMode(CENTER);
//image(img, 0, 0);
shake = loadImage("etchasketchlong.jpg");
shakex = width/2;
shakey = height/2;
}

void draw() {

if (mousePressed) {
clickCounter = clickCounter + 1;
}
 
if (clickCounter >= 1) {
    x = constrain(x, 197, 598);
    y = constrain(y, 153, 440);
 
  if (keyPressed && (key == CODED)) { 
    if (keyCode == UP) { 
      y = y - 1;
      thetaL += 0.025;
    } 
    else if (keyCode == DOWN) { 
      y = y + 1;
      thetaL -= 0.025;
    }

    else if (keyCode == RIGHT) { 
      x = x + 1;
      thetaR += 0.025;
    } 
    else if (keyCode == LEFT) { 
      x = x - 1;
      thetaR -= 0.025;
    }

}

  pushMatrix();
  translate(155,495);
  rotate(thetaL);
  imageMode(CENTER);
  image(leftdial, 0, 0);
  popMatrix();

  pushMatrix();
  translate(640,495);
  rotate(thetaR);
  imageMode(CENTER);
  image(rightdial, 0, 0);
  popMatrix(); 


noStroke();
smooth();
rect(x, y, 1, 1);
fill(0);

 if (mousePressed) {
  x = 400;
  y = 300;
  image(img, 400, 300);
  }

if(mousePressed) {
  shakex += random(-speed*2, speed*2);
  shakey += 0;
  translate(0,0);
  imageMode(CENTER);
  image(shake, shakex, shakey);
}
}
}

void mouseReleased(){
image(img, 400, 300);
}

