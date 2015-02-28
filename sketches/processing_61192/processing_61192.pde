
void setup() {
  size(300,300);
  smooth();
}
   
void draw() {
  background (#FFFFFF);
     
for(int i = 80; i < height; i = i+90) {
    for(int j = 80; j < width; j = j + 80){
      fill(#BDBDBD);
     ellipse(i,j,70,70);
    }
  }
}
