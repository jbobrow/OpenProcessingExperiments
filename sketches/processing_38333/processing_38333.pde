
float a = 0;

void setup() {
  size(500, 500);  
  smooth();
}

void draw() {
  background(0);  
  int x = 400/11;
  for (float col = 1; col <= 11; col++) {
    for (float row = 1; row <= 11; row++) {
      a = a+col+row;
      /*if (a >= 360) {
      a = 0;
      }*/
      arc(35+x*col, 35+x*row, 30, 30, radians(a), radians(a+180));
    }
  }
}         
                                                
