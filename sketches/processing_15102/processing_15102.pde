
void setup() {
  size(200,200);
}

void draw() {
  for(int x=20; x<180; x=x+5) {
    for(int y=20; y<180; y=y+5) {
      point(x,y);
    }
  }
  noStroke();
  rect(60,60,80,80);
}
       
                
