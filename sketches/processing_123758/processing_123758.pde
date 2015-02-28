
float y; 
float easing = 0.02; 
int value=0; 
void setup() { 
  noStroke(); 
  size (500, 500); 
  colorMode(RGB);
} 
void draw() { 
  fill(value); 
  background(10, 10, mouseY+30, 50); 
  float targetY = mouseY; 
  float dy = targetY - y; 
  if (abs(dy) > 1) { 
    y += dy * easing; 
    stroke(1); 
    for (int a=0;a<40;a=a+10) { 
      for ( int b=0; b<20;b=b+5) {
        // edificio*/
        fill ( 0, 128, 192); 
        rect(5, 250, 200, 249); 
        fill (128, 64, 0); 
        rect(85, 450, 40, 49); 
        line(105, 450, 105, 499); 
        triangle(105, 150, 5, 250, 205, 250); 
        quad(15, 260, 15, 300, 55, 300, 55, 260); 
        quad(155, 260, 155, 300, 195, 300, 195, 260); 
        quad(15, 330, 15, 370, 55, 370, 55, 330); 
        quad(155, 330, 155, 370, 195, 370, 195, 330); 
        quad(15, 400, 15, 440, 55, 440, 55, 400); 
        quad(155, 400, 155, 440, 195, 440, 195, 400); 
        fill (0, 128, 0); 
        line(0, 499, 499, 499); 
        line(270, 450, 270, 499); 
        ellipseMode(CENTER); 
        ellipse(270, 450, 30, 30); 
        line(310, 450, 310, 499); 
        ellipseMode(CENTER); 
        ellipse(310, 450, 30, 30); 
        line(350, 450, 350, 499); 
        ellipseMode(CENTER); 
        ellipse(350, 450, 30, 30); 
        line(390, 450, 390, 499); 
        ellipseMode(CENTER); 
        ellipse(390, 450, 30, 30); 
        line(430, 450, 430, 499); 
        ellipseMode(CENTER); 
        ellipse(430, 450, 30, 30); 
        line(470, 450, 470, 499); 
        ellipseMode(CENTER); 
        ellipse(470, 450, 30, 30); 
        ellipseMode(CENTER);
      }
    } 
    noStroke(); 
    if (mouseY<255) fill(255); 
    else fill(value, value, 0); 
    ellipse(500, y, 80, 80); 
    fill(#115214);
  }
} 
void mouseMoved() { 
  value=value+5; 
  if (value>255) { 
    value=255;
  }
}



