
void setup(){
  size(500, 500);
  smooth();
}

void draw(){
  background(0);
  noFill();
  stroke(255);
  for(int i = 0; i <= width; i = i+50){
    for (int j = 0; j <= height; j = j+50){
      line(i/50, j, i, j/50);
      line(i+50, j, i, j+50);
    }
  }
}
