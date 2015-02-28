
import pphys2d.bodies.*;
import pphys2d.joints.*;
import pphys2d.shapes.*;
import pphys2d.phys2d.raw.collide.*;
import pphys2d.phys2d.raw.strategies.*;
import pphys2d.phys2d.raw.forcesource.*;
import pphys2d.phys2d.util.*;
import pphys2d.phys2d.raw.shapes.*;
import pphys2d.*;
import pphys2d.phys2d.raw.*;
import pphys2d.phys2d.math.*;

int PREGAME = 0;
int GAME = 1;
int POSTGAME = 2;
int gamemode = PREGAME;

ArrayList BuildingGhost = new ArrayList();
ArrayList BestGhost = new ArrayList();
int ghostPtr = 0;
HashSet particles = new HashSet();

PPWorld world;

void setup(){
  size(500,500);
  smooth();
  rectMode(CENTER);
  textFont(createFont("",24),24);

  world  = new PPWorld();
}
void draw(){
  background(50,50,200);
  if(gamemode == PREGAME) {
    drawPregame();
    if(isKeyDown(32)){
      
    }
  }
  if(gamemode == POSTGAME){
    drawPostgame();
  }
  if(gamemode == GAME){
//    controlRocket();
    drawChecks();

    world.draw(this);
    checkPos();
  BuildingGhost.add(new GhostRecord());

  if(BestGhost != null){
    if(ghostPtr < BestGhost.size()){ 
      GhostRecord g = (GhostRecord)BestGhost.get(ghostPtr);
      g.draw(ghostPtr);
      ghostPtr++; 
    }
  }

    drawTimes();

    rocket.draw();

  for(int ac = 0; ac < 4; ac++){
     drawArrow(ac) ;
  }

    
  }

  if(mousePressed){
    if(gamemode != GAME){
    resetGame();
      gamemode = GAME; 
    }
    mouseDragged(); 
  }
  drawControl();
  
  
  
}

void drawArrow(int ac){
  float x = 185+ac*20, y = 380;

  fill(255);   stroke(255);strokeWeight(3);

 rect(x,y,8,8);
  triangle(x+8,y - 2, x+12,y+4,x+8,y+10);

  fill(0);   stroke(0);noStroke();

 rect(x,y,8,8);
  triangle(x+8,y - 2, x+12,y+4,x+8,y+10);
}

float startLap;
Float bestLap = null;
Float lastLap = null;

void drawTimes(){
  fill(0);
  rectMode(CORNER);
  float time = (millis() - startLap)/1000;
  textAlign(LEFT);

  text("time:"+time,200,280);

  if(lastLap != null) text("last:"+lastLap,200,300);
  if(bestLap != null) text("best:"+bestLap,200,320);


}

int START = 0;
int LINE1 = 1;
int LINE2 = 2;
int lasthit = START; 

String lastmsg = "";


void checkPos(){
  float x = rocket.getX();
  float y = rocket.getY();
  if(x >= 210 && x <= 210+20 && y >=150 && y <= 150+80){
    if(lasthit == START){
      lasthit = LINE1; 
    }
  }
  if(x >= 0 && x <=40 && y >=200 && y <= 220){
    if(lasthit == LINE1){
      lasthit = LINE2; 
    } 
  }
  if(x >= 180 && x <=180+80 && y >=395){
    if(lasthit == LINE2){
      lasthit = START; 
      lastLap = (millis() - startLap)/1000;
      if(bestLap == null || lastLap < bestLap){
        bestLap = lastLap; 
        BestGhost = BuildingGhost;
        BuildingGhost = new ArrayList();
      }
      ghostPtr = 0;
      startLap = millis();
    } 
  }

}

void drawChecks(){
  rectMode(CORNER);
  fill(255);
  noStroke();
  float ssize = 20;
  int c = 0;
  for(int a = 0; a < 5; a++){
    for(int b = 0; b < 4; b++){
if((a+b)%2 == 1) fill (0); else fill(255);
      
      rect(180+(b*ssize),395+(a*ssize),ssize,ssize);    
    }
  }

  fill(random(128));
  //rect(210,150,20,80);

  fill(random(128));
 // rect(0,200,40,20);

}

  float BEESIZE = 20;
  
class Bee extends PPCircle{
  Bee(){
     super(20); 
     setDrawable(false);
  }
  
  
  
  float counter;
  void draw(){
  counter += .3;
    drawBee(getX(),getY(),getRotation(), counter,false);
}
  
}

void drawBee(float x, float y, float a, float counter, boolean isGhost){
    float  wingoff = sin(counter)*5;
    
    //print(wingoff+" ");
    pushMatrix();
    translate(x,y);
    rotate(a);
    if(isGhost) stroke(128,128,255); else stroke(0);
      noFill();
    ellipse(-3,-3+wingoff,15,15);
    ellipse(3,-3+wingoff,15,15);

  if(isGhost) noFill(); else      fill(255,255,0);
//      wingoff = sin(counter+=dist(0,0,getVelocityX(),getVelocityY())/40)*5;  
  strokeWeight(3);
    line(0,0,-BEESIZE/2,-BEESIZE/2);
    line(0,0,BEESIZE/2,-BEESIZE/2);
    
    ellipse(0,0,BEESIZE,BEESIZE);
    line(-BEESIZE/2,0,BEESIZE/2,0);
    line(-BEESIZE/2,BEESIZE/4,BEESIZE/2,BEESIZE/4);
    if(isGhost){
      fill(128,128,255); stroke(128,128,255);
    } else {
    fill(0);stroke(0);
      
    }
    ellipse(-4,-5,1,1);
    ellipse(4,-5,1,1);
    
    popMatrix(); 
  
}


