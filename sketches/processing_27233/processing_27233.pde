

// Drawing with Recursion
// Example from http://web.arch.usyd.edu.au/~rob/teaching/2010/DECO1012/lectures/DECO1012-Lecture-07.pdf


void setup() {  //setup function called initially, only once
  size(50, 50);
  background(255);
  drawV(width/2, height, height/2, 10);
}

void drawV(int x, int y, int size, int num) {
  line(x, y, x - size/2, y - size);
  line(x, y, x + size/2, y - size);
  if (num > 0) {
    drawV(x - size/2, y - size, size/2, num-1);
    drawV(x + size/2, y - size, size/2, num-1);
  }
}
                
                
