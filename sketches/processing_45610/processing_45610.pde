
void setup(){
  size(600, 600);
  smooth();
  background(0);
  fill(255);
  noStroke();
}

void draw(){
  float ellSize = 0;
  for(int x = 0; x < width; x+=10){
    for(int y = 0;y < height; y +=10){
      fill(x);
      ellSize = sin(y+x) *10;
      rotate(x);
      rect(x,y,ellSize,ellSize);
      ellipse(mouseX,y,ellSize,ellSize);
    }
  }
}
                
