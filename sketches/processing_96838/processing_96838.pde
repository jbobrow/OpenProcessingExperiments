
float scale;

void setup() {
  size(370, 480);
  noStroke();
  scale = width/10;
}

void draw() { 
  for (int i = 0; i < scale; i++) {
    colorMode(HSB,(i+1) * scale * 5);
    fill(millis()%((i+1) * scale * 5));
    rect(i*scale, 0, scale, height);
  }
}


