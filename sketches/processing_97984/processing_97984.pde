
// moving some shapes using translate
 
// x position of the rectangle
int x = 0;
 
void setup () {
  size(200,200);
}
 
 
void draw() {
  // when draw runs translate is set back to 0,0
  
  // this doesn't move
  rect(10,80,10,10);
  
  // move the origin to the right by amound x
 
  translate(x,0);
   
  // these shapes move
  rect(10,10,10,10);
  ellipse(10,10,10,10);
   
  // the moving shapes leave behind a
  // black trail from their stroke
  // try using background to fix this
}

void mousePressed() {
  if (mouseX > 10 && mouseX < 20 && mouseY > 80 && mouseY < 90) {
     x = x + 1;
  }
  
  
}
