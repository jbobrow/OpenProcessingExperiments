
float gato =1;
void setup() {
  size(600, 600);
}
void draw() {
  if (mouseY<300) {
    background(255,300, 0);  
  }
gato = gato +2;
 background(100, 0, 0);
  ellipse(gato, 300, 20, 20);
  ellipse(mouseX,mouseY, 30, 30);  
 
}



