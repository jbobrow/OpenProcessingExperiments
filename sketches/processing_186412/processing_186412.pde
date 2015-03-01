
void setup() {
  size(600,600);
}
 
void draw() {
 background(230);
 stroke(255);
 for(int x = 0; x <= width; x += 15){
   line(x,300,mouseX,mouseY);
   line(x,height,mouseX,mouseY);
  }
  }
