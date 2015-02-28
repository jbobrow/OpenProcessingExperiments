
//Jason Xu
//7/8/13
//Face.pde: Follow the mouse
// Reference: Processing tutorial, for easing

float easing = 0.015;
float x;
float y;

void setup() {
  size(800, 800);
  mouseX = 400;
  mouseY = 400;
}

void draw() {
  
  easing = 0.015;
  float targetX = mouseX;
  float targetY = mouseY;
  x += (targetX - x) * easing;
  y += (targetY - y) * easing;
  smooth();
  background(100);
  fill(200);
  ellipse(x, y, 150, 100);
  fill(180);
  beginShape();
  vertex(x-60, y-30);
  vertex(x, y-30);
  vertex(x-20, y);
  vertex(x-30, y-10);
  vertex(x-40, y);
  endShape(CLOSE);
 
  beginShape();
  vertex(x, y-30);
  vertex(x+60, y-30);
  vertex(x+40, y);
  vertex(x+30, y-10);
  vertex(x+20, y);
  endShape(CLOSE);
  
  fill(255, 0, 0);
  noStroke();
  ellipse(x-30, y-2, 6, 6);
  ellipse(x+30, y-2, 6, 6);
  
  if (mousePressed == true) {
  
    easing = 0.08;
    x += (targetX - x) * easing;
    y += (targetY - y) * easing;
    background(255, 255, 0);
    fill (255);
    ellipse(x, y, 150, 100);
    fill (0, 255, 0);
    ellipse(x - 30, y-5, 15, 15);
    ellipse(x + 30, y-5, 15, 15);
    /*stroke(0);
    strokeWeight(3);
    line(mouseX-50, mouseY-20, mouseX - 20, mouseY - 25);
    line(mouseX+50, mouseY-20, mouseX + 20, mouseY - 20);*/
    
    for (int i = 0; i < 10; i++) {
        int r = random(0, 370);
        
    }    
    fill(0, 0, 255);
    noStroke();
    arc(x, y+10, 80, 50, 0, PI);
    
  }
}
