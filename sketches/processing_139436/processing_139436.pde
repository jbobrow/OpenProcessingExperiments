
float y = 100;
float scale;

void setup() {

size(400, 400); 
background(255); 
noStroke(); 
scale = width/50;
}

void draw() { 
int a = 10;
for (int x = 0; x <= width - a; x += a) {
  for (int y = 0; y <= height - a; y += a) {
    fill(random(255),random(255),random(255));
    rect(x, y, 8, 8);
  }
}
}



