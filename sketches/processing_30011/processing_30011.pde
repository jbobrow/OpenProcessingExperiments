
void setup() {
  size(600, 600);
  background(255, 255, 255);
  smooth();
}

void draw() {
     for(int y = 0; y <= height; y = y + 10) {
     for(int x = 0; x<= width; x = x + 10){

  println(mouseX + "   mouseY  " + pmouseX + " " + pmouseY);
    
noStroke();
  fill(mouseX, y-mouseY);
  
   
ellipse (x, y, 10, 10);
}
     }
}
  


