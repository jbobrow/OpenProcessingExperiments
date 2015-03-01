
float deg = 15;

void setup(){
  size(600,600);
  


}
void draw() {
  background(255);
  for(int i = 0; i < 10000; i++){
  noStroke();
  rotate(radians(deg));
  deg += 15;
  stroke(5);
  rect(200,200,mouseX,mouseX);
  fill(255);
  rect(400,400,mouseY,mouseY);
  
  
  }
  


}
