
void setup(){
  size(400, 400, P2D);
  smooth();
}

void draw(){
  background(180, 255, 255);
   for(int i = 0; i < height; i = i + 30){
     stroke(255);
     strokeWeight(6);
   line(0, i, width, i);
  }
}
