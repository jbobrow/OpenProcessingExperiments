
Tank tank;
Monster monster;
Bomb bomb;
Bullet bullet;
Head head;


//monster
float[] x = new float[15];
float[] y = new float[15];
int click;

void setup() {
  size(1000, 700);
  rectMode(CENTER);

  tank = new Tank();
  bullet = new Bullet();
  monster = new Monster();
  bomb = new Bomb ();
  head = new Head (60);
  click = 0;

  for (int i = 0; i < x.length; i++) {
    x[i] = 0;
    y[i] = 0;
  }
}

void draw() {
  background(255);


  if (keyPressed) {
    switch(keyCode) {

    case LEFT:
      tank.rot("left");
      break;
    case RIGHT:
      tank.rot("right");
      break;
    case UP:
      tank.move("up");
      break;
    case DOWN:
      tank.move("down");
      break;
    }
  }
  monster. display();
  bomb.display();
  //background.display();
  tank.display();
  
  head.setLocation(mouseX, mouseY);
  head.display();
  println("mouse.x");
  
  if(bullet.isGoing) {
    bullet.move();
    bullet.display();
  }
} //draw

void keyPressed() {
  if(key == ' ') {
    bullet.updateAngle(tank.x, tank.y, tank.angle);
    bullet.isGoing = true;
  }
}

void mousePressed() {
  if (monster.tailLength < x.length) {
    monster.tailLength++;
  }
  

  
}

class Bomb {
  
int click;

void display () {
}
   
 
void mouseClicked() {
  fill(245, 2, 2);
  smooth();
  click ++;
  ellipse (mouseX, mouseY, 30, 30);
 
  if  (click == 0) {
    background(0);
  }
 }
}
  
class Bullet{
  
  boolean isGoing;
  float speed;
  float speedX, speedY;
  float x, y, r;
  color c;
  
 Bullet(){
   isGoing = false;
   speed = 10;
   x = 1000;
   y = 1000;
   r = 20;
   c = color(255);
 }
 
 void updateAngle(float cX, float cY, float cA){
   x = cX;
   y = cY;
   
   speedX = speed * cos(radians(cA));
   speedY = speed * sin(radians(cA));
   
 }

void move(){
   x += speedX;
   y += speedY;
 }
 
void display(){
   fill(255);
   stroke(0);
   ellipse(x, y, r, r);
   
 }
}
class Head {
  
  float r;
  color col;
  float x, y;
  
 Head(float tempR) {
    r = tempR;
    col = color(0, 0, 0);
    x = 0;
    y = 0;
  } //Head(float tempR) 
  
 void setLocation (float tempX, float tempY) {
   x = tempX;
   y = tempY;
 } // setLocation
  
  void display() {
    //monsterFace
    fill(col);
    stroke(0);
    ellipse(mouseX, mouseY, r, r);
    //eyes
    fill(255);
    ellipse(mouseX - 5, mouseY - 10, 20, 20);
    ellipse(mouseX, mouseY + 10, 15, 15);
    //pupils
    fill(0);
    ellipse(mouseX - 5, mouseY - 10, 5, 5);
    ellipse(mouseX, mouseY + 10, 5, 5);
  }
} // Head

class Monster {

  int tailLength = -1;

  void display() {
    background(255);
    frameRate(200);

    for (int i = 0; i<x.length-1; i++) {
      if(i > tailLength){
        x[i] = x[i+1];
        y[i] = y[i+1];
      }

      fill(i/10);
      ellipse(x[i], y[i], 60, 60);
      fill(255);
    } //for


    x[x.length-1] = mouseX;
    y[y.length-1] = mouseY;
  } //display

}

class Tank {

  float x, y;
  float w, h;
  float angle;
  float speed, speedX, speedY, rotationSpeed;

  Tank() {
    x = width/10;
    y = height/2;
    w = 70;
    h = 50;
    angle = 0;
    speed = 10;
    rotationSpeed = 2;
  }

  void display() {
   pushMatrix();
   x = constrain(x, 35, 965);
   y = constrain(y, 35, 665);
   
    translate(x, y);
    rotate(radians(angle));
    
    // body
    fill(103); //grey
    stroke(0);
    rect(0, 0, w, h);
    
    fill(191); //white
    stroke(0);
    rect(-15, 0, w-40, h-10);
    
    fill(157); //black(top)
    stroke(0);
    rect(-15, 0, w-50, h-20);
    
    //wheels
    fill(64);
    stroke(0);
    rect(0, 30, w-10, h-40);  
    rect(0, -30, w-10, h-40);
    
    //blaster
    fill(193);
    rect(25, 0, w-20, 10);
 
   popMatrix();
 }
 
  void move() {
    speedX = cos(radians(angle)) * speed;
    speedY = sin(radians(angle)) * speed;
    
    x += speedX;
    y += speedY;
    
  }


  void move(String direction) {
    speedX = cos(radians(angle)) * speed;
    speedY = sin(radians(angle)) * speed;
   
   if(direction == "up") {
    x += speedX;
    y += speedY;
   }
   else if(direction == "down") {
     x -= speedX;
     y -= speedY;
   }
  }

  void rot(String direction) {
    if (direction == "left") {
      angle -= rotationSpeed;
    } 
    else if (direction == "right") {
      angle += rotationSpeed;
    }
  } 
      

}





