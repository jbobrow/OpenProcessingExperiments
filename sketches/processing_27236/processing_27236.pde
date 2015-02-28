
// from: http://web.arch.usyd.edu.au/~rob/teaching/2010/DECO1012/lectures/DECO1012-Lecture-08.pdf


void setup() {  //setup function called initially, only once
  size(250, 250);
}

void draw() {  //draw function loops 
  for (int i = 0; i < 250; i++) {
    for (int j = 0; j < 250; j++) {
      color c = color((i + j) * 0.5);
      set(i, j, c);
    }
  }
}

                
                
