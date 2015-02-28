
int g = 0;

void setup () {
  size (300, 300);
  background (255);
}

void draw () {
  fill (158, 221, 238);
  noStroke();
  rect (0, 0, width, height);
 
  
   if (mousePressed) {
     fill (255, 90);
     ellipse (mouseX, mouseY,g ,g);
     g=g + 5;
     
   }
   else {
     g=0;
   }
}

