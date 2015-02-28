
void setup() {
  size(200,200);
}

void draw() {
  background(255);
  for( int x=20; x<180; x=x+5 ) {
    for( int y=20; y<180; y=y+5 ) {
      stroke(3);
      ellipse(x,y,1,1);
      {
        noStroke();
        rect(60,60,80,80);
      }
    }
  }
}
      
