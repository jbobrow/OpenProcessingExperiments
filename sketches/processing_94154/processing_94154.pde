
/*pjs@ preload="char.png, background.png, obstacle.png, Banana.png, loser.png";*/
//coded with the help of Isaac Schulz's code--> http://www.openprocessing.org/sketch/92791
//coded with the help of Anthony Wojnar's code--> http://www.openprocessing.org/sketch/93092


Obstacle ObstacleA;
Obstacle ObstacleB;
Obstacle ObstacleC;
Obstacle ObstacleD;
Obstacle ObstacleE;
Obstacle ObstacleF;

banana bananaA;
banana bananaB;
banana bananaC;
banana bananaD;
banana bananaE;
banana bananaF;

PImage background;
PImage barrel;
PImage banana;
PImage character;
PImage lose;

class drive {
  PVector direction;
  PVector position;
  PVector velocity;
  float speed;

}
drive car;
float left=0;
float right=0;
float up=0;
float down=0;

int score = 0;
int lives = 1;


void setup() {
  size(800,400);
  ObstacleA = new Obstacle(790,197,random(-7));
  ObstacleB = new Obstacle(860,250, random(-4));
  ObstacleC = new Obstacle(900,300, random(-6));
  ObstacleD = new Obstacle(700,360, random(-5));
  ObstacleE = new Obstacle(1000,225, random(-5));
  ObstacleF = new Obstacle(1100,325, random(-7));
  
  bananaA = new banana(300,205,-3);
  bananaB = new banana(500,260,-3);
  bananaC = new banana(625,305,-2);
  bananaD = new banana(810,355,-4);
  bananaE = new banana(1800,225,-6);
  bananaF = new banana(1500,325,-2);
  
  background = loadImage("background.png");
  character = loadImage("char.png");
  barrel = loadImage("obstacle.png");
  banana = loadImage("Banana.png");
  lose = loadImage("loser.png");
  car =new drive();
  car.velocity = new PVector(1,0);
  car.position= new PVector(0,300);
  car.speed = 7;
}

void draw(){
  
  image(background,400,200);
  text("Score: " + score,25,25);
  car.velocity.x=(car.speed*(left+right));
  car.velocity.y=(car.speed*(up+down));
  car.position.add(car.velocity);  
  car.position.x = constrain(car.position.x, 40, 740);
  car.position.y = constrain(car.position.y, 150, 340);
  ObstacleA.draw();
  ObstacleA.move();
  ObstacleB.draw();
  ObstacleB.move();
  ObstacleC.draw();
  ObstacleC.move();
  ObstacleD.draw();
  ObstacleD.move();
  ObstacleE.draw();
  ObstacleE.move();
  ObstacleF.draw();
  ObstacleF.move();
  
  bananaA.draw();
  bananaA.move();
  bananaB.draw();
  bananaB.move();
  bananaC.draw();
  bananaC.move();
  bananaD.draw();
  bananaD.move();
  bananaE.draw();
  bananaE.move();
  bananaF.draw();
  bananaF.move();
  
  pushMatrix();
  translate(car.position.x, car.position.y);
  image(character,20,0);
  popMatrix();
  
}

class Obstacle {
  float x;
  float y;
  float hspeed;
  float rot = 0;

   
  Obstacle (float X,float Y,float Hspeed) {
    x=X;
    y=Y;
    hspeed=Hspeed;
  }
  void draw() {
    pushMatrix();
    translate(x,y);
    rotate(rot);
    imageMode(CENTER);
    image(barrel,0,0,20,20);
    popMatrix();
    rot -= .2;

    if (dist (x,y,car.position.x,car.position.y) < 30) {
      lives = 0;
    }
    if (lives <= 0) {
      car.speed = 0;
      car.position.x = 50;
      car.position.y = 40;
      
      tint(255,0,0, 200);
      fill(255,0,0);
      rect(0,0,800,400);
      image(lose, 400,200);
      
      textSize(64);
      fill(0);
      text("GAME OVER", 230, 85);
      
      textSize(64);
      fill(255);
      text("Score: " + score, 255, 370);
      
      
  }
  }
  void move() {
    x += hspeed;
    if (x < -10) {
      x = width + -10;
    }
    if (x > width + -10) {
      x = -10;
    }
  }
  }


class banana {
  float x;
  float y;
  float hspeed;
  
  banana (float X,float Y,float Hspeed) {
    x=X;
    y=Y;
    hspeed=Hspeed;
  }
  void draw() {
    pushMatrix();
    translate(x,y);
    image(banana,0,0,20,20);
    popMatrix();
    if (dist (x,y,car.position.x,car.position.y) < 22) {
      x = int(random(1,10))*50;
      score += 50;
    }
    }
  void move() {
    x += hspeed;
    if (x < -10) {
      x = width + -10;
    }
    if (x > width + -10) {
      x = -10;
    }
  }
  }


void keyPressed(){
   
  if(keyCode==UP){
    up=-1;
  }
  if(keyCode==DOWN){
    down=1;}
  if(keyCode==LEFT){
    left=-1; }
  if(keyCode==RIGHT){
    right=1;}
}   
 
void keyReleased(){
  if(keyCode==UP){
    up=0;}
  if(keyCode==DOWN){
    down=0;}
  if(keyCode==LEFT){
    left=0;}
  if(keyCode==RIGHT){
    right=0;}
}



