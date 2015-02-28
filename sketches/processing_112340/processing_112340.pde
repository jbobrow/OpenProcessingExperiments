
void setup(){
  size(1000,500);
  smooth();
  noFill();
}

void draw(){
  background(0);
  stroke(255);
  noFill();
  
  for(int x=0; x <= width; x += 50){
    for(int y = 0; y <= height; y +=50){
  triangle(50,y,100,100,x,100);
}
  }
}
