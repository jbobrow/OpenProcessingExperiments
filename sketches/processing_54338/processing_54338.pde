
int[] kolory;


void setup() {
  size(500, 500);
  background(0);
  noStroke();
  smooth();
  fill(255);
  
  kolory = new color[50];
  for(int i = 0; i < kolory.length; i++)
    kolory[i] = color(random(150) + 100, random(150) + 100, i * 5);
}

void draw() {
  background(0);
  for(int i = 0; i < kolory.length; i++)
  for(int j = 0; j < kolory.length; j++) {
    fill(kolory[(j+mouseX/10)%kolory.length]);
    ellipse(5 + j * 10, 5 + i * 10 * (noise((frameCount+j)*0.01)), 10, 10);
  }
}

void mousePressed() {
  for(int i = 0; i < kolory.length; i++)
    kolory[i] = color(random(200) + 50, random(200) + 100, i * 5);
}

