
int xPos;
int yPos;

 void setup() {
  size (500, 500);
  xPos= width/2;
  yPos= height/2;
}

 void draw () {
   background (80);
   if (mouseX > 2 * width/3) {
   xPos ++;
   background (190);
}
  
   else if (mouseX < width/3) {
   xPos --;
}

fill (120);
ellipse (xPos, yPos, 50, 50);
}
