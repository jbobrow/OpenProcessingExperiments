
PImage bg; // this is for my background bush image
int a;  

void setup() {
 
 size(600, 600); //size of canvas
 background(100); //kinda unneccesary but i wanted to do it anyways
 noStroke();
 frameRate(30); //not sure if i need this, but it's here
  bg = loadImage("bush4.jpg"); //boo yeah!
background(bg);



}


void draw() {
 noStroke();
 rect (550, 580, 50, 20);
  fill (255);
  text("CLEAR", 555, 595);
  fill(0, 102, 153);
 stroke(0);
 strokeWeight(4);
 smooth();
     if (mousePressed) { 
       line(pmouseX, pmouseY, mouseX, mouseY); //draws a line
     
     
     if (mouseX >550) {  //if pressed in the box, then it clears the background!!!
       if (mouseY >580) {
         background (bg);}
       }


   //FUCK YEAH! I FIGURED THIS SHIT OUT!!!!
  
   
     }

   }




