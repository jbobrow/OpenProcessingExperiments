
float i = 2.5; // scale of the pattern
 
 void setup() {
   size(1000, 1000);
   background(255, 252, 226);
   noStroke();
 }
 
 void draw() {
   for(float y = 0; y<=height; y+=(11*i)) {
    for(float x = 0; x<=width; x+=(11*i)) {
      
      fill(12, 166, 204);
      beginShape();
      vertex(x, y);
      vertex(x+4*i, y);
      vertex(x, y+4*i);
      endShape(CLOSE);
      
      beginShape();
      vertex(x, y+10*i);
      vertex(x+4*i, y+6*i);
      vertex(x+4*i, y+10*i);
      endShape(CLOSE);
      
      beginShape();
      vertex(x+6*i, y);
      vertex(x+10*i, y);
      vertex(x+10*i, y+4*i);
      endShape(CLOSE);
      
      beginShape();
      vertex(x+10*i, y+10*i);
      vertex(x+6*i, y+6*i);
      vertex(x+6*i, y+10*i);
      endShape(CLOSE);
      
      ellipseMode(CENTER);
      fill(255, 98, 154);
      ellipse(x+(2.5*i), y+(5*i), 1.3*i, 1.3*i);
      ellipse(x+(7.5*i), y+(5*i), 1.3*i, 1.3*i);
    }
  }
}
