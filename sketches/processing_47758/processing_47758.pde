
   void setup(){
  size(600,600);
  smooth(10);
  }
  void draw(){
  if (mousePressed){
  fill(55);
  }else{
  fill(100);
  }
  ellipse(mouseX,mouseY,90,90);
  
  }
