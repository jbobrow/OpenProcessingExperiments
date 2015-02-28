
float aumenta = 0;
void setup() {
  size(600, 600);
  frameRate(1000);
}
void draw() {
  background(0);
  aumenta=aumenta+0.01;
  float seno = 500*sin(aumenta);
  noStroke();
  fill(13, 252, 206);
  ellipse(width/2, height/2, seno, seno);
  fill(237,197,50);
    ellipse(width/5, height/5, seno, seno);
    ellipse(width/5, height/5, seno, seno);
    fill(242,97,29);
    ellipse(500, 100, seno, seno);
    fill(100,245,69);
    ellipse(500, 500, seno, seno);
    fill(64,50,234);
    ellipse(100, 500, seno, seno);
    
    aumenta=aumenta+0.03;
  float sen = 500*sin(aumenta);
   noStroke();
  fill(13, 252, 206);
  ellipse(width/2, height/2, seno, seno);
    
 
 
  if (mouseX<=seno) {
    if (mouseY<=seno)
    {
    
  }
  }
}

