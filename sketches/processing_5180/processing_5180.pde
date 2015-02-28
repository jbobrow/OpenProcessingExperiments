
//Created by Stephen Wang
//Modified Based on Nill coding
//Credit to kit plehanov's Nill code
//http://www.openprocessing.org/visuals/?visualID=4168

void setup(){ 
  size(400,400);
  background(0); 
  strokeWeight(2); 
  fill(77,219,2); //green background
}

void draw(){ 
background(77,219,2); //set background to green

smooth(); 
for(int i=0;i<=100;i+=1){ 
  float a=millis()/4; //number of arcs turning per mili second
  float b=radians(noise(i))*a; 
  float c=b+atan(a/8); //speed of arc turning 
  noFill(); 
  arc(200,200,i*3,i*3,b/2,c/2); //set to the center of the box, size of the arcs, and speed of turning
 } 
} 
 


