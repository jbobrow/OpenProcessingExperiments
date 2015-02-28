
void setup() {
  size(500,500);
  background(100);
}

void FunctionChakra(int width, int height) {
  fill(random(255),mouseX,mouseY);
  ellipse(250,250,mouseX,mouseY);
}
 
void draw() {
  for (int i=100;i<500;i+=50){
  FunctionChakra(i,i);

}
}






 






