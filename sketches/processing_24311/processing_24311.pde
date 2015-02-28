
//import processing.pdf.*;

///////////////////////////////////////////////
/// Written by Jason Wang, 19th MAR 2011 ///
///////////////////////////////////////////////


int patternSeperationX = 110;
int patternSeperationY = 110;


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
  
   fill(255,200,20);
   rect(30+55*11,30+55*4,55,55);
    rect(30+55*6,30+55*7,55,55);
    rect(30+55*7,30+55*7,55,55);
     rect(30+55*3,30+55*6,55,55);
      rect(30+55*1,30+55*7,55,55);
       rect(30+55*4,30+55*8,55,55);
   rect(30+55*7,30+55*3,55,55);
   rect(30+55*10,30+55*2,55,55);
    rect(30+55*11,30+55*3,55,55);
    rect(30+55*14,30+55*1,55,55);
    rect(30+55*14,30+55*-1,55,55);
    
   rect(30+55*7,30+55*-1,55,55);
    
    
  
int s=15;
fill(201,22,12); 
ellipse(0, 0, 52*s, 52*s);
fill(255);
ellipse(0, 0, 45*s, 45*s);

for(int b=0;b<12;b++){
pushMatrix();  
translate(0, 0);
fill(201,22,12,50);
rotate(radians(b*15));
//ellipseMode(CENTER);
ellipse(0, 0, 10*s, 45*s);
popMatrix();

fill(201,22,12);
ellipse(0, 0, 15*s, 15*s);
fill(255); 
ellipse(0, 0, 10*s, 10*s);
fill(201,22,12); 
ellipse(0, 0, 7*s, 7*s);

/////////////////////////


}
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


  
  


