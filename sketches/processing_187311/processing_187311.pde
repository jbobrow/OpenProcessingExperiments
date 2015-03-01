
void setup() {
  size(600, 400);
  background(250,150,100);
  noStroke();
  frameRate(2);
}
 
void draw() {
  wave();
}
 
int gridSize = 50;
 
void wave() {
  for (int x = gridSize; x <= width - gridSize; x += gridSize) {
      for(int y=gridSize; y <= height - gridSize; y += gridSize) {
        noStroke();
        fill(random(100,250), random(150,250), random(100,250));
        rectMode(CENTER);
        rect(x-14,y-14,14,14);
        triangle(x-20,y-14,x+7,y-34,x+7,y+6);   
      }
  }
}
 

  



