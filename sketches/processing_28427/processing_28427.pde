
void setup(){
  size (500, 500);
  smooth();
}

void draw(){
  background(255);
  
  for(float y = 0; y <= height; y = y + 2){
    for(float x = 0; x<= width; x = x + 2){
      line(x, y, 500, 300);

}
}


}

