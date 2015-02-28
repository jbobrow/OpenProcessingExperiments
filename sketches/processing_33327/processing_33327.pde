
void setup () {
  size(256, 256);
}
 
 
void draw() {
 
  background(100, 225,0);
 
  for (int i=0; i<width; i+=1) {
    for (int j=0; j<height; j+=1) {
      stroke(i, j, j, i);
      line(i, j, i, j);
    }
  }
}
 
 

