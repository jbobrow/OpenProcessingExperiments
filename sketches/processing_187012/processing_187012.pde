
void setup() {
  size(600, 600);
  colorMode(HSB);
}
void draw() {
  background(255);
  for (int i = 255; i > 0 ; i=i-15) {
    fill(i-3, 200, 200);
    ellipse( width/2, height/2, i, i); 
    ellipse( width/2, height/2, i, i); 
   ellipse( width/2, height/2, i, i); 
    ellipse( width/2, height/2, i, i); 
    }
}

