
void setup(){
  size(600,400);
  background(255);
}

void draw(){
  for(int i = 0; i<width; i++){
    for(int j= 0; j<width; j++){
      noStroke();
      fill(i*50,j*50,150);
      ellipse(i*50,j*50,50,50);
    } 
  }
}
