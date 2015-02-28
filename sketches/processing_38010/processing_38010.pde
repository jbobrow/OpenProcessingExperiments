
import processing.pdf.*;
 
void setup() {
 
  //use this function in combination with exit() below to produce a pdf file 
  size(1024, 768, PDF, "wallpaper.pdf");
 
  /*
  Alternatively use this function to test your output on screen so you can actually see what you are doing.
  DON' FORGET TO COMMENT THE exit(); down below if you are printing on screen.
   size(1024, 768);
   */
 
  /*
  BONUS:
   Can you make a repeated pattern or a flexible algorithm that is bigger
   than the area you can visualize?  
   This function produces a "letter" size document 
   that can be printed at 200 dpi (decent printing resolution)
 
    size(2200, 1700, PDF, "wallpaper.pdf");
   */
 
 
  smooth();
  noStroke();
}
 
 
void draw() {
  // Draw something good here
  //line(0, 0, width, height);
  background(0,0,0);
  //fill(0,0,0);
  int height=20;
  int width=20;
  for (int row =0;row<= 1004;row=row+height){   
    for(int col=0;col<= 748;col=col+width){
     fill(random(255) , random(255),random(255));
     rect(row,col,width,height);
     
     
    }
  
  }
 
  /*int backgroundlen = 1024;
  int backgroundheight = 768;
  int width =20;
  int height= 20;
  int i = 0;
  int h = 0;
  boolean done= false;
  while (done= false){
    rect(i,h,width,height);
    i=i+width;
    if (i>= backgroundlen){
      h+=height;
    }
    if ((i>=backgroundlen) && (h>=backgroundheight)){
      done=true;
    }
  }
  */
  //etcetera
 
  // Exit the program 
  println("Finished.");
 
  
  exit() ;/*here makes the sketch similar to static mode 
   the draw function is called only once so don't do anything 
   interactive or dynamically animated, your output should be produced
   instantaneously  
   */
 
  //exit(); //if you are just testing on screen get rid of this line!
}

