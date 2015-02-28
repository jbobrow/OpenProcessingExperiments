
float dotSize = 50;
float dotSpacing = dotSize * 2; 

//boolean toggle;

//import processing.pdf.*;    // EXPORTING AS PDF



void setup() {
  size(1024 * 2, 607 * 2, P3D);
  
  
//  PGraphics pdf = createGraphics(2000, 1000, PDF, "output.pdf");    // EXPORTING AS PDF
//pdf.beginDraw();
//pdf.background(128, 0, 0);
//pdf.line(50, 50, 250, 250);
//pdf.dispose();
//pdf.endDraw();
  
  
  smooth(8);
  noStroke();
  
  ellipseMode(CENTER); 
}

void draw() {
  background(0);

  translate(0, height);
//  rotateX(map(mouseX, 0, width, 0, HALF_PI));
//  translate(0, -height);
  
  for (int x = -width; x < width * 2; x+= dotSpacing) {
    pushMatrix();
    float z = 0;
    float angle = 0;
    if (x < - width/ 2) {
      z = sq((x + width / 2) / 300f) * 80;
      angle = z / 1500f * PI;
    }
    else if (x > width + width / 2) {
      z = sq((x - width - width / 2) / 300f) * 80;
      angle = -z / 1500f * PI;
    }
    translate(0, 0, z);
    for (int y = -height; y < height * 1.2; y += dotSpacing) {
      pushMatrix();
      translate(x, y);
      rotateY(angle);
      fill(255 * map(y, -height * .75, mouseY, 0, 1));
      ellipse(0, 0, dotSize, dotSize);
      popMatrix();
    }
    popMatrix();
  }
}

//void keyPressed() {
//  toggle = !toggle;
//}

