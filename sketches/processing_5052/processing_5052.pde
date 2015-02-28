
import processing.pdf.*;

/*
flower
Sept 2009
illustrator9@gmail.com
*/
float turn =0;
float noiseNum = 0;

void setup() {
  size(500,500);
  background(55,45,56);
  smooth();
  
  noiseSeed(1);
//Start recording the PDF this is how to do
 beginRecord(PDF, "export.pdf");
};

void draw() {
  pushMatrix();
  translate(width/2,height/2);
  rotate(turn);
  
  //float end = random(140,10);
  float end =noise(noiseNum) * 175;
  noiseNum = noiseNum + .01;
  
  stroke(50,40);
  line(0,0,end,0);
  ellipse(end,20,23,3);
  
  turn = turn + 0.01;
  popMatrix();
  
};
void mousePressed() {
 //End the PDF recording
endRecord();
//Exit the program
exit();
};

