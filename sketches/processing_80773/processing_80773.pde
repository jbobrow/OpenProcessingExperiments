

void setup(){
  size(400,400);
  //background (155);
  //noLoop();
  
}
void draw(){
  background(150);
  strokeWeight(2);
  smooth();
  for (int i = 0; i<mouseX;i += 20) {
    line(i,0,i,mouseY);
  }
  fill(0);
  for (int u = 0; u<mouseY; u += 20) {
     
     line(0,u,mouseX,u); 
  }
  
    
  
}


