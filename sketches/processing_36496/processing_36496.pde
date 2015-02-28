
int i = 0;

void setup() {  
  size(500, 500);
  background(87, 195, 227);  
  smooth();
}

void draw() { 
  background(87, 195, 227);
  for (int x = -1; x<10; x++) {
    for (int y = 0; y<10; y++) {      
      int dx = 50*x;
      int dy = 50*y;
      dx += i;
      fill(39,70,147);
      //ellipse (25 + dx, 25 + dy, 50, 50);    
      //fill(255);
      beginShape();
      vertex(25 + dx, 0 + dy);
      vertex(32 + dx, 16 + dy);
      vertex(47 + dx, 16 + dy);
      vertex(34 + dx, 25 + dy);
      vertex(42 + dx, 42 + dy);
      vertex(25 + dx, 31 + dy);
      vertex(8 + dx, 42 + dy);
      vertex(16 + dx, 25 + dy);
      vertex(3 + dx, 16 + dy);
      vertex(18 + dx, 16 + dy);
      vertex(25 + dx, 3 + dy);
      endShape();
    }
  } 
  i += 1;
  if (i >= 50) {
    i = 0;
   }
}
                
                                
