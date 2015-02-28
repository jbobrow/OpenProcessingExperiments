
void setup() {
  size(400, 550);
  background(255);
  noFill();
  smooth();
  noLoop();

  int c = 25;
  int r = 20;
   
  for(int a = 1; a<=r; a += 1){
    for(int b = 1; b<c-10; b +=1){
      pushMatrix();
      translate(c*b, c*a);
      rotate(radians(random(-a*4, a*4)));
      rect(0, 0, c, c);
      popMatrix();
    }
 }
}
