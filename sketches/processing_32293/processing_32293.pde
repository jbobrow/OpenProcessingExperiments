
//Setup variables:
 int sepA= 50;
 int sepB = 50;   
//Function variables:
 float L = 50;
 float E = 10;
    
void setup()
  {
   size(500,1000);
   background (0);
   fill(255,255,255,200);
   noStroke();
  
//Repetiton code learnt from pattern_maker written by Ben Jack.       
  for(int D = 0; D < width/sepA; D++)
  //++ = value+1
   {
    for(int F = 0; F < height/sepB; F++)
     {
      pushMatrix();
      translate(D*sepA, F*sepB);
      myFunction();
      popMatrix();
     }
   }
//End repition code   
}
          
void myFunction()
 {   
  
  fill (255,255,255, 150); 
  triangle(0,0,L,L*2,150,50);
  smooth();
    
   

}

