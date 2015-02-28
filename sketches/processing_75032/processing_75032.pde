
int d=0;
int r=255;

void setup() {
  size(400, 400);
  background(0);
}

void draw() {
  
  if(mousePressed) {
    noFill();
    stroke(r);
    ellipse(width/2, height/2, d, d);
    
    d = d +1;
    r = r - 1;
    
      if(r < 0) {
        d = 0;
        r = 255;
      }
  }   
}
