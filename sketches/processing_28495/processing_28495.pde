
void setup() {
  size (400,350);
  background (150);
}

void draw () {
  background (150);
  quad(50,200,50,150,100,mouseY-150,mouseX-100,mouseY-100);
  quad(100,mouseY-150,mouseX-100,mouseY-100,mouseX-200,mouseY-100,mouseX-200,mouseY-250);
  triangle(mouseX-200,mouseY-250,mouseX-200,mouseY-100,mouseX,mouseY);
  
}                
