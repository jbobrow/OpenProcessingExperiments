
/*
 Konkuk University
 SOS iDesign

Name: Your Name <<------ Write your full name here!
 ID: Your ID <<--------- Write your ID here!

*/

PImage img;

void setup(){
size (600, 600);
 // noLoop();
smooth();
background(255);
//img = loadImage ("z.jpg"); 
 }

void draw(){
println(mouseX + " : " + mouseY);
//image (img, 0, 0);

fill(255, 167, 167); 
ellipse(100, 270, 110, 110);
ellipse(500, 270, 110, 110);
ellipse(300, 263 ,400, 300);
line (285, 260, 315, 260);

fill(0);
ellipse(235, 200, 30, 100);
ellipse(365, 200, 30, 100);



if(mousePressed){
fill(random(255),random(255),random(255));  
ellipse(235, 200, 30, 100);
ellipse(365, 200, 30, 100);
}


 }

void keyPressed(){


 }

