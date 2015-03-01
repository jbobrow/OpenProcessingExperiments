
void setup() {
  size(500, 500, P3D);
  frameRate(40);
  
}

void draw() {
background (0);
for (int i = 0; i < 700; i++) {
    float x = random(-1500,2000);
    float y = random (-1500,2000);
    strokeWeight(1);
    stroke(255);
    point (x, y, -1000);
  }
    fill(178,176,176);
    ellipse(mouseX,mouseY,100,50);
    fill(0);
    ellipse (mouseX + 25, mouseY,25,20);
    fill(255,0,0);
    triangle(mouseX-5, mouseY +40, mouseX + 10, mouseY + 20, mouseX-15, mouseY + 20);
    triangle(mouseX+5, mouseY - 40, mouseX - 10, mouseY - 20, mouseX + 15, mouseY -20);
    strokeWeight (0);
    ambientLight (255, 255, 255);
    pointLight (255, 255, 0, 250, 250, 0);
    fill (#159CA0);
    translate (100, 150, -400);
    sphere (50);
    fill (255, 255, 0);
    translate (150, 100, 200);
    sphere (100);
    fill (152, 74, 27);
    translate (-140, 130);
    sphere (25);
    fill (#C45BBD);
    translate (300, -150, 200);
    sphere (75);
    translate (-100, -175, -250);
    fill (#2d39a3);
    sphere (60);
    fill(150);
    translate (-310, -55,400);
  
}
