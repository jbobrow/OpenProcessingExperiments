
float [] circleX = {
  40, 140, 360, 210, 180, 240, 300, 30, 280, 120
};

float [] circleY = {
  350, 110, 20, 180, 220, 80, 280, 30, 150, 250
};

void setup() {
  size(400, 400);
  smooth();
  noStroke();
}

void draw() {
  background(255);
  drawing(255,255,255);
}

void drawing(int r, int g, int b) {
  for (int i=0; i<10; i++) {
    fill(r-=20, g-=50, b-=30);
    ellipse(circleX[i], circleY[i], 30, 30); 
  
      if (mousePressed == true) {
          for (int j=0; j<10; j++) {
          circleX[j] = random(width);
          circleY[j] = random(width);
          }
        } 
  }
}

    


