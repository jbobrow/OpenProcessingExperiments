
//Jasmine Hoyle
//Lesson 1 Project
//RGB shapes follow mouse
 
 void setup(){
   size (300,300);
   ellipseMode(CENTER);
   rectMode(CENTER);
   
   
   
 }
 
 void draw(){
   background (25,35,68);
   smooth();
   ellipse(mouseX+80, mouseY, 50,50);
   ellipse(mouseX-80, mouseY, 50, 50); 
   fill(200,0,0);
   stroke(200,0,0);
   ellipse(mouseX, mouseY, 150,150);
   fill(0,200,0);
   rect(mouseX-25, mouseY-25, 30,60); 
   rect(mouseX+25, mouseY-25,30,60);
   strokeWeight(5);
   stroke(255);
   line(mouseX-25, mouseY-50, mouseX-25, mouseY);
   line(mouseX+25, mouseY-50, mouseX+25, mouseY);
   fill(255);
   stroke(0,200,0);
   ellipse(mouseX, mouseY+30, 30,30);
   
   
   
 }

