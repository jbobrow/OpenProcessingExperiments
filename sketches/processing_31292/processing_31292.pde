
 
void setup() {
size(300, 300);
background(0);
smooth();
stroke(255);
 
}
 
 
void draw() {
  background(0);
   
  for(int y = 0; y <= height; y = y+40 ){
    for(int x = 0; x <= width; x = x+40){
      line (mouseX, mouseY, y, x);
    }
  }
  
  
}


