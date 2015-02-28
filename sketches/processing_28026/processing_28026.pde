
int abstand = 20;

void setup(){
  size(300, 300);
}

void draw(){
  background(255);
  for(int y = 0; y <= height; y = y + abstand){
    for(int x = 0; x <= width; x = x + abstand){
      ellipse(x, y, 10, 10);
    }
  }
}

