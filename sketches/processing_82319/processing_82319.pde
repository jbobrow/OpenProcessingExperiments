


import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Turky t1,t2,t3,t4,t5,t6;
Gold g1;
PImage sardine;
PImage turk;
PImage turk2;
PFont font;
PImage gold;
Minim minim;
AudioPlayer player1,player2;

PImage aliopen;
PImage aliclosed;
PImage back;

Sardine s1,s2,s3,s4;
float meter;
float my;
int lives;
float aliy;
float aliy2;

 void setup(){
 size(800,800);
 imageMode(CENTER);
 
  minim = new Minim(this);
   player1 = minim.loadFile("gulp.mp3", 2048);
   player2 = minim.loadFile("yuck.mp3", 2048);
   // player1.play();
 
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
 
 g1 = new Gold(random(10,790),20,random(4,9));
 
 meter = 0;
 my = 200;
 lives = 3;
 back = loadImage("back.gif");
 aliclosed = loadImage("aliclosed.gif");
 aliopen = loadImage("aliopen.gif");
 turk = loadImage("turkey-bonus.gif");
 sardine = loadImage("sardine.gif");
 turk2 = loadImage("turk2.gif");
 font = loadFont("Helvetica-48.vlw");
 gold = loadImage("gold.gif");
 textFont(font);
 aliy = 730;
 aliy2 = 1000;
 }
 void draw(){
   image(back, width/2,height/2);
   t1.display();
   t1.fall();
   t1.MouthOpen();
   t2.MouthOpen();
   t2.display();
   t2.fall();
   t3.display();
   t3.fall();
   t3.MouthOpen();
   t4.display();
   t4.fall();
    t4.MouthOpen();
   t5.display();
   t5.fall();
    t5.MouthOpen();
   t6.display();
   t6.fall();
    t6.MouthOpen();
   
   s1.display();
   s1.fall();
   s2.display();
   s2.fall();
   s3.display();
   s3.fall();
   s4.display();
   s4.fall();
   
   g1.display();
   g1.fall();
   
   
   
   image(aliclosed, mouseX,aliy);
   image(aliopen, mouseX, aliy2);
   
  /* if(dist(t1.x,t1.y,mouseX, 790) < 50){
     aliy =1000;
     aliy2 =730;
   
     
   }
   if(dist(t2.x,t2.y,mouseX, 790) < 50){
     aliy =1000;
     aliy2 =730;
   }
   if(dist(t3.x,t3.y,mouseX, 790) < 50){
     aliy =1000;
     aliy2 =730;
   }
   if(dist(t4.x,t4.y,mouseX, 790) < 50){
     aliy =1000;
     aliy2 =730;
   }
   if(dist(t5.x,t5.y,mouseX, 790) < 50){
     image(aliopen, mouseX, 730);
   }
   if(dist(t6.x,t6.y,mouseX, 790) < 50){
     aliy =1000;
     aliy2 =730;
   }*/
   
   fill(247,25,25);
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
   
    /*if(dist(t1.x,t1.y,mouseX, 790) < 100){
     aliy =1000;
     aliy2 =730;
    }else{
      aliy = 730;
      aliy2 = 1000;
    }
    
      if(dist(t2.x,t2.y,mouseX, 790) < 100){
     aliy =1000;
     aliy2 =730;
    }else{
      aliy = 730;
      aliy2 = 1000;
    }
      if(dist(t3.x,t3.y,mouseX, 790) < 100){
     aliy =1000;
     aliy2 =730;
    }else{
      aliy = 730;
      aliy2 = 1000;
    }
      if(dist(t4.x,t4.y,mouseX, 790) < 100){
     aliy =1000;
     aliy2 =730;
    }else{
      aliy = 730;
      aliy2 = 1000;
    }
      if(dist(t5.x,t5.y,mouseX, 790) < 100){
     aliy =1000;
     aliy2 =730;
    }else{
      aliy = 730;
      aliy2 = 1000;
    }
      if(dist(t6.x,t6.y,mouseX, 790) < 100){
     aliy =1000;
     aliy2 =730;
    }else{
      aliy = 730;
      aliy2 = 1000;
    }*/
   
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
       //aliy =1000;
       //aliy2 =730;
        player1.play();
        player1.cue(0);
        //image(aliopen, mouseX,730);///----------------- Get turkey
     }//else{
       //aliy = 730;
       //aliy2 = 1000;
     //}
    
   
      //if((dist(x,y,mouseX, 790) < 50) && aliy == 1000 && aliy2 == 730){
      // aliy =730;
       // aliy2 =1000;
    // }
     
     if(meter <= -150){
       yspeed = 0;
       x = -500;
     }
     
     if(lives <=0){
     yspeed = 0;
     x = -500;
   }
   }
   
   void MouthOpen(){
      if(dist(x,y,mouseX, 790) < 100){
       aliy =1000;
       aliy2 =730;
     }else{
        aliy =730;
       aliy2 =1000;
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
       player2.play();
       player2.cue(0);
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
 
 class Gold{
   float x;
   float y;
   float yspeed;
  // PImage turkey;
   
   
   Gold(float tx, float ty, float tsp){
     x= tx;
     y= ty;
     yspeed= tsp;
   }
   
   void display(){
     stroke(0);
     fill(0);
    // turkey = loadImage("turkey-bonus.gif");
     image(gold,x,y);
     
    
    
   }
   
   void fall(){
     y += yspeed;
     
     if(y >= 900){
     y = -300;
     x = random(10,790);
     }
     if(dist(x,y,mouseX, 790) < 50){
      lives = 3;
      y = -3000;
     }//else{
       //aliy = 730;
       //aliy2 = 1000;
     //}
    
   
      //if((dist(x,y,mouseX, 790) < 50) && aliy == 1000 && aliy2 == 730){
      // aliy =730;
       // aliy2 =1000;
    // }
     
     if(meter <= -150){
       yspeed = 0;
       x = -500;
     }
     
     if(lives <=0){
     yspeed = 0;
     x = -500;
   }
   }
   
   void MouthOpen(){
      if(dist(x,y,mouseX, 790) < 100){
       aliy =1000;
       aliy2 =730;
     }else{
        aliy =730;
       aliy2 =1000;
     }
   }
 }  
 

