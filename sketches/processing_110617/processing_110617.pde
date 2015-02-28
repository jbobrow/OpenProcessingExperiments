
void setup() {
  size(540, 260);
  strokeWeight(0);
  stroke(255);
  
}

void draw() {
  background(0);
  for(int contador=0; contador<=640; contador++){
    if(contador % 3 == 0){
      line(contador,80,contador,180);
    }
  }
}
