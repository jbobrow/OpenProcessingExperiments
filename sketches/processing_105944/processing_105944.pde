
void setup()
{
  size(800, 800);
}
 
 
void draw() { 
  background(0);
  for (int i= 20; i< 800; i+=100 ) {
    for (int j=20; j<800; j+=100) {
      stroke(255);
      fill(mouseX, 10, mouseY);
      
      ellipse(i+50, j+50, 10, 10);
      ellipse(j+70,i+70,mouseX/30,mouseY/30);
      ellipse(j-70,i-70,mouseY/20,mouseX/20);
      
    }
  }
}
