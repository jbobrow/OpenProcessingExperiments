
//import processing.pdf.*;

///////////////////////////////////////////////
/// Written by Jason Wang, 19th MAR 2011 ///
///////////////////////////////////////////////


int patternSeperationX = 55;
int patternSeperationY = 55;


void setup(){
  size(800,400);
  //beginRecord(PDF, "project142_pattern.pdf");
  background(255,200,20);
  smooth();
  noStroke();
   //stroke(0);
 noLoop();
  
  
  for(int i = 0; i < width/patternSeperationX+1; i++){
      for(int j = 0; j < height/patternSeperationY+1; j++){
        pushMatrix();
        translate(i*patternSeperationX, j*patternSeperationY);
        yourFunction();
        popMatrix();
      }
  }
  
}


void draw()
{
  

    
  
//endRecord(); 





  
}


void yourFunction(){
  
fill(201,22,12); 
ellipse(0, 0, 50, 50);
fill(255);
ellipse(0, 0, 45, 45);

for(int b=0;b<12;b++){
pushMatrix();  
translate(0, 0);
fill(201,22,12,50);
rotate(radians(b*30));
ellipse(0, 0, 10, 45);
popMatrix();

fill(201,22,12); 
ellipse(0, 0, 15, 15);
fill(255); 
ellipse(0, 0, 10, 10);
fill(201,22,12); 
ellipse(0, 0, 5, 5);
}


fill(201,22,12); 
ellipse(55, 55, 50, 50);
fill(255);
ellipse(55, 55,45, 45);
  
for(int a=0;a<12;a++){
pushMatrix();  
translate(55, 55);
fill(201,22,12,50);
rotate(radians(a*30));
ellipse(0, 0,  10, 45);
popMatrix();

fill(201,22,12); 
ellipse(55, 55, 15, 15);
fill(255); 
ellipse(55, 55, 10, 10);
fill(201,22,12); 
ellipse(55, 55, 5, 5);




}




  
  
}


