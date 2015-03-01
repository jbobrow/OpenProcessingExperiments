
import processing.pdf.*;

boolean runoncerect1 = false;
boolean runoncetri1 = true;
boolean runoncerect2 = false;

int trix1 = 150;
int trix2 = 300;
int trix3 = 450;
int trix4 = 300;
int trix5 = 300;
int trix6 = 700;
int l1 = 300;
int l2 = 300;
int l3 = 200;
int l4 = 200;
float rectwidth = 650;
float rectheight = 650;   
void setup(){
size(900,900);
//size(900, 900, PDF, "X:/temppro/filex2.pdf");
background(255);
smooth();
}

void draw(){
 if(runoncerect1){
       rectMode(CENTER);
        for (int i = 0; i < 5; i = i+1) {
          rect(width/2,height/2,rectwidth,rectheight);
          fill(0, 0);
          rectwidth = rectwidth + 100;
          rectheight = rectheight + 50;
         runoncerect1 = false;
       } 
        }
        
if(runoncetri1){
 rectMode(CENTER);
  for (int i = 0; i < 15; i = i+1) {
      fill(255, 0);
          stroke(0,255);
       
        triangle(trix1,trix2,trix3,trix4,trix5,trix6);
        fill(255, 0);
        fill(255, 255);
    ellipse(l1,l2,l3,l4);
    fill(0, 255);

       
      trix1 = trix1+3;
      trix2 = trix2-2;
      trix3 = trix3-3;
      trix4 = trix4-2;
      trix5 = trix5;
      trix6 = trix6 -25;    
      l1 = l1 ;
      l2 = l2 ;
      l3 = l3 - 8;
      l4 = l4  - 8;
            
    rectwidth = rectwidth + 10;
    rectheight = rectheight + 5;
   runoncetri1 = false;
 } 
  }
  
   // Exit the program 
 //println("Finished.");
 //exit(); 
}



/* example code

rect(30, 20, 55, 55);
ellipse(56, 46, 55, 55);
triangle(30, 150, 58, 20, 86, 150);

*/
