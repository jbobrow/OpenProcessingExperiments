


 void setup() {
   size(200,200);
 }
 void draw() {
   background (255,200,200);
   
   //face 
   stroke(255);
   fill(255);
   ellipse (width/2,height/2,100,100);
 //Body
rectMode(CENTER);
rect(100,150,60,100);
 
 //ears  
  stroke(100);
  fill(100);
  ellipseMode(CENTER);
   ellipse(70,40,20,60);
   
   ellipseMode(CENTER);
   ellipse(130,40,20,60);

//eyes 
  fill(0,0,200);
  rectMode(CENTER);
  rect(80,90,10,20);
 //eyes2
 fill(0,0,200);
 rectMode(CENTER);
 rect(120,90,10,20);
//mouth 
stroke(300,0,0);
line(80,120,120,120);
line(100,120,100,110);
//cheek 

ellipseMode(CENTER);
fill(300,0,0);
ellipse(65,110,10,10);
ellipse(135,110,10,10);
//hands 
ellipseMode(CENTER);
fill(255);
stroke(255);
ellipse(50,150,80,20);
ellipse(150,150,80,20);

 }

