
//Variables:
int sepA= 50;
int sepB = 50;    
float L = 20;
float E= 20;
    
void setup(){
  
   size(500,1000);
   background (0);
   fill(255,255,255,200);
   
  
//Repetiton code learnt from pattern_maker       
  for(int D = 0; D < width/sepA; D++)
   {
    for(int F = 0; F < height/sepB; F++)
     {
      pushMatrix();
      translate(D*sepA, F*sepB);
      myFunction();
      popMatrix();
  }
 }     
}
          
void myFunction(){
    
  stroke(255);
  noFill();
  triangle(0,600,random (0,L),random (0,L),500,50);
  smooth();
    
   
 L = 1 + 15;
 E = E - 0.5;
   
  noStroke();
  triangle(20,90,random (0,E),random (L),80,150);
  smooth();
    
   

}

