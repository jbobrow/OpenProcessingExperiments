

void setup() {
  size(1100, 900);
}

void draw() {if (keyPressed) 
{ 
    stroke(160,50,78);
    fill(255);
  } else {
    stroke(0);
    fill(160,50,78);
  }
  
  line(mouseX, mouseY, 10, 10);
    line(mouseX, mouseY, 1000, 800);
  ellipse(mouseX, mouseY, 20, 20);
} 




