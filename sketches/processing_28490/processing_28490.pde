
int spacing = 5;
 
void setup(){
  size(800, 600);
}
 
void draw(){
  background(255);
  for(int y = 0; y <= height; y = y + spacing){
    for(int x = 0; x <= width; x = x + spacing){
      ellipse(x, y, 2, 2);
    }
  }
}

