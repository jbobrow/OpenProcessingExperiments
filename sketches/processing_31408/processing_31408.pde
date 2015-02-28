
void setup(){
  size(400,400);
  background (0,0,0);
}

void draw(){  
  if (mousePressed){    
    scale (2);
    fill (255,255,255);
    ellipse (70,80,26,16);
    ellipse (130,80,26,16); 
    fill (200,0,0);
    rect (70,114,60,20);   
    fill (0,0,0);
    ellipse (map(mouseX,0,width,58,82), map(mouseY,0,height,74,86), 8,6);
    ellipse (map(mouseX,0,width,118,142), map(mouseY,0,height,74,86), 8,6);
  }
  else {
    background (0,0,0);
    scale (2);
    fill (255,255,255);
    ellipse (70,80,26,14);
    ellipse (130,80,26,14); 
    fill (150,150,150);
    rect (70,122,60,4);
    fill (0,0,0);
    ellipse (map(mouseX,0,width,58,82), map(mouseY,0,height,74,86), 8,6);
    ellipse (map(mouseX,0,width,118,142), map(mouseY,0,height,74,86), 8,6);
  }
}



