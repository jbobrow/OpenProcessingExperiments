
void setup() {
  size(500, 500);
  background(53,56,71);

}

void draw() {
    int i = 100;
    noStroke();
  for (int y =0; y <= height; y = y + i){
    for(int x = 0; x <= width; x = x + i){
      fill(254,144,1, 20);
      rect(x,y,40,500);
      fill(254, 25, 1, 20);
      rect(x+45, y, 3, 500);
      rect(x+53, y, 3, 500);
    }
  }
    for (int y =0; y <= height; y = y + i){
    for(int x = 0; x <= width; x = x + i){
      fill(254,25,1,20);
      rect(x,y,500,40);
      fill(254, 144, 1, 20);
      rect(x, y+45, 500, 3);
      rect(x, y+53, 500, 3);
    }
  }
}
