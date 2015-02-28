
void setup () {
  size(800, 600);
  background(200);
  noStroke();
  colorMode(HSB, 360, 100, 100);
}

void draw () {
 
 float mouseDist;
  
  for (int i= 0; i<10; i++) {
  mouseDist = dist(mouseX, mouseY, 100 + i*65, 300);
    fill(360); 
    ellipse(100 + i*65, 300, 50, 50);
    
    if (mouseDist <= 25) {
     
    fill(random(0, 30), 100, 100);
    ellipse(100 + i*65, 300, 50, 50);
  }
  
  

    
  }
}


