
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
  fill(255,154,3); 
ellipse(0, 0, 50, 50);
fill(255);
ellipse(0, 0,40, 40);

  
  for(int c=0;c<12;c++){
pushMatrix();  
translate(0, 0);
fill(255,154,3,50);
rotate(radians(c*30));
ellipse(0, 0, 6, 40);
popMatrix();
  
fill(255); 
ellipse(0, 0, 15, 15);
fill(255,154,3); 
ellipse(0, 0, 10, 10);

}

    
  

//endRecord(); 





  
}


void yourFunction(){
  

fill(255,154,3); 
ellipse(55, 0, 50, 50);
fill(255);
ellipse(55, 0,40, 40);


for(int c=0;c<12;c++){
pushMatrix();  
translate(55, 0);
fill(255,154,3,50);
rotate(radians(c*30));
ellipse(0, 0, 6, 40);
popMatrix();


fill(255); 
ellipse(55, 0, 15, 15);
fill(255,154,3); 
ellipse(55, 0, 10, 10);



}
fill(255,154,3); 
ellipse(0, 55, 50, 50);
fill(255);
ellipse(0, 55,40, 40);

for(int c=0;c<12;c++){
pushMatrix();  
translate(0, 55);
fill(255,154,3,50);
rotate(radians(c*30));

ellipse(0, 0, 6, 40);
popMatrix();


fill(255); 
ellipse(0, 55, 15, 15);
fill(255,154,3); 
ellipse(0, 55, 10, 10);

}



}




  
  
  


