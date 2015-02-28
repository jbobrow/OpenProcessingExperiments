
int x=0;

void setup () {
  size(800,400);
  background(255);
  smooth();
  frameRate(2000);
}

void draw() {
  for (int i=0; i <400; i+=80) {
    line(0,i,800,i);
  }
    drawing(0,0,0);
    
}

void drawing (int r, int g, int b) {
   if (mousePressed == true) {
    noStroke();
    fill(r,g,b);
    rect(mouseX, mouseY,5,5);
   }

}


