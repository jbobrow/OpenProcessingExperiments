
// Example from http://web.arch.usyd.edu.au/~rob/teaching/2010/DECO1012/lectures/DECO1012-Lecture-03.pdf

void setup() {  //setup function called initially, only once
  size(50, 50);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  for (int y = 0; y <= 50; y += 5) {
    for (int x = 0; x <= 50; x += 5) {
      if ((x % 10) == 0) {
        line(x, y, x+3, y-3);
      } else {
        line(x, y, x+3, y+3);
      }
    }
  }
}

                
                
