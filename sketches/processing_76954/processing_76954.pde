
PImage fn;
PImage pu;
float fny;
float fnx;
float rhieght;
float rwidth;
float rx,rx2, rx3, rx4,  ry, ry2, ry3, ry4;
float ex,ey, ex2, ey2;
float Ediameter, Ediameter2;
float directionY, directionY2, directionY3, directionY4;
float directionX, directionX2, directionX3, directionX4;

PFont pleasure;
int pleas;
 
 void setup(){
 size(800,800);
 
 //text("PLEASURE", 20,20);
 
pleasure= loadFont("Helvetica-20.vlw");
textFont(pleasure);  
fny=20;
fnx= 20;
 ex= 400;
 ey= 400;
 ex2 = 400;
 ey2 = 400;
 Ediameter= 80;
 Ediameter2= 80;
 rx = 430;
 rx2 = 430;
 rx3 = 430;
 rx4 = 430;
 ry = 150;
 ry2 = 150;
 ry3 = 150;
 ry4 = 150;
 directionY = 0;
 directionY2 = 0;
 directionY3 = 0;
 directionY4 = 0;
 
 pleas = 0;
 
 fn=loadImage("fn.gif");

  pu= loadImage("pu.gif");
  //fill(250,91,128);
 }
  
 void draw(){
   background(244,255,31);
     image(pu,width/2,height/2);
      text("PLEASURE", 20,220);
   
   stroke(200);
   ry += directionY;
   rx += directionX;
   rx2 += directionX2;
   ry2 += directionY2;
   rx3 += directionX3;
   ry3 += directionY3;
   rx4 += directionX4;
   ry4 += directionY4;
   noFill();
  rect (rx,ry,20,20);
  rect (rx2,ry2,20,20);
  rect (rx3,ry3,20,20);
  rect (rx4,ry4,20,20);
  
  fill(213,28,214);
  rect (45,200, 40, pleas);
  
  if( dist(mouseX, mouseY, ex, ey) < 30){
   pleas --;
    
  }
  
  if (pleas == -150){
     directionY = 0;
    directionX = -5;
    directionX2 = -5;
    directionY2 = -5;
    directionX3 = 5;
    directionY3 = -5;
    directionX4 = 5;
    directionY4 = 0;
    pleas = 0;
    
    if (rx <= 0){
      rx= 430;
      ry = 150;
    
    if (ry2 <= 0){
      rx2= 430;
      ry2 = 150; 
    }
    if (ry3 <= 0){
      rx3= 430;
      ry3 = 150;
     if (rx4 >= 600){
      rx4= 430;
      ry4 = 150; 
     } 
     
      
    } 
      
    }
    

  }
  
  
  fill(250,91,128);
noStroke();
  
  //rectMode(CENTER);
   ellipseMode(CENTER);
   imageMode(CENTER);
  
  
 
 
 noFill();
 stroke(20);
  ellipse(ex,ey,Ediameter+10,Ediameter+10);
   ellipse(ex,ey,Ediameter,Ediameter);
   
    noFill();
 stroke(20);
  ellipse(ex,ey,Ediameter+40,Ediameter+40);
   ellipse(ex,ey,Ediameter,Ediameter);
   
  image(fn,mouseX,550);
  
   Ediameter ++;
   Ediameter2 ++;
   
   

  
   if(Ediameter >= 100){
     Ediameter= - Ediameter;
     if(Ediameter == 80){
       Ediameter = -Ediameter;
     }
  
   }
 
   noFill();
 stroke(20);
  ellipse(ex,ey,Ediameter+40,Ediameter+40);
   ellipse(ex2,ey2,Ediameter2+20,Ediameter2+20);
   
  image(fn,mouseX,550);
  
   Ediameter ++;
 
 
 if(Ediameter >= 40){
     Ediameter= - Ediameter;
     if(Ediameter == 380){
       Ediameter = +Ediameter;

     }
 }
 
 if(Ediameter2 >= 340){
     Ediameter2= - Ediameter2;
 if(Ediameter2 == 800){
       Ediameter2 = +Ediameter2;

     }
 }
 


 }
 
  
      
    



