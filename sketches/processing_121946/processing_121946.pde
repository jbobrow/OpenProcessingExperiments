
var popsound = new Audio("pop.wav");
var losersound = new Audio("loser.mp3");
var winsound = new Audio("winner.wav");
var gamesound = new Audio("music.mp3");

int numBalls = 8;
float spring = 0.01;
float gravity = 0.03;
float friction = -0.12;
Ball[] balls = new Ball[numBalls];

int segCount = 25;
int bubblesPopped = 0;
float[] segX = new float[segCount];
float[] segY = new float[segCount];

float segLength = 15 ;
PImage sea;
float segSize = 35; 
boolean closedCircle = false;

float timer = 0;

boolean DEBUG = false;
boolean gameover = false;
boolean losersoundplayed = false;
boolean winnersoundplayed = false;



void setup() {
    smooth();
  size(1000, 700);
  sea = loadImage("sea.png");
  

    
   
  
  restart();
}

void restart()
{
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(width), random(height), random(38, 52), i, balls);
    balls[i].img = requestImage ("bubble.png");
  }  
  
  segX = new float[segCount];
  segY = new float[segCount];
  closedCircle = false;
  
  losersoundplayed = false;
  winnersoundplayed = false;
  gameover = false;
  bubblesPopped = 0;
  
    if (gamesound.paused != true) // or take out the if if you dont want to check if its already playing
    {
      gamesound.load();
      gamesound.play();
    }
    
}

