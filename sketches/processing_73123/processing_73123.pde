
/***************************************** 
* Assignment # 03
* Name:    R. Graham Barrett 
* E-mail:  rbarrett@haverford.edu 
* Course:  CS 110 - Section 001 
* Submitted: October 03, 2012  
* This sketch known as Suns and Rockets, is composed of
  3 randomly generated Suns and 3 randomly generated Rockets.
  When the mouse button drifts closer to the center of
  each Sun, the color of the center changes and everytime the mouse is 
  clicked and held over the Rocket's main body, the color 
  begins to randomize.  
***********************************************/

int x1;
int y1;
int x2;
int y2;
int x3;
int y3;
int x4;
int y4;
int x5;
int y5;
int x6;
int y6;
int w;
int h;

void setup() {
  size(500,500);
   background (0,0,50);
  rectMode(CENTER);
  
  x1= (int)random(0,500);
  y1= (int)random(0,500);
  x2= (int)random(0,500);
  y2= (int)random(0,500);
  x3= (int)random(0,500);
  y3= (int)random(0,500);
  w = (int)30;
  h = (int)90;
}

void draw () {
  drawSun(x1,y1,50,50);
  drawSun (x2,y2,50,50);
  drawSun (x3, y3,50,50);
  drawRocket (x1,y1,50,50);
  drawRocket (x2,y2,50,50);
  drawRocket (x3,y3,50,50);
   }

///////////Sun   
void drawSun(int x, int y, int width, int height){
  int distance = (int)dist (x,y, mouseX, mouseY);
     
   //NW Sun's Ray
 { fill(250, 100, 0);
  triangle(x-30, y-5, x-30, y-30, x-10, y-20);
 }
  
  //SW Sun's Ray
 { fill(250, 100, 0);
  triangle (x-30, y+5, x-30, y+30, x-10, y+20);
 } 
  
  //SE Sun's Ray
 { fill(250, 100, 0);
   triangle (x+30, y+5, x+30, y+30, x+10, y+20);
 }
  
  //NE Sun's Ray
 { fill(250, 100, 0);
  triangle (x+30, y-5, x+30, y-30, x+10, y-20);
 }
  
  //Upper Sun's Ray
 { fill(250, 100, 0);
  triangle (x-20, y-10, x, y-60, x+20, y-10);
 }
  
  //Left Sun's Ray
 { fill (250, 100, 0);
  triangle (x-20, y-10, x-60, y, x-20, y+10);
 }
  
  //Lower Sun's Ray
 { fill(250, 100, 0);
  triangle (x-20, y+10, x, y+60, x+20, y+10);
 }
  
  //Right Sun's Ray
 { fill (250, 100, 0);
  triangle (x+20, y-10, x+60, y, x+20, y+10);
 } 
  
  //Sun's Center 
 {   fill (255, distance*10,0);
    ellipse (x, y, 55, 55);
 } 
}

///// Rocket ship 
void drawRocket(int x, int y, int width, int height){
boolean button =false;


//Rocket Head
 { fill (150,0,0);
  triangle (x, x-80, x-15, x-45, x+15, x-45);
 }

//Rocket Exhaust 
  { fill (200,200,0);
    triangle (x, x+80, x-5, x+45, x+5, x+45);
  }

//Dorsal Fin #1
 { fill (150,0,0);
  triangle (x-15, x+10, x-25,x+65, x-15, x+45);
 }

//Dorsal Fin #2
 { fill (150,0,0);
  triangle (x+15, x+10, x+25, x+65, x+15, x+45);
 } 

//Rocket Body
 if (mouseX > x && mouseX < x+w && mouseY > x && mouseY< x+h && mousePressed) {
   button =true;
  } else { 
   button = false;
  } 
 
 if (button) {
  fill(random(0,255), random(0,255), random(0,255));
 stroke (0);
 } else {
  fill (150);
 stroke (0);
 }

rect (x,x, w, h);
 }

//
