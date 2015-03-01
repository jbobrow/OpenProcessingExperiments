
int rojo = 255;
int counter;
 
void setup() { 
  size(300, 300);
  background(5);
  }
   
void draw() {
stroke(rojo,mouseX, mouseY);
line(0, 0, mouseX, mouseY);
}
