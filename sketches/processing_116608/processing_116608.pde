
Zombie carl;
Zombie frank;
void setup() {
  size(500,500);
  carl = new Zombie();
  frank = new Zombie();
}

void draw() {
  background(255);
  carl.display();
  frank.display();
  carl.move();
  frank.move();
}

class Zombie {
  float x;
  float y;
  color c;
  float bodyHeight;
  float bodyWidth;
  float headR;
  float armLength;
  float armHeight;
  float legWidth;
  float legHeight;
  boolean goX;
  boolean goY;
  int randomX;
  int randomY;
  
Zombie() {
  c = color (0,random(150,255),random(150));
  x = random(90,410);
  y = random(90,410);
  bodyHeight = 50;
  bodyWidth = 20;
  headR = 40;
  armLength = 50;
  armHeight = 10;
  legWidth = 5;
  legHeight = 20;
  randomX = 1;
  randomY = 1;
}

void display() {
  rectMode(CENTER);
  fill(c);
  rect(x,y,armLength,armHeight);
  rect(x,y,bodyWidth,bodyHeight);
  ellipse(x,y-30,headR,headR);
  rect(x-(bodyWidth/2)+(legWidth/2),y+(bodyHeight/2)+(legHeight/2),legWidth,legHeight);
  rect(x+(bodyWidth/2)-(legWidth/2),y+(bodyHeight/2)+(legHeight/2),legWidth,legHeight);
}

void move() {
  if (randomX > 2) {
  goX = goX; 
  }
  else {
  goX = !goX;
 } 
  if (randomY > 2) {  
  goY = goY;
  }
  else {
  goY = !goY;
  }
 if (goX == true) {
   x = x + 1;
   randomX = int(random(1,4));
 }
 else {
   x = x - 1;
   randomX = int(random(1,4));
 }
  if (goY == true) {
   y = y + 1;
   randomY = int(random(1,4));
 }
 else {
   y = y - 1;
   randomY = int(random(1,4));
 }
} 
}
