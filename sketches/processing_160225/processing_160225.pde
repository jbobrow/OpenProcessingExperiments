
// idk

color[] beach = {#588C7E, #F2E394, #F2AE72, #D96459, #8C4646};
color[] palette = beach;

int s = 1;

void setup(){
  size(600, 600);
  background(palette[0]);
  smooth();
  noStroke();
  
  for(int x = 0; x < width; x += s){
    for(int y = 0; y < height; y += s) {
      fill(palette[int(random(0, 5))]);
      rect(x, y, s, s);
    }
  }
}

void draw(){
  fill(palette[int(random(0, 5))]);
  int x = int(random(width/s))*s;
  int y = int(random(height/s))*s;
  rect(x, y, s, s);
}


