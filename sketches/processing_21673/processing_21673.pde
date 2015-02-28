
/*One Button game by Sarah Scialli
Thanks to: http://www.myphysicslab.com/ 
for pendulum physics equations */


//variables for drawing rect
float x; 
float y;
float originalx;
float xoffset;
int w;
int h;
color c;
PFont font;

//physics and movement variables
float xvel;
float yvel;
float theta;
float theta0 = radians(50);
int dir = 1;
float speed = 1.0;

//timers
int currentTime;
int time;
int timer;
int dropTime;
float dt;

//garbage specific variables
boolean inGarbage;
boolean overGarbage;
boolean garbageFilled;
int garbageTimer;
int garbageTurnsLeft;
boolean waiting;
boolean movingFromGarbage;
float garbageX;
float garbageY;

//boundary variables
float topBound = 100.0;
int bound = 100;
float ground = 600.0;

//gameplay variables
boolean swingMode = true;
boolean dropMode = false;
boolean pause = false;
boolean inIntro; 
boolean endGame;

ArrayList playField;
int score;

//a class with all of the attributes of a block
public class Rect{
  float x;
  float y;
  float w;
  float h;
  boolean isGarbage;
  color c;
  Rect(float x,float y, float w, float h, color c){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
    this.isGarbage = false;
  }
    Rect(float x,float y, float w, float h,color c, boolean isGarbage){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
    this.isGarbage = isGarbage;
  }
  
}

public class IntPair{
  int x;
  int y;
  
  IntPair(int x, int y){
    this.x = x;  
    this.y = y;
  }
  
}

void setup(){
  size(640,650);
  smooth();
  font = loadFont("AdobeHeitiStd-Regular-48.vlw");
  textFont(font);
  playField = new ArrayList();
  reset();
  inIntro = true;
  endGame = false;
}

void draw(){
  background(224,208,183);
  if(inIntro){
    displayIntro();
  }
  else if(endGame){
    showScore();
  } 
  else{
    if(!pause){
      //Game Over
      if(highestY() <=topBound + h ){
        endGame = true; 
      }
      drawInterface();
      drawPlayField();
      if(movingFromGarbage){
        moveFromGarbage();   
      } 
      else{
        if(swingMode){
          blockSwing();
        }
        if(dropMode){
          if(!inGarbage){
            drop();  
          }
          else{
            garbageDrop();
          }
        }
      }
      score = score();
      displayText();
      fill(255);
    }
  }
}
//the movement of the block swinging
void blockSwing(){ 
    currentTime = millis();
    dt = (currentTime-time)/100.0;
    x =xoffset+ width/2 + topBound* sin(theta) - w/2;
    y = topBound * cos(theta);
    xvel = topBound * theta * cos(theta);
    yvel = topBound * theta * sin(theta);
    theta = theta0 * cos(sqrt(8.0 / topBound) * dt);
    
    //when over garbage, hold for 1 second
    if(waiting){
      xoffset = 0.5 * width - 0.5* bound;
      theta = 0;
      if (currentTime - garbageTimer >= 1500){
        dir = -1;
        waiting = false;
        xoffset -= 0.5 * bound;
      }
    }
    else{
      xoffset+=dir * speed;
    }
    
    //getting it over the garbage
    if(overGarbage && (xoffset + width/2 + 10 < width -bound)){
       overGarbage = false; 
     }
    if(!overGarbage && (xoffset+width/2  >= width- bound + 1)){
      if(!garbageFilled){
        waiting = true;
        overGarbage = true;
        garbageTimer = millis();
      }
      else{
        dir = -1;
      }
    }
    if(x <= bound){
      dir = 1;  
    }
    drawSwingingRect();
}
//dropping into the garbage
void garbageDrop(){
  fallingMotion();
  //stop garbage halfway down
  if(y >= 250){
    drawRect(x,y,w,h,c);
    Rect current = new Rect(x,y,w,h,c, true);
    garbageTurnsLeft = 3;
    playField.add(current);
    inGarbage = false;
    garbageFilled = true;
    setForNextTurn();
    waiting = false;
  }
  //still dropping (hasn't reached stopping spot yet)
  else{
    drawRect(x,y,w,h,c);   
  }
  
}

