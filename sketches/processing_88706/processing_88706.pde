
void setup() {
  size(500,500);
  background(0);
}

void draw() {
  for(int i=0; i<10; i++) {
   
   for(int j=0; j<10; j++) {
 
      newShape(mouseX, mouseY, mouseX+100, 250);
 
   }    
  }
}

void newShape(int a, int b, int c, int d) {
  beginShape();
  stroke(random(255));
  vertex(a, b);
 vertex(a-10, b+10);
  vertex(a-100, b+50);
  vertex(a, b+100);
 endShape(CLOSE);
 fill(54);
}




