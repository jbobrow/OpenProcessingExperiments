
int x = 100;
int y = 100;
int thesize = 64;

void setup () {
 size(200, 200); 
}

void drawcar(int x, int y, int thesize, color c) {
int offset = thesize/4;
  
  rectMode(CENTER);
  stroke(200);
  fill(c);
  rect(x, y, thesize, thesize/2);
 
 //fill(200);
rect(x - offset, y - offset, offset, offset/2);
rect(x + offset, y - offset, offset, offset/2);
rect(x - offset, y + offset, offset, offset/2);
rect(x + offset, y + offset, offset, offset/2);

}

void draw() {
 drawcar(100, 100, 64, color(200,200,0)); 
 drawcar(50, 75, 32, color(0, 200, 100)); 
 drawcar(80, 175, 40, color(200, 0 ,0 ));
}
