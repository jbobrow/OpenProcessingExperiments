
float xoff = 0.1;
float s = second();

void setup() {
  noiseSeed(0);
  size(1424, 980);
  background(255);
}

void draw() {
  int s = second();
  xoff = xoff + 0.1;
  float n = noise(xoff);
  if (mousePressed) {
    textSize(100-n+s%60);
    fill(s*5%60, 100, 50, 20+n);
    text("$$$", mouseX, mouseY, 0);
    println("cachemonet");
  }
}


  


