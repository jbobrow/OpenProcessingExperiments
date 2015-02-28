
//Roberto M. Soracco
//GRDS 754 - Visual Information Practice
//Exercise 14_01 - Sharing via OpenProcessing
//Professor Trudy Abadie-Mendia

color[] starTrek = {#d5fbff, #9fbcbf, #647678, #2f3738, #59d8e6};
color[] palette = starTrek;

int s = 50;

void setup(){
  size(600, 200);
  background(palette[0]);
  smooth();
  noStroke();
  frameRate(50);
  
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
