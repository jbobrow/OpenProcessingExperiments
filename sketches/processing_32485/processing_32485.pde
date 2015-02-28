
/* Includes */
// you needed this to access the library!
//import processing.pdf.*;

/* Variables */

int x1=45;
int y1=27;
int h =50;
int w=50;
int x2=25;
int y2=25;
int a=10;

/* function */

void setup(){
  size(400,550);
 // beginRecord(PDF, "AshA.pdf");
  background(0);
  noFill();
  stroke(0,255,0,20);
  smooth();
}

void draw(){
//first line of code
  if(y1<550){
  while (x1<350){
    strokeWeight(3);
   bezier(x1, y1, 10, x1, a, 90, a, 80);
  x1=x1+5;
  a=a+12;
  }
  x1=0;
  y1=y1+58;
 }

  
    if(y1<550){
  while (x1<350){
    strokeWeight(2);
   bezier(x1, y1, x1, x1, a, y1, a, x2);
  x1=x1+5;
  a=a+12;
  }
  x1=0;
  y1=y1+58;
 }
}
 
 /*void keyPressed() {
   if (key == 'q') {
   endRecord(); // end the recording when youve got everything you want but still inside the setup function
   exit(); 
   }
 } 
*/

