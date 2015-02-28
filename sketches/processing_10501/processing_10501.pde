
//Import all Phys2D libraries
import pphys2d.bodies.*;
import pphys2d.joints.*;
import pphys2d.shapes.*;
import pphys2d.phys2d.raw.collide.*;
import pphys2d.phys2d.raw.strategies.*;
import pphys2d.phys2d.raw.forcesource.*;
import pphys2d.phys2d.util.*;
import pphys2d.phys2d.raw.shapes.*;
import pphys2d.*;



float px = 250;
float p1y = 150;
float p2y = 350;

float p1a = PI/2 +random(-.3,.3);
float p2a = -PI/2 +random(-.3,.3);

Goal g1 = new Goal(75,true);
Goal g2 = new Goal(425,false);




//Create a PPhys2D world
PPWorld world = new PPWorld();

HashSet bullets = new HashSet();
HashSet sliders = new HashSet();
HashSet scorers = new HashSet();
void setup () {
  
  //Set size and framerate
  frameRate(30);
  size(500,500);
textFont(createFont("",24),24);

  //Set a standard world gravity
  world.setGravity(0, 0);
  //Set world edges in dark gray
  world.setEdges(this, new Color (40, 40, 40));
  world.setEdgesRestitution(3);
  
  
}


void reset(){
  winner = null;
   p1Score = 0;
  p2Score = 0;
world.clear();
bullets = new HashSet();
 sliders = new HashSet();
 scorers = new HashSet();

}

boolean p1L,p1R,p2L,p2R;
void keyPressed(){
 int k = keyCode;
 if(k == 32 && (p1Score >= 10 || p2Score >= 10)) {
   reset();
 }
 if(k == 65) p1L = true; 
 if(k == 68) p1R = true; 
 if(k == 37) p2R = true; 
 if(k == 39) p2L = true; 
}
void keyReleased(){
 int k = keyCode;
 if(k == 65) p1L = false; 
 if(k == 68) p1R = false; 
 if(k == 37) p2R = false; 
 if(k == 39) p2L = false; 
  
}


float AD = .2;
void draw () {
  //Clear screen
  background(255); 
  
  g1.draw();
  g2.draw();
  
  fill(255,0,0);
  drawKicker(px,p1y,p1a);
  fill(0,0,255);
  drawKicker(px,p2y,p2a);
  
  
  if(p1L) p1a += AD;
  if(p1R) p1a -= AD;
  if(p2L) p2a += AD;
  if(p2R) p2a -= AD;
  
  
  //Draw world
  world.draw(this);
  if(frameCount % 5 == 0){
     Bullet b = new Bullet(true);
    world.add(b);
   bullets.add(b); 
 b = new Bullet(false);
    world.add(b);
   bullets.add(b); 
  }
  
  if(random(20) < 1){
    Slider s; 
      s = new Slider((random(-1,1) > 0));
      world.add(s);
      sliders.add(s);
  }
  
  
  Iterator i = bullets.iterator();
  while(i.hasNext()){
     Bullet b = (Bullet)i.next(); 
     b.age();
     if(b.dead()){
        world.remove(b);
       i.remove(); 
     }
  }
  i = sliders.iterator();
  while(i.hasNext()){
    Slider s = (Slider)i.next();
    if(g1.hit(s)){
       scorers.add(new Scorer(s.getX(),s.getY(),false));
       world.remove(s);
       i.remove();
    }
    if(g2.hit(s)){
       scorers.add(new Scorer(s.getX(),s.getY(),true));
       p1Score++; 
       world.remove(s);
       i.remove();
    }
    
  }
    i = scorers.iterator();
    while(i.hasNext()){
       Scorer s = (Scorer)i.next();
      s.draw();
     if(s.done()){
        i.remove();
     } 
    }
  fill(0);
  text("Score: "+p1Score,350,80);  
  if(winner == "1"){
  text("WINNER!",350,105);  
    
  }
  text("Score: "+p2Score,350,425);  

  if(winner == "2"){
  text("WINNER!",350,450);  
    
  }
  if(winner != null){
     text("SPACE TO RESET",150,250);
  }

}

String winner = null;

int p1Score, p2Score;

float KICK = 300;
class Bullet extends PPCircle{
  int life = 200;
  Bullet(boolean isP1){
       super(5); 
       if(isP1){
        setFillColor(new Color(255,0,0)); 
       setPosition(px,p1y);
       setVelocity(cos(p1a)*KICK,sin(p1a)*KICK);

       } else {
        setFillColor(new Color(0,0,255));         
       setPosition(px,p2y);
       setVelocity(cos(p2a)*KICK,sin(p2a)*KICK);

       }
    
       setRestitution(1);
     }
    void age(){
       life--; 
    }
    boolean dead(){
       if(life<= 0){
       return true; 
    } 
      if(g1.hit(this) || g2.hit(this)){
         return true; 
      }
    
    return false;
    }
    
}



class Goal{
    color c;
   float w = 200,h = 50;
   float left = 250 - (w/2);
   float top;
   Goal(float midy, boolean isP1){
      if(isP1){
        c = color(255,128,128);
      } else {
         c=color(128,128,255); 
      }   
     top = midy - (h/2);
 
     
     
 } 
 boolean hit(Slider s){
   float x = s.getX();
   float y = s.getY();
   if(x > left && x < left+w & y >top&& y < top+h){
      return true; 
   } 
   return false;
 }  
   
 boolean hit(Bullet s){
   float x = s.getX();
   float y = s.getY();
   if(x > left && x < left+w & y >top&& y < top+h){
      return true; 
   } 
   return false;
 }  
   
   void draw(){
     rectMode(CORNER);
     fill(c);
     stroke(0);
     rect(left,top,w,h);
   }
   
}

float SMIN = 300, SMAX=500;
class Slider extends PPBox{
    Slider(boolean startLeft){
  super(random(20,60),random(20,60));
  if(startLeft) {
      setPosition(50,250);
      setVelocity(random(SMIN,SMAX),0);
  }
   else {
     setPosition(450,250);
      setVelocity(random(-SMIN,-SMAX),0);

   }
  
  setStrokeWidth(1);
  setRotation(random(10));
  setFillColor(new Color(0,200,0));
  setStrokeColor(new Color(0,255,0));
 
    }
     
}


void   drawKicker(float px,float py,float pa){
   pushMatrix();
  translate(px,py);
  rotate(pa);
  triangle(-5,-5,20,0,-5,5);
  popMatrix(); 
}


class Scorer{
   float loc = 0;
   float gx,gy;
   float sx,sy;
   boolean wasP1;
   
   Scorer(float x, float y, boolean isP1){
     wasP1 = isP1;
     gx = 400;
     if(wasP1){
       gy = 100;
     } else {
        gy = 400; 
     }
     sx = x;
     sy = y;
   }
   void draw(){
     loc += .08;
     float x = lerp(sx,gx,loc);
     float y = lerp(sy,gy,loc);
     stroke(0); noFill();
     rect(x,y,20,20);
   }
   boolean done(){
      if(loc >= 1.0){
         if(wasP1){
            p1Score++ ;
         } else {
            p2Score++; 
         }
        if(winner == null){
           if(p1Score >= 10){
              winner = "1";
           } 
           if(p2Score >= 10){
              winner = "2";
           } 
          
        }

         return true;
      }
     return false;  
   }
   
 
  
  
}



