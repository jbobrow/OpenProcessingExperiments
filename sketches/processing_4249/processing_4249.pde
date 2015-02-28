
//Created by Stephen Wang
//Credit to Asier Del Rosal's Starful
//http://www.openprocessing.org/visuals/?visualID=635



void setup(){ 
   
size(700,700); 
smooth(); 
background(random(1,255),random(2,255),random(3,255),40); 
strokeWeight(3); 
} 
 
void draw(){ 
 
  float L1 = random(0,600); 
  float L2 = random(100,height); 
  
  stroke(random(0,255),random(0,255),random(0,255),20); 
  
  line(width,600,width,L1); 
  line(0,600,width,L1); 
  line(width,100,width,L2); 
  line(0,100,width,L2);
} 
 

 

