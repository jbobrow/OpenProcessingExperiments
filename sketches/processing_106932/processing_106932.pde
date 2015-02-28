
void setup() { 
  size(350, 250);
}

void draw() { 
 background(255,200,200);
    ellipse(20+mouseX, 20+mouseY, 100, 100);
  
  if(mousePressed){
  fill(255,255,0);
  }
  
  else{
  fill(0,255,100);
  }
  
  
  }
