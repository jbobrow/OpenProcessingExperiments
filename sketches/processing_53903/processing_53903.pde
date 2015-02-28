
void setup (){
  size (500,500);
  background (#d2c712);
  frameRate (60);
}
int a = 0; // circle size
float b = 0;
void draw () {
      a += 8;
      //draw shape//
      smooth();
      fill (0,b);
      stroke(0);
      strokeWeight (2);
      ellipse (width/2,height/2,a,a);
      //exceeds screen, starts again//
        if (a>730) {
        a = 0;
        b = 0;
        background (#d2c712);
        }
}


