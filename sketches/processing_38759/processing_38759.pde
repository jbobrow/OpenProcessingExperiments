
int r1 = 144; 
int g1 = 218; 
int b1 = 227; 
int a1 = 255; 
int r2 = 32; 
int g2 = 56; 
int b2 = 118; 
int a2 = 255; 
float s1 = 4.0; 
float s2 = 2.0;

void setup() {
  size(500, 500);
  background(255);
  smooth();
}

void draw() {
  if (mousePressed) {
    drawMola(mouseX, mouseY);
  }
  if (keyPressed) {
    if (key == '1') {
      r1 = 0; 
      g1 = 0; 
      b1 = 0; 
      r2 = 255; 
      g2 = 255; 
      b2 = 255;  
    }
    if (key == '2') {
      r1 = 250; 
      g1 = 98; 
      b1 = 147; 
      r2 = 126; 
      g2 = 14; 
      b2 = 50;      
    }
    if (key == '3') {
      r1 = 255; 
      g1 = 251; 
      b1 = 124; 
      r2 = 245; 
      g2 = 177; 
      b2 = 2;       
    }
    if (key == '4') {
      r1 = 144; 
      g1 = 218; 
      b1 = 227; 
      a1 = 255; 
      r2 = 32; 
      g2 = 56; 
      b2 = 118;       
    }
    if (key == '5') {
      r1 = 117; 
      g1 = 255; 
      b1 = 116; 
      r2 = 2; 
      g2 = 90; 
      b2 = 1;       
    }
    if (key == '6') {
      a1 = 0;     
    }
    if (key == '7') {
      a2 = 0;
    }
    if (key == '8') {
      a1 = 255;
    }
    if (key == '9') {
      a2 = 255;
    }
    if (key == '0') {
      s1 = 10.0;    
    }
    if (key == 'q') {
      s2 = 5.0;    
    }
    if (key == 'w') {
      background(0);   
    }
    if (key == 'e') {
      background(150);    
    }
    if (key == 'r') {
      r1 = 144; 
      g1 = 218; 
      b1 = 227; 
      a1 = 255; 
      r2 = 32; 
      g2 = 56; 
      b2 = 118; 
      a2 = 255; 
      s1 = 4.0; 
      s2 = 2.0;    
    }
    if (key == ' ') {
      background(255);    
    }
  }
}

void drawMola(float x, float y) {
  for (int i = 0; i <= 1; i++) {
        if (i == 0) {
          strokeWeight(s1);
          stroke(r1, g1, b1, a1);
        }
        else {
          strokeWeight(s2);
          stroke(r2, g2, b2, a2);
        }
        
        float dx = x-25;
        float dy = y-25;
        // top left quadrant
        line(13+dx, 12+dy, 12+dx, 16+dy);
        line(12+dx, 16+dy, 9+dx, 16+dy);
        line(9+dx, 16+dy, 10+dx, 9+dy);
        line(10+dx, 9+dy, 17+dx, 9+dy);
        line(17+dx, 9+dy, 17+dx, 20+dy);
        line(17+dx, 20+dy, 6+dx, 21+dy);
        line(6+dx, 21+dy, 5+dx, 5+dy);
        line(5+dx, 5+dy, 21+dx, 4+dy);
        line(21+dx, 4+dy, 20+dx, 25+dy);
        line(20+dx, 25+dy, 5+dx, 26+dy);
        // bottom left quadrant
        line(5+dx, 26+dy, 5+dx, 45+dy);
        line(5+dx, 45+dy, 22+dx, 46+dy);
        line(22+dx, 46+dy, 21+dx, 30+dy);
        line(21+dx, 30+dy, 9+dx, 31+dy);
        line(9+dx, 31+dy, 10+dx, 40+dy);
        line(10+dx, 40+dy, 16+dx, 41+dy);
        line(16+dx, 41+dy, 16+dx, 36+dy);
        line(16+dx, 36+dy, 12+dx, 34+dy);
        line(12+dx, 34+dy, 12+dx, 37+dy);
        // top right quadrant
        line(37+dx, 12+dy, 37+dx, 15+dy);
        line(37+dx, 15+dy, 39+dx, 16+dy);
        line(39+dx, 16+dy, 40+dx, 9+dy);
        line(40+dx, 9+dy, 32+dx, 10+dy);
        line(32+dx, 10+dy, 33+dx, 20+dy);
        line(33+dx, 20+dy, 45+dx, 20+dy);
        line(45+dx, 20+dy, 42+dx, 5+dy);
        line(42+dx, 5+dy, 28+dx, 4+dy);
        line(28+dx, 4+dy, 26+dx, 26+dy);
        // bottom right quadrant
        line(26+dx, 26+dy, 45+dx, 25+dy);
        line(45+dx, 25+dy, 44+dx, 45+dy);
        line(44+dx, 45+dy, 28+dx, 45+dy);
        line(28+dx, 45+dy, 27+dx, 30+dy);
        line(27+dx, 30+dy, 40+dx, 30+dy);
        line(40+dx, 30+dy, 40+dx, 40+dy);
        line(40+dx, 40+dy, 32+dx, 40+dy);
        line(32+dx, 40+dy, 33+dx, 34+dy);
        line(33+dx, 34+dy, 37+dx, 35+dy);
        line(37+dx, 35+dy, 36+dx, 37+dy);
  }
}
