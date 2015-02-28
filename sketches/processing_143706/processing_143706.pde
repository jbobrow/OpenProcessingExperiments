
/* @pjs preload="6.jpg"; 
 */

import netscape.javascript.*;
//Variables

PImage bg;
PShape lines;

//Resolution
int rezX = 1000;
int rezY = 1000;

//Resolution Convertion
//Calculating percentage based on resolution of x-axis
float prX (float intX){
  float percent = intX / 100;
  float x = rezX * percent;
  return(x);
}

//Calculating percentage based on resolution of y-axis
float prY (float intY){
  float percent = intY / 100;
  float y = rezY * percent;
  return(y);
}


//Initial Setup
void setup(){
 //Resolution
 size(1000,1000);
 //Anti-alising
smooth();
 //Background Image
 bg = loadImage("6.jpg");
noLoop();


 }



/////////////////Lines/////////////////

//Background Blur
void LineBlur(){
   //   line(prX(),prY(),prX(),prY());

stroke(255,255,255);
  strokeWeight(13);
//Column 1
line(prX(5),prY(100),prX(10),prY(95));
line(prX(10),prY(95),prX(10),prY(65));
line(prX(10),prY(65),prX(15),prY(60));
line(prX(15),prY(60),prX(15),prY(50));
line(prX(10),prY(70),prX(20),prY(60));
line(prX(20),prY(60),prX(20),prY(45));
line(prX(10),prY(100),prX(15),prY(95));
line(prX(15),prY(100),prX(15),prY(85));
line(prX(20),prY(100),prX(20),prY(90));
line(prX(20),prY(90),prX(10),prY(80));
line(prX(20),prY(70),prX(15),prY(65));
line(prX(15),prY(85),prX(20),prY(80));
line(prX(20),prY(80),prX(20),prY(70));
//Column 2
line(prX(25),prY(100),prX(25),prY(80));
line(prX(30),prY(100),prX(30),prY(90));
line(prX(35),prY(100),prX(35),prY(95));
line(prX(40),prY(100),prX(40),prY(90));
line(prX(25),prY(85),prX(30),prY(80));
line(prX(30),prY(80),prX(35),prY(80));
line(prX(30),prY(90),prX(35),prY(85));
line(prX(35),prY(90),prX(35),prY(75));
line(prX(35),prY(90),prX(40),prY(95));
line(prX(30),prY(80),prX(25),prY(75));
line(prX(25),prY(75),prX(30),prY(70));
line(prX(25),prY(75),prX(25),prY(60));
line(prX(20),prY(70),prX(30),prY(60));
line(prX(25),prY(60),prX(20),prY(55));
line(prX(20),prY(50),prX(35),prY(35));
line(prX(40),prY(75),prX(35),prY(70));
line(prX(30),prY(60),prX(35),prY(60));
line(prX(40),prY(80),prX(40),prY(75));
line(prX(30),prY(45),prX(30),prY(30));
line(prX(25),prY(45),prX(25),prY(35));
line(prX(30),prY(45),prX(25),prY(50));
line(prX(25),prY(50),prX(25),prY(55));
line(prX(25),prY(55),prX(30),prY(60));
line(prX(30),prY(60),prX(30),prY(50));
line(prX(30),prY(50),prX(35),prY(45));
line(prX(35),prY(45),prX(35),prY(55));
line(prX(35),prY(55),prX(40),prY(60));
line(prX(30),prY(30),prX(40),prY(20));
line(prX(35),prY(25),prX(35),prY(20));
line(prX(35),prY(20),prX(40),prY(15));
line(prX(30),prY(35),prX(35),prY(30));
line(prX(35),prY(30),prX(40),prY(35));
line(prX(40),prY(70),prX(40),prY(25));

//Column 3
line(prX(45),prY(100),prX(45),prY(85));
line(prX(50),prY(100),prX(50),prY(85));
line(prX(55),prY(100),prX(55),prY(85));
line(prX(60),prY(100),prX(60),prY(80));
line(prX(45),prY(90),prX(40),prY(85));
line(prX(45),prY(85),prX(40),prY(80));
line(prX(50),prY(85),prX(45),prY(80));
line(prX(50),prY(90),prX(55),prY(85));
line(prX(55),prY(85),prX(50),prY(80));
line(prX(50),prY(80),prX(55),prY(75));
line(prX(60),prY(80),prX(55),prY(75));
line(prX(55),prY(75),prX(55),prY(50));
line(prX(50),prY(80),prX(50),prY(65));
line(prX(40),prY(75),prX(45),prY(75));
line(prX(45),prY(75),prX(50),prY(70));
line(prX(40),prY(60),prX(45),prY(55));
line(prX(45),prY(55),prX(50),prY(55));
line(prX(50),prY(55),prX(50),prY(60));
line(prX(50),prY(65),prX(45),prY(65));
line(prX(55),prY(60),prX(60),prY(55));
line(prX(40),prY(55),prX(45),prY(50));
line(prX(45),prY(50),prX(50),prY(50));
line(prX(50),prY(50),prX(55),prY(55));
line(prX(55),prY(55),prX(60),prY(50));
line(prX(60),prY(75),prX(60),prY(65));
line(prX(60),prY(50),prX(60),prY(35));
line(prX(60),prY(25),prX(60),prY(20));
line(prX(45),prY(50),prX(45),prY(30));
line(prX(50),prY(50),prX(50),prY(40));
line(prX(50),prY(40),prX(60),prY(50));
line(prX(50),prY(35),prX(60),prY(45));
line(prX(60),prY(40),prX(55),prY(35));
line(prX(55),prY(35),prX(60),prY(30));
line(prX(45),prY(40),prX(55),prY(30));
line(prX(55),prY(30),prX(55),prY(20));
line(prX(45),prY(30),prX(50),prY(25));
line(prX(50),prY(25),prX(55),prY(25));
line(prX(50),prY(25),prX(50),prY(10));
line(prX(40),prY(25),prX(45),prY(20));
line(prX(40),prY(20),prX(45),prY(15));
line(prX(50),prY(10),prX(60),prY(20));

//Column 4
line(prX(65),prY(100),prX(65),prY(90));
line(prX(70),prY(100),prX(70),prY(80));
line(prX(75),prY(100),prX(75),prY(90));
line(prX(80),prY(100),prX(80),prY(90));
line(prX(60),prY(90),prX(65),prY(85));
line(prX(65),prY(90),prX(70),prY(85));
line(prX(65),prY(85),prX(65),prY(80));
line(prX(70),prY(90),prX(75),prY(95));
line(prX(65),prY(80),prX(70),prY(75));
line(prX(70),prY(75),prX(70),prY(70));
line(prX(70),prY(70),prX(65),prY(65));
line(prX(65),prY(80),prX(60),prY(75));
line(prX(60),prY(65),prX(70),prY(55));
line(prX(75),prY(85),prX(75),prY(55));
line(prX(70),prY(65),prX(75),prY(65));
line(prX(75),prY(70),prX(80),prY(65));
line(prX(80),prY(85),prX(80),prY(75));
line(prX(80),prY(60),prX(80),prY(55));
line(prX(80),prY(50),prX(80),prY(40));
line(prX(70),prY(55),prX(70),prY(60));
line(prX(70),prY(55),prX(65),prY(50));
line(prX(65),prY(50),prX(65),prY(35));
line(prX(65),prY(45),prX(70),prY(40));
line(prX(70),prY(50),prX(70),prY(25));
line(prX(70),prY(50),prX(75),prY(55));
line(prX(70),prY(45),prX(80),prY(55));
line(prX(70),prY(40),prX(80),prY(50));
line(prX(70),prY(30),prX(75),prY(35));
line(prX(70),prY(25),prX(60),prY(15));
line(prX(75),prY(35),prX(75),prY(45));
line(prX(60),prY(30),prX(70),prY(30));
line(prX(65),prY(30),prX(60),prY(25));
line(prX(65),prY(30),prX(65),prY(20));
line(prX(65),prY(20),prX(60),prY(15));
line(prX(80),prY(90),prX(75),prY(85));
line(prX(85),prY(85),prX(85),prY(75));
line(prX(80),prY(75),prX(85),prY(75));
line(prX(90),prY(75),prX(85),prY(70));
line(prX(85),prY(70),prX(85),prY(50));

//Column 5
line(prX(85),prY(100),prX(85),prY(90));
line(prX(90),prY(100),prX(90),prY(70));
line(prX(95),prY(100),prX(90),prY(95));
line(prX(85),prY(90),prX(80),prY(85));
line(prX(90),prY(90),prX(85),prY(85));
line(prX(85),prY(65),prX(80),prY(60));
line(prX(85),prY(55),prX(80),prY(50));
filter(BLUR,1.5);
}