//drop normally
void drop(){  
  fallingMotion();
  if(wouldCollide(x,y, w, h)){
    y--;
    while(wouldCollide(x,y,w,h)){
      y--;  
    }
    drawRect(x,y,w,h,c);
    Rect current = new Rect(x,y,w,h,c);
    playField.add(current);
    setForNextTurn();
    if(garbageFilled){
      garbageTurnsLeft --;
    } 
   if(garbageFilled && (garbageTurnsLeft == 0)){
      removeGarbage();
    }
  }
  //still dropping (hasn't collided yet)
  else{
    drawRect(x,y,w,h,c);
  }

}
//draw all blocks in play
void drawPlayField(){
  for(int i = 0; i< playField.size(); i++){
      Rect current = (Rect)playField.get(i);
      drawRect(current.x,current.y, current.w, current.h,current.c);
  } 

}
//drawing the block moving from garbage to top
void moveFromGarbage(){
  drawRect(garbageX, garbageY, w,h,c);
  garbageX-=10; 
  garbageY -=6;
 if((garbageX <= x) && (garbageY <= y)){
   movingFromGarbage  = false;
 }
 
}

//taking the garbage out of the list of blocks and setting it as next block
void removeGarbage(){
  movingFromGarbage = true;
  for(int i = 0; i< playField.size(); i++){
    Rect g = (Rect)playField.get(i);
    if(g.isGarbage == true){
      garbageX = g.x;
      garbageY = g.y;
      w = (int)g.w;
      h = (int)g.h;
      c = g.c;
      playField.remove(i);
    }
  }
  dir = 1;
  garbageFilled = false; 
}

void fallingMotion(){
  currentTime = millis();
  dt = (currentTime - dropTime)/100.0;
  xvel -= 0.01;
  x = originalx + (xvel*dt)/100.0;
  y= topBound + yvel*dt/10.0 + 0.5 * 8.0 * pow(dt,2);
  
}
//reset variables for next swingMode
void setForNextTurn(){
    w = pickWidth();
    h = pickHeight();
    c = pickColor();
    dir = pickDir();
    speed = 1.0;
    theta = theta0;
    time = currentTime;
    timer = currentTime;
    dropTime = currentTime;
    dropMode = false;
    swingMode = true;   
    y= topBound;
    x = width/2;
    xoffset = 0;
}

//clear playing field to start game over
void reset(){
  xoffset = 0;
  playField.clear();
  dir = pickDir();
  x = width/2;
  y = topBound;
  w = pickWidth();
  h = pickHeight();
  c = pickColor();
  swingMode = true;
  dropMode = false;
  garbageFilled = false;
  currentTime = millis();
  time = millis();
  timer = millis();
  dropTime = millis();
  inGarbage = false;
  drawInterface();
  movingFromGarbage = false;
}



void drawInterface(){
  strokeWeight(3);
  fill(206,158,85);
  rect (0,ground, width, height - ground);
  line(0,0, 0,height);
  line(width, 0, width, height);
  rect(0,0, bound, height/5);
  rect(width-bound, 0, bound, height/2);
  fill(255);
  strokeWeight(1);
  
}

void drawSwingingRect(){
  drawRect(x,y,w,h,c);
  strokeWeight(5);
  line(xoffset + width/2 -10 , 0, x + w/4, y);
  line(xoffset + width/2+10, 0, x+(3*w/4), y);
  line(x+w/4, y, x+w/4, y+h);
  line(x+3*w/4, y, x+3*w/4, y+h);
  strokeWeight(1);
}

//a wrapper so that this could be spiced up later
void drawRect(float x, float y, float w, float h,color c){
  strokeWeight(3);
  fill(c);
  rect(x, y, w,h);
  fill(255);
  strokeWeight(1);
}

void displayIntro(){
  fill(237,143,0);
  textSize(60);
  int left = width/6;
  int offset = 100;
  text("Builtup", width/2 - 100, 100 + offset);
  textSize(30);
  fill(0);
  text("Drop blocks by hitting any key.", left, 150 + offset);
  textSize(25);
  text("Gain points by keeping blocks of the same color apart.",left-95, 180 + offset);
  textSize(25);
  text("Drop a block in the garbage to put it on hold.", left-50, 210 + offset); 
  text("It will come back into play in three turns.",left-10, 240 + offset);
  textSize(40);
  text("Click to Begin", width/2 - 145, 420);
  
  
}
void showScore(){
   fill(0);
   textSize(50);
   text("Your score is: ", width/6 + 60, 210);
   textSize(50);
   text(score, width/2-20, 280);
   textSize(30);
   text("Click to start again", width/8+100, 350);
 
}
void displayText(){
   fill(0);
   textSize(30);
   text("Score: ", 10, 50);
   textSize(36);
   text(score, 35, 80);
   if(garbageFilled){
      text("..." + garbageTurnsLeft, width - 0.6* bound, 100);   
   }
   textSize(18);
   text("Garbage", width-bound+15, 322);
  
}


