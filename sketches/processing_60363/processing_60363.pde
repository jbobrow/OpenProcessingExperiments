
void setup() {
  size(600, 600);
  smooth();
}

void draw() {
  if (mousePressed) {
    //fill(255,0,255);
    
    // Headff
    fill(255,200,200);
    ellipse(mouseX + 50, mouseY + 50, 100, 100);
    
    // Eyes
    fill(255,255,255);
    ellipse(mouseX + 25, mouseY + 50 , 10, 10);
    ellipse(mouseX + 75, mouseY + 50 , 10, 10);
    
    fill(0, 0, 255);
    ellipse(mouseX + 25, mouseY + 50 , 5, 5);
    ellipse(mouseX + 75, mouseY + 50 , 5, 5);
    
    // Nose
    fill(255, 128, 55);
    ellipse(mouseX + 50, mouseY + 60 , 5, 10);
    
    // Mouth
    fill(255, 0, 0);
    ellipse(mouseX + 50, mouseY + 80, 10, 10);
    
    // Hair
    fill(0, 255, 0);
    ellipse(mouseX + 0, mouseY + 50, 20, 20);
    ellipse(mouseX + 5, mouseY + 30, 20, 20);
    ellipse(mouseX + 15, mouseY + 15, 20, 20);
    ellipse(mouseX + 100, mouseY + 50, 20, 20);
    ellipse(mouseX + 95, mouseY + 30, 20, 20);
    ellipse(mouseX + 85, mouseY + 15, 20, 20);
    
    fill(0, 0, 255);
    ellipse(mouseX + 30, mouseY + 5, 20, 20);
    ellipse(mouseX + 50, mouseY + 5, 20, 20);
    ellipse(mouseX + 70, mouseY + 5, 20, 20);
    
    
    
  } else {
//    fill(255,128,80);

      fill(mouseX / 2, mouseY / 2, 128);

    ellipse(mouseX, mouseY, 20, 20);
  }
}


                
