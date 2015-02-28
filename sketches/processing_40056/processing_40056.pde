


    
    
// Move the mouse across the image
// to change its value


int a = 1;
int b = 2;
int c = 8;

void draw() {
  fill(a);
  ellipse(25, 25, 30, 30);
  fill(b);
  ellipse (45,70,78,8);
  fill(c);
  ellipse (80,10,7,8);
  
}

void mouseMoved() {
  a = a + 2;
  if (a > 255) {
    a = 0;

    
   }
  

  b = b + 2;
  if (b >160){
    b = 0;

    
   
  }
  
  c= c+ 2;
  if (c >330) {
    c = 0;
    }
}

                
                
