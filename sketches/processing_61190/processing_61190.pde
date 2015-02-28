
void setup() {
  size(300,300);
  smooth();
}
  
void draw() {
  background (#BDBDBD);
    
for(int i = 80; i < height; i = i+ 5) {
    for(int j = 80; j < width; j = j + 80){
      fill(#FFFFFF);
     ellipse(i,j,70,70);
    }
  }
}
