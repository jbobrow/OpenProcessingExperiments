
void setup(){
  size(300,300);
  smooth();
}
 
void draw () {
  background (50);
   
  float i = mouseY + 5;
   
  for (int x = 0; x <= height; x = x + 7){
    for (int y = 0; y <= height; y = y + 7){
       
      strokeWeight (0.5);
      fill(0 + i);
      ellipse(x, y, 6, 6);
    }
  }
}


