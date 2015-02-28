
import processing.pdf.*;
float r,g,b;
int frame_number;
void setup()
{
  size(900,900);
  //beginRecord(PDF,"text.pdf");
  background(7,19,123);

  smooth();
  frame_number = 0;
 }
 
 void draw()
 {
    stroke(0,20);
    r = noise(frameCount*.01)*255;
    g = noise(frameCount*.01-34567)*255;
    b = noise(frameCount*.01+4657)*255;
    stroke(r,g,b,40);
   float angle=noise(PI*2,frameCount*.01,0.01);
   rotate(angle);

   
   for(int i=0;i<15;i++)
   {
   
    pushMatrix();
    
    translate(mouseX,mouseY*0.1);
    //inline local variable
   // float angle = random(PI*2);
    //rotate(angle);
    //line(0,0,100,0);
    noFill();
    strokeWeight(1);
    //ellipse(noise(0,100),noise(200,300),2,2);
    bezier(height,300,200,width,20,height,400,width);
    bezier(0,100,height,300,100,height,40,width);
    
    
    popMatrix();
    //bezier(100,300,200,250,300,200,400,100);
    //ellipse(56, 46, 55, 55);
    //beginShape();
   //bezier(30, 20,  80, 5,  80, 75,  30, 75);
    //endShape();
   }
 }
