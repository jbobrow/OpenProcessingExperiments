



void setup(){
  size(500,500);
  smooth();
  noStroke();
}




void draw(){
  background(50);
  fill(255);
  
   for(int i=0; i<=width; i+=50) {
     for(int j=0; j<=height; j+=50) {
       
       float s = map(sin(frameCount/10.0+i+j+i), -2,1,1,70);
 
       ellipse(i,j,s,s);
     } 
   }
 

 
  
}





