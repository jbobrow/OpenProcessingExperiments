
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

int a = 50;
int c = 10;
int numCircles = 5;
float speed = 1.;
float frameX, frameY;
Boolean started = false;
PVector circles;

Minim minim;
AudioPlayer song;
AudioPlayer song1;
AudioPlayer song2;


void setup(){
  size(500,500);
  smooth();
  frameRate(38);
  circles = new PVector(250, 50);
  minim= new Minim(this);
  song = minim.loadFile("bangy.mp3");
  song1 = minim.loadFile("poppy.mp3");  
  song2 = minim.loadFile("Buzzy.mp3");


}

  void draw(){
  background(255);
   strokeWeight(3);
 
 
 //left section
 
 noStroke();
 fill(#0593F0);
 ellipse(mouseX, 250, mouseX, 50);
 ellipse(mouseY, 100, mouseY, 80);
 ellipse(mouseY, 300, mouseY, 20);
 ellipse(mouseX, 450, mouseX, 10);
 ellipse(mouseY, 500, mouseX, 5);
 ellipse(mouseX, 300, mouseX, 25);
 ellipse(mouseY, 450, mouseY, 10);
 ellipse(mouseX, 59, mouseY, 250);
 ellipse(70, mouseX, mouseY, 80);
 ellipse(50, mouseX, 50, mouseY);
 ellipse(10, mouseY, 20, mouseX);

 
 // grid layout
 
  strokeWeight(3);
  fill(255);
  stroke(#FFFFFF);
  fill(255);
  triangle(0, 0, 500, 0, 500, 500);
  triangle(0, 500, 250, 250, 500, 500);
  line (250, 250, 500, 0);

 //section (right) 

 //1
   if (mouseY > 50){
     noStroke();
     fill(#6099FA);
     rect(455, random (50, 60), 40, 60);
     
   }
 //2
   if (mouseY > 100) {
     noStroke();
     fill(#5EC6F5);
     rect( 430, random (100, 110), 80, 50);
     
   }
 //3
   if (mouseY > 150) {
     noStroke();
     fill(#3FE8DE);
     rect( 368, random (130, 140), 200, 60);
     
   }
 //4
   if (mouseY > 200) {
     noStroke();
     fill(#6099FA);
     rect( 300, random (200, 210), 100, 90);
   
 }
 //5
   if (mouseY>200) {
     noStroke();
     fill(#5EC6F5);
     rect (340, random ( 170, 180), 150, 98);
   }
 //6   
   if (mouseY > 250) {
     noStroke();
     fill(#3FE8DE);
     rect( 440, random (250, 260), 40, 180);
       }
 //7
   if (mouseY > 300) {
     noStroke();
     fill(#6099FA);
     rect( 370, random (280, 290), 100, 80);
   } 
 //8
   if (mouseY > 300) {
     noStroke();
     fill(#5EC6F5);
     rect (330, random( 300, 310), 90, 20);
   }
 //9
   if (mouseY > 350) {
     noStroke();
     fill(#3FE8DE);
     rect( 430, random (370, 380), 80, 50); 
   }
 //10
   if (mouseY > 400) {
     noStroke();
     fill(#6099FA);
     rect( 470, random (420, 430), 80, 40);
   }
 //11
   if (mouseY > 450) {
     noStroke();
     fill(#5EC6F5);
     rect( 450, random (180, 190), 90, 200);
     
   }
   
//top section  

//triangles structure
triangle(15, 5, 150, 5, 150, 135);
triangle(485, 5, 350, 5, 350, 135);
triangle (150, 135, 250, 240, 350, 135);

//circles movement
  float angle = atan2(mouseY-circles.y, mouseX-circles.x);
  float circ = cos(angle) * speed + circles.x;
  float cle = sin(angle) * speed + circles.y;
  circles.set(circ, cle, 100);
  
  fill(#73FF71);
  ellipse(circles.x, circles.y, 30, 30);
  
  
// circles area
if (circles.x > width-165){
  circles.x = 335;
  song2.loop();
}   
 if (circles.x < width- 335) {
   circles.x = 165;
   song2.loop();
 }
 if (circles.y > height-380 ){
 circles.y = 120;
 song2.loop();
 }
 
 
//  repeated grid layout

  stroke(0);
  strokeWeight(3);
  noFill();
  triangle(0, 0, 500, 0, 500, 500);
  triangle(0, 500, 250, 250, 500, 500);
  line (250, 250, 500, 0);
 
// bottom section

//create the circle and produce movement
strokeWeight(1);
fill(#FF7182);
noStroke();
ellipse(250, 400, a, a);
  

  if (mousePressed == true) {
    noCursor();
    ellipse(250, 400, a, a);
    a = a+ 2;
    
  }
  else if( a>=50){ a= a-1;
  }
 
 if ( a == 50 ) {
  song1.play(0);
 fill(255);
  ellipse(250, 400, 100, 100);

 }

//prevent it from going outside its area  
if (a >= 210 ){
  a=a-3;
  
}

// flashing 
 if (a == 209) {
   song.play(0);
   float m = millis(); 
     fill(m % 255);
    ellipse (250, 400, a, a);
    
  
 }

}


void stop()
{ 
  minim.stop();
  super.stop();
}
   
     

 





