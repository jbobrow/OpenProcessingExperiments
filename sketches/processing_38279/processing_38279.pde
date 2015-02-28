
import processing.pdf.*;
 
 
 
float f; //fill variable
int s = 40; //spacing of repeated shapes
int eH =50; //ellipse height
int eW=50; //ellipse width
int sw = 1; //stroke weight
 
 
 
void setup() {
  size(800, 800); //size of main frame
  smooth();
}

 
void draw() {
  background(100);
 
  /*for (int i=0;i<=width;i+=10) {
    strokeWeight(sw);
    line(width/2, height/2, i, 0); //top
    line(width/2, height/2, 0, i); //left
    line(width/2, height/2, width, i); //bottom
    line(width/2, height/2, i, height); //right
  }//*/
 
  for (int i=0;i<=height;i+=s) {    //y coordinate manip
    for (int j=0;j<=width;j+=s) {  // x coordinate manip
 
      fill(255, 25);
      ellipse(0+j, 0+i, eW, eH);
      fill(35, 35);
      ellipse(0+j, 0+i, 25, 25);
      //fill(100, 15);
      //ellipse(25+j,25+i,100,100);
       
      
    }
  }//*/
 
}
                
