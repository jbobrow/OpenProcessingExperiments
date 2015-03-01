
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
}

void draw() {  //draw function loops 
  background(255);
  
  beginShape();
  vertex(50,50);
  vertex(50,100);
  vertex(100,100);
  endShape();
}