void draw() {
  
  timer += 0.0167;

 

  
  
  if (segX.length < 2)
  {
    // set some variable to keep track of game over
    gameover = true;
    
  }
  
  
  if (gameover == true)
  {
    background(0);
    
     
      textSize(100);
      fill(255);
      text("You lost the game.",80,340);
       textSize(70);
      text("Press SHIFT to restart.", 140,445);
      
      gamesound.pause();
      
    if (losersoundplayed == false)
    {
      losersound.load("loser.mp3");
      losersound.play();
      losersoundplayed = true;
      
     
   
    }
  }
  else
  {
    image( sea, 0, 0 );
    collideHeadTail();
    if (closedCircle)
    {
      stroke(#C4FF05);
      strokeWeight(15);
    }
    else
    {
      strokeWeight(15);
      stroke(#0A0A0A);
    }
    
      textSize(15);
      fill(255);
      text("Press Space to toggle music.",10,685);

    if ((segX.length > 10 && timer > 2) || (segX.length <= 10 && timer > 1)){
     
     timer = 0;
    
       // minus 1 segment on end
     float[] tempX =  new float[segX.length-1];
     float[] tempY =  new float[segY.length-1]; 
     for (int j =0; j < tempX.length; j += 1)
     {
       tempX[j] = segX[j];
       tempY[j] = segY[j];
     }
     segX = tempX;
     segY = tempY;
     
      strokeWeight(5);
      stroke(350, 350);
    } 
  
    dragSegment(0, mouseX, mouseY);
      for(int i=0; i<segX.length-1; i++) {
        dragSegment(i+1, segX[i], segY[i]);
      }
    
    for (int i = 0; i < numBalls; i++) {
      if(balls[i].alive == true)
      {
        balls[i].collide();
        balls[i].collideSnake();
        balls[i].move();
        balls[i].display();  
      }
    }
  }
  
   if (bubblesPopped >= numBalls)
  {
      background(#D6AB1E);
    
        if (winnersoundplayed == false)
    {
      winsound.load("winner.wav");
      winsound.play();
      winnersoundplayed = true;
    }
      gamesound.pause();
      textSize(100);
      fill(255);
      text("You WON!",260,340);
      textSize(50);
      text("Press SHIFT to restart.", 255,430);
      
        }
  
  else
  {
  
  timer += 0.0167;
  
  }
  
  
}

class Ball {
  
  float x, y;
  float diameter;
  float vx = 0;
  float vy = 0;
  int id;
  Ball[] others;
  PImage img;
  boolean alive = true;
 int counter = 0;
 
  Ball(float xin, float yin, float din, int idin, Ball[] oin) {
    x = xin;
    y = yin;
    diameter = din;
    id = idin;
    others = oin;
  } 
  
  void collide() {
    for (int i = id + 1; i < numBalls; i++) {
      float dx = others[i].x - x;
      float dy = others[i].y - y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = others[i].diameter/2 + diameter/2;
      if (distance < minDist) { 
        float angle = atan2(dy, dx);
        float targetX = x + cos(angle) * minDist;
        float targetY = y + sin(angle) * minDist;
        float ax = (targetX - others[i].x) * spring;
        float ay = (targetY - others[i].y) * spring;
        vx -= ax;
        vy -= ay;
        others[i].vx += ax;
        others[i].vy += ay;
      }
    }   
  }

  void collideSnake() {
    for (int i = 0; i < segX.length; i++) {
      float dx = segX[i] - x;
      float dy = segY[i] - y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = segSize/2 + diameter/2;
      if (distance < minDist) { 
        float angle = atan2(dy, dx);
        float targetX = x + cos(angle) * minDist;
        float targetY = y + sin(angle) * minDist;
        float ax = (targetX - segX[i]) * spring;
        float ay = (targetY - segY[i]) * spring;
        vx -= ax;
        vy -= ay;
        if (closedCircle)
        {
           counter += 1;
           
           if(counter > 50 && alive == true && (bubblesPopped <= numBalls))
           {
             alive = false;
             
             popsound.load("pop.wav");
             popsound.play();
             bubblesPopped += 1;
             
             // add 1 segment on end
             float[] tempX =  new float[segX.length+2];
             float[] tempY =  new float[segY.length+2]; 
             for (int j =0; j < segX.length; j += 1)
             {
               tempX[j] = segX[j];
               tempY[j] = segY[j];
             }
             segX = tempX;
             segY = tempY;
           }
           
        }
        else
        {
          counter = 0;
        }      
      }
    }   
  }  
  
  
  void move() {
    vy += gravity;
    x += vx;
    y += vy;
    if (x + diameter/2 > width) {
      x = width - diameter/2;
      vx *= friction; 
    }
    else if (x - diameter/2 < 0) {
      x = diameter/2;
      vx *= friction;
    }
    if (y + diameter/2 > height) {
      y = height - diameter/2;
      vy *= friction; 
    } 
    else if (y - diameter/2 < 0) {
      y = diameter/2;
      vy *= friction;
    }
  }
  
  void display() {
    if (img.width > 0)
    {
      imageMode (CENTER);
      image(img, x, y, diameter, diameter);
      imageMode (CORNER);
    }
    //ellipse(x, y, diameter, diameter);
  }
}

void dragSegment(int i, float xin, float yin)
{
  float dx = xin - segX[i];
  float dy = yin - segY[i];
  float angle = atan2(dy, dx);  
  segX[i] = xin - cos(angle) * segLength;
  segY[i] = yin - sin(angle) * segLength;
  segment(segX[i], segY[i], angle);
}

  void collideHeadTail() {

      float dx = segX[0] - segX[segX.length-1];
      float dy = segY[0] - segY[segY.length-1];
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = segSize/2 + segSize/2;
      if (distance < minDist) { 
         closedCircle = true;
      }
      else
      {
         closedCircle = false;
      }
  }  

void segment(float x, float y, float a) {
  if (DEBUG == true)
  {
    noStroke();
    ellipse(x, y, segSize, segSize);
  }
  else
  {
    pushMatrix();
    translate(x, y);
    rotate(a);
    line(0, 0, segLength, 0);
    popMatrix();
  }

}

   
  

void keyReleased()
{    
 if (key == CODED && keyCode == SHIFT)
 {
   restart();
 }
 
if(key == ' ')
  {
    if (gamesound.paused == true)
    {
      gamesound.currentTime = 200;
      gamesound.play();
    }
    else
    {
      gamesound.pause();
    }
  }
}


