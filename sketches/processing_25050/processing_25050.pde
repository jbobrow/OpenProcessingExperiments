
//////This code was taken and edit from open processing. It was originally written by Ben Jack.
/// Written by Ben Jack, 14th February 2011 
import processing.pdf.*;

int patternSeperationX =500;
int patternSeperationY = 500; 


void setup() {
  size (500,1000);
  smooth();
  beginRecord(PDF, "filename.pdf");
}
void draw(){
  design();
}
void design() {

  float x = 500;
  smooth();

  background (5);

  fill (115);
  ellipse(250,250,450, 450);


  fill (0);
  ellipse(250, 250, 300, 300);
  
  fill(115, 175);
  ellipse(250, 600, 200, 200);
  
  fill(153);
  ellipse(250, 650, 50, 50);
  
  
  fill(0);
  ellipse(250,600,160,160);
  

  stroke(153);
  line(0, 0, x, x);
  line(0, 0, 460, x);
  line(0, 0, 420, x);
  line(0, 0, 380, x);
  line(0, 0, 340, x);
  line(0, 0, 300, x);
  line(0, 0, 260, x);
  line(0, 0, 220, x);
  line(0, 0, 180, x);
  line(0, 0, 140, x);
  line(0, 0, 100, x);
  line(0, 0, 60, x);
  line(0, 0, 20, x);

  line(500,0, 0, 500);
  line(500,0, 40, 500);
  line(500,0, 80, 500);
  line(500,0, 120, 500);
  line(500,0, 160, 500);
  line(500,0, 200, 500);
  line(500,0, 240, 500);
  line(500,0, 280, 500);
  line(500,0, 320, 500);
  line(500,0, 360, 500);
  line(500,0, 400, 500);
  line(500,0, 440, 500);
  line(500,0, 480, 500);

  stroke(100);
  line(200, 200, 300, 200);
  line(200, 200, 250, 100);
  line(300, 200, 250, 100);
  noStroke();
  fill(30);
  ellipse(250, 165, 50, 50);
  
  
    stroke(153);
  line(0, height, x, x);
  line(0, height, 460, x);
  line(0, height, 420, x);
  line(0, height, 380, x);
  line(0, height, 340, x);
  line(0, height, 300, x);
  line(0, height, 260, x);
  line(0, height, 220, x);
  line(0, height, 180, x);
  line(0, height, 140, x);
  line(0, height, 100, x);
  line(0, height, 60, x);
  line(0, height, 20, x);

  line(500,height, 0, 500);
  line(500,height, 40, 500);
  line(500,height, 80, 500);
  line(500,height, 120, 500);
  line(500,height, 160, 500);
  line(500,height, 200, 500);
  line(500,height, 240, 500);
  line(500,height, 280, 500);
  line(500,height, 320, 500);
  line(500,height, 360, 500);
  line(500,height, 400, 500);
  line(500,height, 440, 500);
  line(500,height, 480, 500);
  
  fill (150,50,5, 220);
  ellipse(250, 250, 55, 55);
  
  fill (150,10,5, 185);
  ellipse(250, 600 , 35, 35);
  endRecord();
  
}  


