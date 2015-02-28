
void setup(){
  size(400,400);
  noCursor();
  background(255);
  }
  
  void draw() {
    
    if(mousePressed){
      stroke(6.0);
      fill(0);
      ellipse(340,100,50,50);
        } else{
          fill(255);
          ellipse(140,180,mouseX,mouseY);
          }
          
}


