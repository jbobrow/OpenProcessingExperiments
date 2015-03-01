
void setup() {
  size(400, 600);
  background(155);
 

  int x = 30;
  int y = 30;
    fill(155);
  
  for(int a = 1; a<=y; a += 1){
    for(int b = 1; b<x-5; b +=1){
     
     
      pushMatrix();
      translate(x*b, x*a);
      rotate(radians(random(-a*5, a*5)));
      rect(5, 5, x, y);
      popMatrix();
    }
 }
}



