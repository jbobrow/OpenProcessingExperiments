
void setup() {
  size(500, 500);
}

float mx = 200;
float my = 200;

void draw() {
  background(50);
  smooth(); 

  float randomness = map(mouseX, 0, width, 0, 1);

  mx = 0.95*mx+0.05*mouseX;
  my = 0.95*my+0.05*mouseY;

  for (int i=1; i < 100; i++) {
    float xB = randomness * random(-700, 700); 
    float yB = randomness * random(-700, 700);
    float thick = randomness * random(1, 15);

    float r = randomness * random(0, 255);
    float g = randomness * random(0, 255);
    float b = randomness * random(0, 255);

    strokeWeight(thick);
    fill(r, g, b, 50);
    rect(mx, my, xB, yB);
  }


  if (mouseX > 250) {
    for (int i=1; i < 300; i++) {
      strokeWeight(3);
      float x1 = random(0, 500); 
      float y1 = random(0, 500);
      float x2 = random(0, 500); 
      float y2 = random(0, 500);
      line(x1, y1, x2, y2);
    }
  }
  
  
  for (int i=1; i < 1000; i++) {
    float xA = randomness * random(-300, 300); 
    float yA = randomness * random(-300, 300);
    float thick = randomness * random(1, 15);

    float r = randomness * random(0, 255);
    float g = randomness * random(0, 255);
    float b = randomness * random(0, 255);

    strokeWeight(thick);
    fill(r, g, b);
    rect(i-mx, i%my*mx, xA, yA);
  }
}
