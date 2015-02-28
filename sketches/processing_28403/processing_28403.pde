

void setup(){
  size(400, 400);
  smooth();
}

void draw(){
  background(255);
  
  for(int y = 0; y <= height; y = y + 20 ){
    for(int x = 0; x <= width; x = x + 20){
      ellipse (x, y, 200, 900);
      noFill();
      stroke(0, 80);
  }
  }
}

