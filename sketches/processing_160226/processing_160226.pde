
// idk

color[] beach = {#FFAA5C, #DA727E, #AC6C82, #685C79, #455C7B};
color[] palette = beach;

int s = 5;

void setup(){
  size(600, 600);
  background(palette[0]);
  smooth();
  strokeWeight(1);
  
  
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


