
float mx = 100;
float my = 100;
float nx = 100;
float ny = 100;

void setup() {
  size(600, 600);
}

void draw() {
  background(255, 200, 255, 10);  
  smooth();
  
    int H = hour();
    for (int n=1; n< 24; n++) {
    strokeWeight(3);
    line (600, n*25, 0, n*25);
    }
  for (int i=1; i < 25; i++) {
    strokeWeight(3);
    line (i*30, 600, i*30, 600-H*25);
  }
  
  float g = random(200, 255);
  float b = random(200, 255);
  fill(255, g, b, 200);
  int S = second(); 
  mx = 0.95*mx+0.05*mouseX;
  my = 0.95*my+0.05*mouseY;
  rect(mx, my, S*10, S*10);

  nx = 0.75*mx+0.20*mouseX;
  ny = 0.75*my+0.20*mouseY;
  int M = minute();
  fill(g, b, 255, 150);
  rect(nx, ny, M*10, M*10);

  }
