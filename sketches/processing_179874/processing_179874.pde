
void setup() {
  size(600,600);
}

void draw() {
 background(0);
 stroke(200);
 for(int x = 0; x <= width; x += 5){
   line(x,0,mouseX,mouseY);
   line(x,height,mouseX,mouseY);
  }

  for(int y = 0; y <= height; y+= 5) {
    line(0,y,mouseX,mouseY);
    line(width,y,mouseX,mouseY);
  }
}
