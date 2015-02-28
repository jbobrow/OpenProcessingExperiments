
void setup(){
  size(200,200);
  background(255);
  stroke(0);
}

void draw(){
  int x=-10; 
  while (x < width) {
    x=x+10;
  for (int y=0; y < height; y=y+10) {
    noStroke();
    fill(random(255));
    rect(x,y,10,10);
  }
} 
}

