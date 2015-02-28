
color c1;
color c2;
color c3;
color c4;
color c5;

import processing.pdf.*;

void setup() {
  size(600, 600, PDF, "wallpaper.pdf");
  background(255);
  c1 = color(#224400);
  c2 = color(#669922);
  c3 = color(#77bb44);
  c4 = color(#aadd44);
  c5 = color(#ddee88);
}

void draw() {
  
  fill(c2);
  fill(c3);
  fill(c4);
  fill(c1);

  smooth();
  for (int i = -10; i < width + 70; i+=130) {
    for (int j = -10; j < height + 70; j+=100) {
      fill(#88ee44);
      roundRect(i, 0, 90, height);
    }
  }
  
  
  for (int i = -10; i < width + 70; i+=130) {
    for (int j = -10; j < height + 70; j+=100) {      
      fill(c2);
      roundRect(i+84, j+60, 50, 50);
      
      fill(c3);
      roundRect(i-5, j+35, 35, 30);
      fill(c4);
      roundRect(i+15, j+50, 12, 12);

      fill(c1);
      roundRect(i+10, j+10, 20, 20);
      roundRect(i+15, j+15, 10, 10);

      fill(c2);
      roundRect(i-20, j-5, 80, 10);
      fill(c3);
      roundRect(i-10, j-12, 40, 20);

      fill(c4);
      roundRect(i, j, 15, 70);
      fill(c1);
      roundRect(i+5, j+5, 9, 9);

      fill(c2);
      roundRect(i+80, j-15, 12, 75);
    
      fill(c3);
      roundRect(i+65, j-5, 40, 30);
            
            
      fill(c4);
      roundRect(i+55, j+8, 30, 26);
      

      fill(c1);
      roundRect(i+66, j+10, 20, 20);
    
      roundRect(i+34, j+53, 69, 8);
      
      fill(c3);
      roundRect(i+62, j+43, 36, 24);
     
     
      fill(255);
      rect(i+35, 0, 30, height);
 
    }
  } 



  println("Finished.");

  /*
  exit() here makes the sketch similar to static mode 
   the draw function is called only once so don't do anything 
   interactive or dynamically animated, your output should be produced
   instantaneously  
   */

  exit(); //if you are just testing on screen get rid of this line!
}

void roundRect(float x, float y, float w, float h)
{
  float corner = w/10.0;
  float midDisp = w/20.0;
  
  beginShape();  
  curveVertex(x+corner,y);
  curveVertex(x+w-corner,y);
  curveVertex(x+w+midDisp,y+h/2.0);
  curveVertex(x+w-corner,y+h);
  curveVertex(x+corner,y+h);
  curveVertex(x-midDisp,y+h/2.0);
  
  curveVertex(x+corner,y);
  curveVertex(x+w-corner,y);
  curveVertex(x+w+midDisp,y+h/2.0);
  endShape();
}
