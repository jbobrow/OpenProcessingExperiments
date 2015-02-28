
Turky t1,t2,t3,t4,t5,t6;
PImage sardine;
PImage turk;
PImage turk2;
PFont font;

Sardine s1,s2,s3,s4;
float meter;
float my;
int lives;

 void setup(){
 size(800,800);
 imageMode(CENTER);
 
 t1 = new Turky(random(10,790),random(10,490),random(2,5));
 t2 = new Turky(random(10,790),random(10,490),random(2,5));
 t3 = new Turky(random(10,790),random(10,490),random(2,5));
 t4 = new Turky(random(10,790),random(10,490),random(2,5));
 t5 = new Turky(random(10,790),random(10,490),random(2,5));
 t6 = new Turky(random(10,790),random(10,490),random(2,5));
 
 
 s1 = new Sardine(random(10,790),20,random(4,9));
 s2 = new Sardine(random(10,790),20,random(4,9));
 s3 = new Sardine(random(10,790),20,random(4,9));
 s4 = new Sardine(random(10,790),20,random(4,9));
 
 meter = 0;
 my = 200;
 lives = 3;
 
 turk = loadImage("turkey-bonus.gif");
 sardine = loadImage("sardine.gif");
 turk2 = loadImage("turk2.gif");
 font = loadFont("Helvetica-48.vlw");
 textFont(font);
 
 }
 void draw(){
   background(255);
   t1.display();
   t1.fall();
   t2.display();
   t2.fall();
   t3.display();
   t3.fall();
   t4.display();
   t4.fall();
   t5.display();
   t5.fall();
   t6.display();
   t6.fall();
   
   s1.display();
   s1.fall();
   s2.display();
   s2.fall();
   s3.display();
   s3.fall();
   s4.display();
   s4.fall();
   
   
   ellipse(mouseX,790, 100,100);
   
   rect(740,300,40,meter);
   rect(740,150,40,1);
   text("full",740,148);
   text("LIVES:", 570,750);
   text(lives,750,750);
   
   if(meter<= -150){
     text("You Win",400,400);
   }
   
   if(lives <=0){
     text("YOU LOSE", 250,400);
   }
   
   
   
 }
 
 class Turky{
   float x;
   float y;
   float yspeed;
  // PImage turkey;
   
   
   Turky(float tx, float ty, float tsp){
     x= tx;
     y= ty;
     yspeed= tsp;
   }
   
   void display(){
     stroke(0);
     fill(0);
    // turkey = loadImage("turkey-bonus.gif");
     image(turk2,x,y);
     
    
    
   }
   
   void fall(){
     y += yspeed;
     
     if(y >= 900){
     y = -30;
     x = random(10,790);
     }
     if(dist(x,y,mouseX, 790) < 50){
       y = -30;
       x = random(20,790);
       meter -= 15;
     }
     
     if(meter <= -150){
       yspeed = 0;
       x = -500;
     }
     
     if(lives <=0){
     yspeed = 0;
     x = -500;
   }
   }
 }
 
  class Sardine{
   float sx;
   float sy;
   float syspeed;
   
   Sardine(float Ssx, float Ssy, float Sssp){
     sx= Ssx;
    sy= Ssy;
     syspeed= Sssp;
   }
   
   void display(){
     stroke(0);
     fill(0);
   image(sardine, sx, sy);
    
   }
   
   void fall(){
     sy += syspeed;
     
     if(sy >= 900){
     sy = -90;
     sx = random(10,790);
     }
     
     if(dist(sx,sy,mouseX, 790) < 50){
       sy = -90;
       sx = random(20,790);
       lives --;
     }
     if(meter <= -150){
       syspeed = 0;
       sx =-500;
    
     }
     
     if(lives <=0){
     syspeed = 0;
     sx = -500;
   }
     
   }
 }
   
   
 

