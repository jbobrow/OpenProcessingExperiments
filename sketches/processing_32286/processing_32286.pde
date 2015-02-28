
int sepA= 25;
int sepB = 25;
     
float L = 20;
float E= 20;
    
void setup(){
   size(500,1000);
   background (0);
   fill(255,255,255,200);
   noStroke();
  
       
  for(int D = 0; D < width/sepA; D++){
      for(int F = 0; F < height/sepB; F++){
        pushMatrix();
        translate(D*sepA, F*sepB);
        yourFunction();
        popMatrix();
      }
  }
       
}
     
     
void draw()
{
   
}
     
     
void yourFunction(){
  
     
  noStroke();
  fill (255,255,255, random (0,60));
  triangle(0,100,random (0,L),random (0,L),50,50);
  smooth();
    
   
  L = 0 * 1;
  E = E- 1.0;
   


      
}

