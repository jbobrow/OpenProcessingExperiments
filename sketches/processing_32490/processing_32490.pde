
/* Includes */
// you needed this to access the library!
//import processing.pdf.*;

/* Variables */

int x1=5;
int y1=300;
int h =89;
int w=670;
int x2=340;
int y2=760;
int a=30;

/* function */

void setup(){
  size(400,550);
 // beginRecord(PDF, "AshD.pdf");
  background(0);
  noFill();
  stroke(0,255,0,30);
  smooth();
  
}

void draw(){
//first line of code
  if(y1<650){
  while (x1<350){
    strokeWeight(2);
   bezier(x1, y1, w, x1, a, y2, a, h);
  x1=x1+5;
  a=a+2;
  }
  x1=0;
  y1=y1*2;
 }
// second line of code   
    if(y1<650){
  while (x1<350){
    strokeWeight(2);
   bezier(x1, y1, x2, y2, w, h, a, x2);
  x1=x1+7;
  a=a+5;
  }
  x1=0;
  y1=y1+30;
 }
  
}
  /* void keyPressed() {
   if (key == 'q') {
   endRecord(); // end the recording when youve got everything you want but still inside the setup function
   exit(); 
   }
 }
  */


