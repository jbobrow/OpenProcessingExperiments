
void setup(){
  size(500,500);
  background(255);
  smooth();
}

void draw(){

  stroke(100,random(50));
  
strokeWeight(abs(mouseX-pmouseX));
point(mouseX,mouseY);
}
  
  void keyPressed(){
  background(255);
}
  

