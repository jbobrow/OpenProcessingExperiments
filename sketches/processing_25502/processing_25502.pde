
import ddf.minim.*;
import ddf.minim.signals.*;

AudioPlayer player;
Minim minim;
Candy[] candy = new Candy[50];
int sizeball = 10;

void setup() {
 size(400, 400); 
 smooth();
 frameRate(30); 
 minim = new Minim(this);

       //w1,h1(ellipse),w2,h2(rect, color not change), c1,c2,c3
 for(int i=0; i<candy.length; i++) {
       candy[i] = new Candy(random(255), random(255), random(255), random(width),(int)random(height),(int)random(1,7));
 
 }
  
    player = minim.loadFile("rainsound.wav", 2046);

  
  
} 

 

void draw() {
 background(0);
 
  
  for(int i=0; i<candy.length;i++) {
        candy[i].move();
        candy[i].display();
       
  }
}


void stop() {
  player.close();
  minim.stop();
  super.stop();
}


////////////////////////////////////////////////////
  
class Candy {
  float c1, c2, c3,x,y,sp;
  
  Candy(float _c1, float _c2, float _c3, float _x, int _y, int _sp) {
    
    c1 = _c1;
    c2 = _c2;
    c3 = _c3;
    x = _x;
    y = _y;
    sp = _sp;
  }
  



 
 void move() {
 
   y = y + sp;
    
   
   if(y > height){
    y = 0;
     player.play();
    
    
   }
 

   
 }
 
 void display() {
        
      noStroke();
      fill(c1,c2,c3);
      ellipse(x,y,sizeball,sizeball);
      fill(255);
      rectMode(CENTER);
      rect(x, sizeball+y,sizeball/5, sizeball);
  
 
}
  
 } 
 


