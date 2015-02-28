
// Ex14_01

color[] beach = {#D9C6B0, #314650, #2D4761, #45718C, #B6E1F2};
color[] palette = beach;

int s = 50;

void setup(){
  size(600, 200);
  background(palette[0]);
  smooth();
  noStroke();
  frameRate(5);
  
  for(int x = 0; x < width; x += s){
    for(int y = 0; y < height; y += s) {
      fill(palette[int(random(1, 5))]);
      rect(x, y, s, s);
    }
  }
}

void draw(){
  fill(palette[int(random(1, 5))]);
  int x = int(random(width/s))*s;
  int y = int(random(height/s))*s;
  rect(x, y, s, s);
}
