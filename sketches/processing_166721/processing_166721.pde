
int x = 0;
int y = 0;

void setup() {
  size(460, 460);
  frameRate(3);
  colorMode(HSB);
}

void draw() {
  background(200,130,355);
  noStroke();
  
  

  for (x = 13; x < 450; x=x+8) {
    for (y = 13; y < 450; y=y+8) {
      fill(random(230, 280), 100, 250, random(10,255));  
      ellipse(x, y, 6, 6);
    }
  }
 
}


