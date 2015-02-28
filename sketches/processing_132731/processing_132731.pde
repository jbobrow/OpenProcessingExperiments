

Food f1, f2;
Player1 p1;

PShape s;
PShape t; 

int x = 40;
int y = 250;
int orbs = 0;
int oX=250;
int oY = 150;

color black = color(0,0,0);


void setup() {
  size(500, 300);
  s = loadShape("bgroundnew.svgz");
  t = loadShape("newstarfish.svgz");
  smooth();
  frameRate(24);
  f1 = new Food(200, 300, 92);
  f2 = new Food(100, 200, 92);
  p1 = new Player1(300, 300, 10);
}

void draw() {
  background(200);
  shape(s, width/2, height/2);
  collisions(x,y);
  orb();
  f1.display();
  f2.display();
  p1.display();
}

  










class Food {
  int timer = 0;
  float fX;
  float fY;
  int respawn;
  Food(float tempX, float tempY, int tempTime) {
    fX = tempX;
    fY = tempY;
    respawn = tempTime;
  }
  void display() {
    timer++;
    if (timer >= respawn) {
      fX = random(width);
      fY = random(height);
      timer = 0;
    }
    float distance = dist(p1.pX,p1.pY,fX,fY);
    if(distance < 20){
       fX = random(width);
      fY = random(height);
      timer = 0;
      println("collision");
    }
    fill(#2EFF0F);
    ellipse(fX, fY, 30, 30);
  }
  
}
void collisions(int cx, int cy) {
  if (keyPressed) {//UP
    if (key == 'w'){
      if (get(cx + 20, cy - 20) != black  && get(cx - 20, cy - 20) != black) {
        y--;
      }
    }
  }
   if (keyPressed) {//DOWN
    if (key == 's'){
      if (get(cx + 20, cy + 20) != black  && get(cx - 20, cy + 20) != black) {
        y++;
      }
    }
   }
    if (keyPressed) {//LEFT
    if (key == 'a'){
      if (get(cx - 20, cy - 20) != black  && get(cx - 20, cy + 20) != black) {
        x--;
      }
    }
   }
   if (keyPressed) {//RIGHT
    if (key == 'd'){
      if (get(cx + 20, cy - 20) != black  && get(cx + 20, cy + 20) != black) {
        x++;
      }
    }
   }
   shapeMode(CENTER);
   shape(t,x,y,50,50);
      
}

void orb(){
 fill(255);
text("Orbs =" + orbs, 10, 30); 
float oDist = dist(x,y,oX,oY);
if(oDist < 20){
  orbs = 1;
} else if (oDist > 20 && orbs != 1){
  rectMode(CENTER);
  fill(random(255), random(255), random(255));
  rect(oX,oY,30,30);
}
}
class Player1 {
  float pX;
float pY;
float speed;
color pColor = color(#92E5AA);


 Player1(float tempX, float tempY, float tempSpeed){
   pX = tempX;
   pY = tempY;
   speed = tempSpeed;
 }
 void display(){
 if (keyPressed) {
    if (key=='a') {
      pX -= speed;
    }
    if (key=='d') {
      pX += speed;
    }
    if (key=='s') {
      pY += speed;
    }
    if (key=='w') {
      pY -= speed;
    }
  }
  fill(pColor);


 
 }
}


