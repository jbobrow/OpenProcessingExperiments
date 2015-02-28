
public int[] outUpdate() {
  int[] j = new int[arrA.length];
  
  aLength = arrA.length -1 -x;
  bLength = arrB.length -1 -y;
  
  // reset conditionals
  if (x <= 0) { x = arrA.length -1; aLength = 0;}
  if (y > arrB.length -1) { y = 0; bLength = 0;}
  println(x+"_" + arrA.length + "_" + aLength);
  arrayCopy(arrA, x, j, 0, aLength);
  arrayCopy(arrB, 0, j, y, bLength);
  
  // update the variables
  // backward not implemented yet
  if (backward) {
    y -= JUMP;
    x += JUMP;
  } else {
    x -= JUMP;
    y += JUMP;
  }
  return j;
}

void keyPressed() {
  if (key == '+') { JUMP ++; }
  if (key == '-') { JUMP --; }
  println(JUMP);
    
}

