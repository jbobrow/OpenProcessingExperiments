
/*
 Konkuk University
 SOS iDesign

Name: Chae seo rin <<------ Write your full name here!
 ID: tjfls0512 <<--------- Write your ID here!

*/

PImage img;

void setup(){
size (600, 600);
 // noLoop();
smooth();
colorMode (RGB, 600);
 img = loadImage ("wasilly kandinsky.jpg"); // put the image in the same folder as the processing file
 }

void draw(){
println(mouseX + " : " + mouseY);
image (img, 0, 0);
// here you add your code with all shapes and colors. 

   fill(255, 0, 0);
   stroke(0);
   rect(30, 350, 50, 50);
   noFill();
   stroke(216, 72, 176);
   ellipse(20, 340, 40, 40);
   line(30, 350, 110, 100);
   
   fill(0, 255, 0);
   noStroke();
   quad(250, 50, 300, 30, 350, 100, 220, 130);
   
   fill(20, 190, 255);
   strokeWeight(5);
   bezier(350, 370, 380, 400, 420, 300, 450, 370);
   point(200, 150);
   
   
 }

