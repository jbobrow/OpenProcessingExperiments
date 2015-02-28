
/* Includes */
// you needed this to access the library!
//import processing.pdf.*;

/* Variables */

int x1=10;
int y1=10;
int x2=20;
int y2=20;
int x3=30;
int y3=30;
int x4=40;
int y4=40;

int x5=0;
int y5=27;
int x6=100;
int y6=37;
int x7=20;
int y7=470;
int x8=30;
int y8=57;
int a = 5;

/* function */

void setup(){
  size(400,550);
 // beginRecord(PDF, "ashy.pdf");
  background(0);
  strokeWeight(2);
  stroke(0,255,0,20);
  noFill();
  smooth();
}

void draw(){
//first line

      if(y1<550){
  while (x1<350){
    strokeWeight(2);
   bezier(x1, y1, x1, x1, a, y1, a, x2);
  x1=x1+13;
  a=a+2;
  }
  x1=0;
  y1=y1+58;
 }
}

 //void keyPressed() {
//   if (key == 'q') {
 //  endRecord(); // end the recording when youve got everything you want but still inside the setup function
  // exit(); 
 //  }
// } 

