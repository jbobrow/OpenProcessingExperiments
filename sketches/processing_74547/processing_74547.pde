
void setup(){
  size(400, 400);
}

void draw(){
  background(200);
  if(mousePressed){
    for(int y = 0; y <= height; y = y + 30){
      for(int x = 0; x <= width; x = x + 30){
        fill(255);
        ellipse(x, y, 10, 10);
      }
    }
  }else{
    for(int y = 0; y <= height; y = y + 10){
    for(int x = 0; x <= width; x = x + 10){
      fill(random(255),0,0);
      ellipse(x, y, 10, 10);
    }
  }
    
  }
}
