
PFont font;
float angle = 0.0;

void setup() {
  size(750, 400);
  smooth();
  background(0);
  textFont( createFont("Helvetica", 80) );
}

void draw() {
  
  pushMatrix();
    translate(mouseX, mouseY);
    rotate(angle);
    fill(mouseX-100, mouseY-70, random(150, 200) );
    textSize(16);
    text("繁體中文", width/50, height/50);
    //angle += 0.01;
    angle -= 0.5;
    
    
  popMatrix();
  
    
}
void mousePressed() {
  background(0);
  
}


