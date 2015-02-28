
float y;
float easing = 0.02;

int value=0;

void setup() {
  noStroke(); 
  size (900, 600);
  colorMode(RGB);
}

void draw() { 

  fill(value);
  background(10, 10, mouseY+30, 50); 
  float targetY = mouseY;
  float dy = targetY - y;
  if (abs(dy) > 1) {
    y += dy * easing;

    fill(#8E4840);
    noStroke();
    rect(80, 140, 300, 420);

    stroke(1);
    for (int a=0;a<40;a=a+10) {
      for ( int b=0; b<20;b=b+5) {
        fill(255);
        rect(100+a*7, 160+b*15, 50, 50, 7);
      }
    }

    rect(100, 460, 50, 90, 7);
    rect(310, 460, 50, 90, 7);

    fill(#310404);
    rect(165, 450, 130, 110, 15, 15, 0, 0);
    noStroke();
    if (mouseY<255)
      fill(255);
    else
      fill(value, value, 0);
    ellipse(750, y, 80, 80);
    fill(#115214);
    rect(0, 560, width, 40);
    rect(0, 500, 80, 100);
    rect(380, 500, 620, 100);

  }
}

void mouseMoved() {
  value=value+5;
  if (value>255) {
    value=255;
  }
}

