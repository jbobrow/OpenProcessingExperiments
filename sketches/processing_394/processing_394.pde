


void setup() {
  size (350,350);
  smooth();
  frameRate(60);
 

  background(255);
  
}

void draw (){


  
  stroke(255,255,255);
  fill(100,30,20);
  
  
  
}



void mouseDragged(){
  noStroke();
  smooth();

  fill(50,200,50);
  ellipse(mouseX,mouseY,10,10);
}
  
  void keyPressed() {
  background(255);
}

