
float a = 0;

void setup() {
  size(400, 400);
  background(0);

}


void draw() {
a = a +1;
  stroke(255);   // 
  if (a > 100) {  // Whean
    stroke(255,204,204);   
  }
  if (a > 200) {  // Whean
    stroke(255,153,153);   
  }
    if (a > 300) {  // Whean
    stroke(255,102,102);   
  }
  line(20, a, 380, a);

}