//drop on keypress
void keyPressed(){
  if((!inIntro) && (!endGame)){
    if(swingMode && !(movingFromGarbage)){
      currentTime = millis();
      if(overGarbage && garbageFilled){
        return;     
      }
      if(overGarbage && waiting){
        inGarbage = true;  
      }
      originalx = x;
      dropTime = currentTime;
      dir = 1;
      swingMode = false;
      dropMode = true;  
      xoffset = 0;
      theta = theta0;
    }
  }
  
}

void mousePressed(){
  if(inIntro){
    inIntro = false;  
    reset();
  }
  else if(endGame){
    endGame = false;
    inIntro = true;  
  }
}

//collision test between blocks
boolean wouldCollide(float a, float b, int w, int h){
  if((b + h >= ground)){
    return true;  
  }
  for(int i = 0; i< playField.size(); i++){
    Rect current = (Rect)playField.get(i);
    if(b + h > current.y){
      if(current.x > a){
        if(current.x -a < w){
          return true;
        }  
      }
      else if(current.x < a){
          if(a-current.x < current.w){
            return true;
          }
      }
    }
  }  
  return false;
}
//choose a direction for the crane to move first
int pickDir(){
  int chosen = (int) random(0,2);
  switch(chosen){
    case 0:
      return -1;
    case 1:
      return 1;  
    
  }
  return chosen;
  
}

color pickColor(){
   int chosen = (int) random(0,3);
   switch(chosen){
     case 0:
       return color(255,0,0);
     case 1:
       return color(0,0,255);
     case 2:
       return color(11,178,37);
   }
  //unreachable
  return color(0);
}

//randomly choose a block width
int pickWidth(){
  int chosen = (int) random(0,2);
  switch(chosen){
    case 0:
      return 40;
    case 1:
      return 50;
    
  }
  //unreachable
  return chosen;
}
  //randomly choose a block height
  int pickHeight(){
  return pickWidth();  
}


//at what level are the blocks up to? (at the highest)
//don't include the garbage in this calculation
float highestY(){
  float highest = 480;
  for(int i = 0; i< playField.size(); i++){
    Rect current = (Rect)playField.get(i);
    if(!current.isGarbage){
      if(current.y < highest){
        highest = current.y;   
      }   
    }
  }
  return highest; 
}
//calculate the score
int score(){
  int score = playField.size();
  for(int i = 0; i< playField.size(); i++){
      Rect current = (Rect)playField.get(i);
      if(current.isGarbage){
        score --;  
      }
      else{ 
        for(int j = i + 1; j< playField.size(); j++){
        Rect neighbor = (Rect)playField.get(j);
        if(areNeighbors(current, neighbor) && (current.c == neighbor.c)){
             score --;  
        }
      }
      }
  }
  return score;
}

//return whether two blocks are touching
boolean areNeighbors(Rect current, Rect neighbor){
 float epsilon = 1.0;
 if((current.x > neighbor.x) && (neighbor.x + neighbor.w + epsilon  >= current.x)){
    if(current.y == neighbor.y){
      return true;
    }
  
 }
  if((neighbor.x > current.x) && (current.x + current.w +epsilon >= neighbor.x)){
    if(current.y == neighbor.y){
    return true;
    }
  }
  if((neighbor.y <= current.y) && (neighbor.y + neighbor.h + epsilon >= current.y)){
    if(neighbor.x > current.x){
      if(neighbor.x - current.x <= current.w){
        return true;  
      }
    }
    else{
       if(current.x - neighbor.x <= neighbor.w){
         return true;
       }
    } 
  }
  if((current.y <= neighbor.y) && (current.y + current.h + epsilon >= neighbor.y)){ 
    if(current.x > neighbor.x){
      if(current.x - neighbor.x <= neighbor.w){
        return true;  
      }
    }
    else{
       if(neighbor.x - current.x <= current.w){
         return true;
       }
    } 
  }
  return false;
}


