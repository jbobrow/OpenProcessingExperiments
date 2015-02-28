
void setup() {
  size(750, 750);
  background(0,100,205);
}

void draw() {
  if (mousePressed) { 
    drop (mouseX, mouseY);
  }
}

void drop (int x, int y) {
   ellipseMode(CENTER);
   
   // a randomly chosen blue for each drop
   int g = int (random(0, 150));
   int b = int (random(150, 256));
   fill(0, g, b);
   
   //let the drops grow... TODO: slowly!!
   int r = int (random(5, 150));
   for (int i = 0; i < r; ++i) {
     noStroke();
     ellipse (x, y, 20 + i, 20 + i);
   }
}


