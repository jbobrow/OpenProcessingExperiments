
void setup(){
size(500, 500);
noStroke();

}

void draw(){
  
  fill(mouseX, mouseY, 244);
  
for(int k = 20; k < width; k = k + 50) {
for(float k1 = 10; k1 < height; k1 = k1 * 1.5){
  ellipse(k, k1, 30, 30);
}

}


}
