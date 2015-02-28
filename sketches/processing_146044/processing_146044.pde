
void setup() {
  size( 500, 500 );
  smooth();
  fill(100,22,121);
}
 
void draw() {  
  background(202,200,241);
  stroke(#ffffff);
  strokeWeight(.9);
   
  float Size = map( mouseX, 400, width, 0, 300 );
   
  for (int x = 0; x < width; x += 80) {
    for (int y = 0; y < height; y+=50) {
      line(x, y, Size, Size);
    }
  }
 stroke(193,97,6);  
 strokeWeight(.7);

  for (int x = 0; x < width; x += 20) {
    for (int y = 0; y < height; y+=90) {
      line(x, y, Size, Size);
    }
  }   
 }



