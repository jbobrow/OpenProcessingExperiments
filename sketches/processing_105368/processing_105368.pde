
//Declarations: 
PImage cat;
float xpos; //declare a variable for x
float ypos; //declare a variable for y
float xpos2; //declare a variable for x
float ypos2; //declare a variable for y
float xs; //declare a variable for x
float ys; //declare a variable for y
PFont texty;
boolean button = false; 
PImage star;
int bw ; //button width
int bh;  //button heaight
PImage scat;
PImage pilot;
PImage nyan;
//import processing.video.*;
//Movie nyan;



/*
float xs; //declare a variable for x
 float ys; //declare a variable for y
 int radius; //radius!!
 // Global gravity variable
 float gravity = 1; */

//Setup
void setup() {

  size(800, 600);
 // nyan = new Movie(this, "nyan.mov");
 // nyan.loop();
  nyan = loadImage("nyan.png");
  cat = loadImage("spacecat.jpg"); 
  scat = loadImage("scat.png"); 

  star = loadImage("star.png");

  pilot = loadImage("pilot.jpg"); 
 xpos = 25;
  ypos = 590;
  xpos2 = 1;
  ypos2 = 800;
  xs = 5;
  ys = -6;
  bw = 150;
  bh = 100;
  
  texty= loadFont("Gurmuk.vlw");
  
} 
//Draw

void draw() {
  
  textFont(texty);
   textSize(40);
  image(cat, 0, 0); 
 
    fill(255);
    text("This space cat is JUMPIN'!", 10, 75);
   xpos = xpos + xs; 
 image(pilot,xpos,ypos/2);  
 image(nyan,xpos,ypos/2); 
 

 
 
 //button HYPERSPACE start  
    fill(255);
ellipse(690, 100, bw, bh);

     fill(200, 0, 0);
ellipse(690, 100, bw -20, bh - 20);

  textSize(16);
fill(0);
   text("HYPERSPACE!", 640, 110);
   xpos = xpos + xs -2 ; 
 image(pilot,xpos,ypos/2); 
 
 //button follows 
 
if (mouseX > 650 && mouseX < 690 + bw && mouseY > 50 && mouseY < 50 + bh && mousePressed) { 
button = !button; 
 } 
 if (button) {
   xpos2 = xpos2 + xs;
       ypos = ypos + ys;
        ypos2 = ypos2 + ys;
       
       image(star,xpos2,ypos2); 
        image(scat,500,ypos/2); 
 }
   

   
     //button NYAN ME sstarts
  
   fill(255);
ellipse(125, 500, bw, bh);

     fill(200, 0, 0);
ellipse(125, 500, bw -20, bh - 20);

  textSize(16);
fill(255);
   text("NYAN ME!", 80, 520);
 

  if (mouseX < width/2 && mouseY >500){ 

 image(nyan,100,100); 
 } 
 
// if (mouseX > 50 && mouseX < 100 + bw && mouseY > 450 && mouseY < 550 + bh) { 
   
  

 //end button 1 shape

 
   
// End button

}
// Called every time a new frame is available to read
//void movieEvent(Movie m) {
//  m.read();



