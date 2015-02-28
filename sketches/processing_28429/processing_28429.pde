
void setup(){
  size (500, 500);
  smooth();
}

void draw(){
  background(255);
  
for(float y = -5; y <= height; y = y + 2){
    for(float x = -5; x<= width; x = x + 2){
      rect(x, y, 500, 30);
      noFill();

}
}


}

