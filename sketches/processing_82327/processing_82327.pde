
Obstacles[] obstaclesArray;
Obstacles[] obstaclesArray2;
Obstacles[] obstaclesArray3;
Player zero;
Player one;
Player two;
Player three;

int lvl;

int numObstacles;

float posY, amplitude, variationY, temps = 0;
float WaveSpeed;
float completeCycle;
int startX = 100;
int step;
int distanceX;

void setup() {
  size(800, 600);
  smooth();
  background(255);
  lvl=0;
  
  zero = new Player();
  one = new Player();
  two = new Player();
  three = new Player();
  
  numObstacles = (800);
  
  obstaclesArray = new Obstacles[numObstacles];
  obstaclesArray2= new Obstacles[numObstacles];
  obstaclesArray3= new Obstacles[numObstacles];
  
  distanceX = numObstacles-startX;
  completeCycle= TWO_PI/float(distanceX);
  
}


void draw() {
  switch(lvl) {
    
  case 0 :
  background(255);
  
  fill(0);
  textSize(15);
  text("welcome... use the left arrow key", 110, 130);
  text("to move across the screen and enter the game.", 125, 145);
  text("watch out!", 140, 160); 
  
  zero.display();
  zero.keyPressed();
  zero.boundaries();  
  
  break;
  
  case 1 :  
  background(255);
  
  
  one.display();
  one.keyPressed();
  one.boundaries();
  
  posY = 300;
  WaveSpeed = 0.0008;
  amplitude = 50;
  step = 100;

  for(int i = startX; i < numObstacles; i+=step) {
    temps += (millis()%i)*WaveSpeed;
    variationY = tan(((i-startX)+temps)*completeCycle);
    variationY *= amplitude;
    obstaclesArray[i] = new Obstacles(i, (posY+variationY), 15, 15);
    obstaclesArray[i].display1();
    obstaclesArray[i].collision(one);
  }

  break;
  
  case 2 :
  background(255);
  
  two.display();
  two.keyPressed();
  two.boundaries();
  
  posY = 300;
  WaveSpeed = 0.0015;
  amplitude = 50;
  step = 100;


  for(int i = 100; i < numObstacles; i+= step) {
    temps += (millis()%i)*WaveSpeed;
    variationY = tan(((i-startX)+temps)*completeCycle);
    variationY *= amplitude;
    obstaclesArray2[i] = new Obstacles(i, (posY+variationY), 15, 15);
    obstaclesArray2[i].display1();
    obstaclesArray2[i].collision(two);
    
  }
  
  break;
  
  case 3 :
  background(255);
  
  three.display();
  three.keyPressed();
  three.boundaries();
  
  posY = 300;
  WaveSpeed = 0.004;
  amplitude = 50;
  step = 100;


  for(int i = 100; i < numObstacles; i+= step) {
    temps += (millis()%i)*WaveSpeed;
    variationY = tan(((i-startX)+temps)*completeCycle);
    variationY *= amplitude;
    obstaclesArray3[i] = new Obstacles(i, (posY+variationY), 15, 15);
    obstaclesArray3[i].display1();
    obstaclesArray3[i].collision(three);
    
  }
  break;
  
  
  }
  

  }

class Obstacles {

//declare class variables
float x;
float y;
int w;
int h;

PImage ob1;
  
//constructor
  Obstacles(float xLoc, float yLoc, int wide, int high) {
  
  //assign public data to private variables
  x = xLoc;
  y = yLoc;
  w = wide;
  h = high;
    ob1 = loadImage("fall1.png");

}

void display1() {
  fill(38, 10, 38);
  ellipse(x, y, w, h);
//image(ob1, x, y, w, h); 
}


void collision(Player b) {

  float distance = dist(x, y, b.playerX, b.playerY);

  if(distance < (w/2 + b.w/2) ) {
  background(0);
  b.playerX = 0;
  }


}


}
class Player {
  PImage user;
//  img = loadImage("curtisFace.png");
//  image(img; 0, 0);

  int playerX, playerY;
  int w;
  int h;

  Player() {
    
   user = loadImage("fall2.png");
    

    playerX= 0;
    playerY=300;
    w = 20;
    h = 20;
    
    
    
  }

  void keyPressed () { 
    if (key == CODED) {
      if (keyCode == RIGHT) {
        playerX += 5;
      }
    }
    if (key == CODED) {
      if (keyCode == LEFT) {
        playerX += -5;
      }
    }
    if (key == CODED) {
      if (keyCode == UP) {
        playerY += -5;
      }
    }
    if (key == CODED) {
      if (keyCode == DOWN) {
        playerY += 5;
      }
    }
  }

  void display() {

    noStroke();
    fill(10, 25, 25);
    ellipse(playerX, playerY, w, h);
   // image(user, playerX, playerY, w, h);
  }
  
  void boundaries() {

    if (playerX <= -20) {
      playerX = 0;
    }

    if (playerY >= 620) {
      playerY = -10;
    }

    if (playerY <= -20) {
      playerY = 620;
    }
    
    if (playerX >= 820) {
    lvl++;
    }
    
  }
  
//  boolean win(){
//    if (playerX > 820) {
//      println("congratulations!");
//      return true;
//    }
//    else {
//      return false;
//    }
//  
//  
//  }
  
}



