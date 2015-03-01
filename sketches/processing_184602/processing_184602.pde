
void setup() {
  size(600,400);background(20,247,230);
  
  }
  
  
  void draw() {
    background(0);
    fill(240,35,100);
    ellipse(300,115,150,150);
    fill(240,35,100);
    rect(250,200,100,150);
    fill(0);
    ellipse(275,100,25,25);
    fill(0);
    ellipse(320,100,25,25);
    fill(240,35,100);
    ellipse(275,375,50,50);
    fill(240,35,100);
    ellipse(320,375,50,50);
    fill(240,35,100);
    triangle(300, 150, 100, 300, 150, 100);
    fill(240,35,100);
    
    if (mousePressed) {
      fill(0);
      ellipse(275,100,25,25);
      ellipse(320,100,25,25);
    } else {
    fill(240,35,100);
    ellipse(275,100,25,25);
    ellipse(320,100,25,25);
  }
     
  }
  
