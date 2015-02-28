
PFont font;
float angle = 0.0;

void setup() {
  size(750, 600, P3D);
  smooth();
  background(0);
  textFont( createFont("Helvetica", 80) );
}

void draw() {
  
  pushMatrix();
    translate(mouseX, mouseY);
    rotate(angle);
    fill(mouseX-100, mouseY-200, random(150, 200) );
    textSize(16);
    text("MengChih孟芝", width/50, height/50);
    stroke(mouseX-100, mouseY-70, random(150, 200) );
    line(0, 0, width, height);
    //bezier(30, 20,  80, 5,  80, 75,  30, 75);
     noStroke();
    ellipse(100, 100, 10,10);
    angle += 0.5;
    
    
  popMatrix();
  
//  stroke(229, 227, 180);
//  translate(width/2,height/2);
//  rotate(angle);
//  line(mouseX, mouseY,75,0);
//  angle += 0.05;
  
    
}
void mousePressed() {
  background(0);
  
}


