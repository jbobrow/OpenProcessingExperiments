

import java.math.*;
 
BigInteger cur = new BigInteger("0");
int n = 32;
int w, h;
 
void setup() {
  size(640, 640);
  stroke(128);
  w = width / n;
  h = height / n;
}
 
void draw() {
  for(int i = 0; i < n; i++)
    for(int j = 0; j < n; j++) {
      fill(cur.testBit(i * n + j) ? 0 : 255);
      rect(w * j, h * i, w, h);
    }
  cur = cur.add(BigInteger.ONE);
}
