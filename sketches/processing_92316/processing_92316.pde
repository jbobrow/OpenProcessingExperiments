
void setup() {
  size(400, 400);
  smooth();
  
  strokeWeight(10);
}


void draw() {
     background(10);
     fill(100, 120, 30);
     stroke(0);

    ellipse(200, 200, 300, 300);
    stroke(100);
    line(100, 250, 300, 250);
    line(200, 200, 200, 220);
    
    fill(10, 20, 80);
    ellipse(250, 150, 50, mouseX / 5);
    ellipse(150, 150, 50, mouseY / 5);
    
    rect(150, 250, 100, mouseX/ 5);
  
}