void Lines(){
   //Foreground
stroke(255,255,255);
  strokeWeight(9);

//Column 1
line(prX(5),prY(100),prX(10),prY(95));
line(prX(10),prY(95),prX(10),prY(65));
line(prX(10),prY(65),prX(15),prY(60));
line(prX(15),prY(60),prX(15),prY(50));
line(prX(10),prY(70),prX(20),prY(60));
line(prX(20),prY(60),prX(20),prY(45));
line(prX(10),prY(100),prX(15),prY(95));
line(prX(15),prY(100),prX(15),prY(85));
line(prX(20),prY(100),prX(20),prY(90));
line(prX(20),prY(90),prX(10),prY(80));
line(prX(20),prY(70),prX(15),prY(65));
line(prX(15),prY(85),prX(20),prY(80));
line(prX(20),prY(80),prX(20),prY(70));
//Column 2
line(prX(25),prY(100),prX(25),prY(80));
line(prX(30),prY(100),prX(30),prY(90));
line(prX(35),prY(100),prX(35),prY(95));
line(prX(40),prY(100),prX(40),prY(90));
line(prX(25),prY(85),prX(30),prY(80));
line(prX(30),prY(80),prX(35),prY(80));
line(prX(30),prY(90),prX(35),prY(85));
line(prX(35),prY(90),prX(35),prY(75));
line(prX(35),prY(90),prX(40),prY(95));
line(prX(30),prY(80),prX(25),prY(75));
line(prX(25),prY(75),prX(30),prY(70));
line(prX(25),prY(75),prX(25),prY(60));
line(prX(20),prY(70),prX(30),prY(60));
line(prX(25),prY(60),prX(20),prY(55));
line(prX(20),prY(50),prX(35),prY(35));
line(prX(40),prY(75),prX(35),prY(70));
line(prX(30),prY(60),prX(35),prY(60));
line(prX(40),prY(80),prX(40),prY(75));
line(prX(30),prY(45),prX(30),prY(30));
line(prX(25),prY(45),prX(25),prY(35));
line(prX(30),prY(45),prX(25),prY(50));
line(prX(25),prY(50),prX(25),prY(55));
line(prX(25),prY(55),prX(30),prY(60));
line(prX(30),prY(60),prX(30),prY(50));
line(prX(30),prY(50),prX(35),prY(45));
line(prX(35),prY(45),prX(35),prY(55));
line(prX(35),prY(55),prX(40),prY(60));
line(prX(30),prY(30),prX(40),prY(20));
line(prX(35),prY(25),prX(35),prY(20));
line(prX(35),prY(20),prX(40),prY(15));
line(prX(30),prY(35),prX(35),prY(30));
line(prX(35),prY(30),prX(40),prY(35));
line(prX(40),prY(70),prX(40),prY(25));

//Column 3
line(prX(45),prY(100),prX(45),prY(85));
line(prX(50),prY(100),prX(50),prY(85));
line(prX(55),prY(100),prX(55),prY(85));
line(prX(60),prY(100),prX(60),prY(80));
line(prX(45),prY(90),prX(40),prY(85));
line(prX(45),prY(85),prX(40),prY(80));
line(prX(50),prY(85),prX(45),prY(80));
line(prX(50),prY(90),prX(55),prY(85));
line(prX(55),prY(85),prX(50),prY(80));
line(prX(50),prY(80),prX(55),prY(75));
line(prX(60),prY(80),prX(55),prY(75));
line(prX(55),prY(75),prX(55),prY(50));
line(prX(50),prY(80),prX(50),prY(65));
line(prX(40),prY(75),prX(45),prY(75));
line(prX(45),prY(75),prX(50),prY(70));
line(prX(40),prY(60),prX(45),prY(55));
line(prX(45),prY(55),prX(50),prY(55));
line(prX(50),prY(55),prX(50),prY(60));
line(prX(50),prY(65),prX(45),prY(65));
line(prX(55),prY(60),prX(60),prY(55));
line(prX(40),prY(55),prX(45),prY(50));
line(prX(45),prY(50),prX(50),prY(50));
line(prX(50),prY(50),prX(55),prY(55));
line(prX(55),prY(55),prX(60),prY(50));
line(prX(60),prY(75),prX(60),prY(65));
line(prX(60),prY(50),prX(60),prY(35));
line(prX(60),prY(25),prX(60),prY(20));
line(prX(45),prY(50),prX(45),prY(30));
line(prX(50),prY(50),prX(50),prY(40));
line(prX(50),prY(40),prX(60),prY(50));
line(prX(50),prY(35),prX(60),prY(45));
line(prX(60),prY(40),prX(55),prY(35));
line(prX(55),prY(35),prX(60),prY(30));
line(prX(45),prY(40),prX(55),prY(30));
line(prX(55),prY(30),prX(55),prY(20));
line(prX(45),prY(30),prX(50),prY(25));
line(prX(50),prY(25),prX(55),prY(25));
line(prX(50),prY(25),prX(50),prY(10));
line(prX(40),prY(25),prX(45),prY(20));
line(prX(40),prY(20),prX(45),prY(15));
line(prX(50),prY(10),prX(60),prY(20));

//Column 4
line(prX(65),prY(100),prX(65),prY(90));
line(prX(70),prY(100),prX(70),prY(80));
line(prX(75),prY(100),prX(75),prY(90));
line(prX(80),prY(100),prX(80),prY(90));
line(prX(60),prY(90),prX(65),prY(85));
line(prX(65),prY(90),prX(70),prY(85));
line(prX(65),prY(85),prX(65),prY(80));
line(prX(70),prY(90),prX(75),prY(95));
line(prX(65),prY(80),prX(70),prY(75));
line(prX(70),prY(75),prX(70),prY(70));
line(prX(70),prY(70),prX(65),prY(65));
line(prX(65),prY(80),prX(60),prY(75));
line(prX(60),prY(65),prX(70),prY(55));
line(prX(75),prY(85),prX(75),prY(55));
line(prX(70),prY(65),prX(75),prY(65));
line(prX(75),prY(70),prX(80),prY(65));
line(prX(80),prY(85),prX(80),prY(75));
line(prX(80),prY(60),prX(80),prY(55));
line(prX(80),prY(50),prX(80),prY(40));
line(prX(70),prY(55),prX(70),prY(60));
line(prX(70),prY(55),prX(65),prY(50));
line(prX(65),prY(50),prX(65),prY(35));
line(prX(65),prY(45),prX(70),prY(40));
line(prX(70),prY(50),prX(70),prY(25));
line(prX(70),prY(50),prX(75),prY(55));
line(prX(70),prY(45),prX(80),prY(55));
line(prX(70),prY(40),prX(80),prY(50));
line(prX(70),prY(30),prX(75),prY(35));
line(prX(70),prY(25),prX(60),prY(15));
line(prX(75),prY(35),prX(75),prY(45));
line(prX(60),prY(30),prX(70),prY(30));
line(prX(65),prY(30),prX(60),prY(25));
line(prX(65),prY(30),prX(65),prY(20));
line(prX(65),prY(20),prX(60),prY(15));
line(prX(80),prY(90),prX(75),prY(85));
line(prX(85),prY(85),prX(85),prY(75));
line(prX(80),prY(75),prX(85),prY(75));
line(prX(90),prY(75),prX(85),prY(70));
line(prX(85),prY(70),prX(85),prY(50));

//Column 5
line(prX(85),prY(100),prX(85),prY(90));
line(prX(90),prY(100),prX(90),prY(70));
line(prX(95),prY(100),prX(90),prY(95));
line(prX(85),prY(90),prX(80),prY(85));
line(prX(90),prY(90),prX(85),prY(85));
line(prX(85),prY(65),prX(80),prY(60));
line(prX(85),prY(55),prX(80),prY(50));

}
/////////////////Spots/////////////////
//Randomizing ends into circle or point
void spot (float intX, float intY){
  int shape;
  shape = (int)random(2);  
  switch(shape){
    case 0://Point
      strokeWeight(30);
      stroke(255,255,255);
      point(intX, intY);
      break;
    case 1://Circle
      fill(#0B40D8);
      stroke(255,255,255);
      strokeWeight(4);
      ellipse(intX, intY,30,30);
      break;
    default:
      break;
  }
  }


void Spots(){
  //Spots spot(prX(),prY());
spot(prX(15),prY(50));
spot(prX(20),prY(45));
spot(prX(25),prY(80));
spot(prX(25),prY(35));
spot(prX(30),prY(70));
spot(prX(35),prY(95));
spot(prX(35),prY(75));
spot(prX(35),prY(70));
spot(prX(35),prY(60));
spot(prX(35),prY(35));
spot(prX(40),prY(90));
spot(prX(40),prY(85));
spot(prX(40),prY(70));
spot(prX(40),prY(15));
spot(prX(45),prY(80));
spot(prX(45),prY(65));
spot(prX(45),prY(20));
spot(prX(45),prY(15));
spot(prX(50),prY(60));
spot(prX(55),prY(50));
spot(prX(55),prY(20));
spot(prX(60),prY(55));
spot(prX(60),prY(35));
spot(prX(60),prY(15));
spot(prX(65),prY(65));
spot(prX(65),prY(35));
spot(prX(70),prY(80));
spot(prX(70),prY(65));
spot(prX(70),prY(60));
spot(prX(75),prY(90));
spot(prX(80),prY(65));
spot(prX(80),prY(40));
spot(prX(85),prY(50));
spot(prX(90),prY(70));

}

void backgroundSquares(){

  for (int i = 250; i > 0; i = i-1){
    
    int fade = (int)random(1,127);
    int size = (int)random(50,100);
    int x = (int)random(50,950);
    int y = (int)random(50,950);
    int gColor = (int)random(30,65);
    int bColor = (int)random(140,255);
    fill(0,gColor,bColor,fade);
    noStroke();
    strokeWeight(10);
    ellipse(x,y,size,size);
    
}
}

void tri(){
  filter(BLUR,1);
   noStroke();
 fill(#0B40D8,30);
 triangle(-250,1250,500,-250,1250,1250);
 }
 
 void outliner(){
  noFill();
  strokeWeight(250);
  stroke(0,0,0,170);
  bezier(prX(50),prY(-15),prX(-35),prY(0),prX(-35),prY(100),prX(50),prY(115));
  bezier(prX(50),prY(115),prX(135),prY(100),prX(135),prY(0),prX(50),prY(-15));
 }
 
 
 
 
void draw(){
 
image(bg,0,0);
 backgroundSquares();
 outliner();
 tri();
 LineBlur();
 Lines();
 Spots();
 

 
 

 


}