Bee rocket; 
void resetGame(){ 
  startLap = millis();
  ;
  world.setGravity(0,0);
  world.setEdges(this,rockColor);
  rocket = new Bee();
 
  rocket.setFillColor(new Color(200,30,30));
  rocket.setStrokeColor(new Color(128,128,128));
  rocket.setPosition(250,450);
  rocket.setRestitution(.5);
  rocket.setRotation(PI/2);

  world.add(rocket);


  addRock(213.0,311.0,104.0,170.0);
  addRock(280.5,302.5,95.0,89.0);
  addRock(424.0,424.0,82.0,138.0);
  addRock(431.0,165.0,128.0,138.0);
  addRock(263.5,78.0,109.0,148.0);
  addRock(376.0,71.0,170.0,90.0);
  addRock(143.5,163.5,55.0,131.0);
  addRock(80.0,199.0,84.0,94.0);
  addRock(112.0,326.0,106.0,76.0);
  addRock(41.0,459.5,70.0,77.0);

}

float controlX = 440;
float controlY = 180;
float controlSize = 80;
void drawControl(){
 
   stroke(0);
  fill(200);
  strokeWeight(2);
  ellipse(controlX,controlY,controlSize,controlSize);
  fill(255,255,0);

  float dX = mouseX - controlX;
  float dY = mouseY - controlY;

  float angle = atan2(dY,dX);
  float power = dist(mouseX,mouseY,controlX,controlY);
  if(power >= 30) power = 30;

  pushMatrix();
  translate(controlX,controlY);
  ellipse(cos(angle)*power,sin(angle)*power,20,20);
  popMatrix(); 
if(rocket != null){
  rocket.setRotation(angle+PI/2);
  float m = 500;
  rocket.addForce(m*power*cos(angle),m*power*sin(angle));
}
}


Color rockColor =  new Color (50, 200, 50);

float startX,startY;
void mousePressed(){
  startX = mouseX; 
  startY = mouseY; 
}
/*
void mouseDragged(){
rectMode(CENTER);
  stroke(255);
  noFill();
  float midX = (mouseX+startX)/2;
  float midY = (mouseY+startY)/2;
  float w = abs(mouseX - startX);
  float h = abs(mouseY - startY);

  rect(midX,midY,w,h);
}
void mouseReleased(){
  float midX = (mouseX+startX)/2;
  float midY = (mouseY+startY)/2;
  float w = abs(mouseX - startX);
  float h = abs(mouseY - startY);
  addRock(midX,midY,w,h);
  // println("addRock("+midX+","+midY+","+w+","+h+")");
}
*/
void addRock(float x, float y, float w, float h){
  PPBox rock = new PPBox(w,h);
  rock.setPosition(x,y);
  rock.setFillColor(rockColor);
  rock.setStaticBody(true);
  rock.setRestitution(.5);
  world.add(rock);
}

float ROT = .2;
float MAXROT = 3;

class Particle{
  float x = rocket.getX();
  float y = rocket.getY();
  float xs;// = rocket.getVelocityX()/100;
  float ys;// = rocket.getVelocityY()/100;
Particle(int dir){
  /*float OFFSET =0;
  if(dir == UP) OFFSET = +PI/2.0;
  if(dir == LEFT) OFFSET = +PI/4.0;
  if(dir == UP) OFFSET = -PI/4.0;*/
     float rotation = rocket.getRotation() + PI/2;//OFFSET;
      ys = sin(rotation)+ (rocket.getVelocityY()/100);
      xs = cos(rotation)+ (rocket.getVelocityX()/100);
}  

  int health = 500;
  void move(){
    health --;
    x += xs;
    y += ys;
  }
  void draw(){
    noStroke();
    stroke(random(128,255),0,0);
    rect(x,y,1,1);

  }
  boolean isDead(){
    return health < 0; 
  }
}

void drawPregame(){
  //  pushMatrix();
  //  translate(width/3,height/3);
  rectMode(CORNER);
  fill(255);
  textAlign(CENTER);
  text("BeeRacer Time Trials\n\nhow fast can you go\n around the track?\n\nuse your special spin control\n\nclick to start\n\n",50,100,400,350);
  //  popMatrix();
}
void drawPostgame(){

}

HashSet keysDown = new HashSet();
void keyPressed(){
  //println(this.keyEvent.getKeyCode());
  this.keysDown.add(this.keyEvent.getKeyCode());
}
void keyReleased(){
  this.keysDown.remove(this.keyEvent.getKeyCode());  
}
boolean isKeyDown(int keyCode){
  if(keysDown.contains(keyCode)) return true;
  return false; 
}


class GhostRecord {
   float x,y,a;
   GhostRecord(){
     x = rocket.getX();
     y = rocket.getY();
     a = rocket.getRotation();
     
   }
   
   void draw(int gc){
     float c = gc / .3333;
      drawBee(x,y,a,c,true);
   }
   
}


