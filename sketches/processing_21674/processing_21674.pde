
void setup(){
  size(600,600);
  smooth();
   
}
 
void draw(){
  background(120,9,7);
 
  fill(154,102,20);

  strokeWeight (4);  
  
  pushMatrix();
  translate(width/2,height/2);
  for(int i=0;i<18;i++){
    rotate(radians(61));
  
    ellipse(0,0,28,250);
  }
  popMatrix();

 
}
 
 
 

