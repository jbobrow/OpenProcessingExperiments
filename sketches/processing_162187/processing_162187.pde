
color[] blueGreen = {#007366, #0D998A, #21C4B3, #30F7E3, #D0FFFA};
color[] palette = blueGreen;

int p1 = 1;
int s = 50;

void setup() {
  size(600,600);
  background(blueGreen[0]);
  smooth();
  noStroke();
  for(int x=0; x < width; x += s) {
    for(int y=0; y < height; y += s) {
       fill(palette[int(random(0,5))]);
       rect(x, y, s, s);
    }
  }
}

void draw() {
  fill(palette[int(random(1,5))]);
  int x = int(random(width/s))*s;
  int y = int(random(width/s))*s;
  rect(x, y, s, s);
}






