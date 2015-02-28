
int value = 0;
int timer = 0;
float fX = 200;
float fY = 200;
float pX = 300;
float pY = 300;
float eX = 400;
float eY = 400;
float speed = 7;


void setup() {
  size(500, 500);
  frameRate(24);
}

void draw(){
background(#69D306);
food();
p1();
enemy();
}

void food(){
//respawn
timer++;
if (timer >= 48) {
  fX = random(width);
  fY = random(height);
  timer = 0;
}
fill(#830AC1);
rect(fX,fY,30,30);
strokeWeight(4);
}

void p1() {
  if (keyPressed) {
    if (key == CODED) {
      if(keyCode == LEFT)
      pX -= speed;
    }
    if (keyCode== RIGHT) {
      pX += speed;
    }
    if (keyCode== DOWN) {
      pY += speed;
    }
    if (keyCode== UP) {
      pY -= speed;
    }
  }
  fill (#FF00C4);
  rect(pX,pY,30, 30);
}
 void enemy() {
   fill (value);
   rect(eX,eY,40,40);
 }
 void mouseClicked() {
   if (value == 0) {
     value = 255;
   } else {
   value = 0;
   }
   }


