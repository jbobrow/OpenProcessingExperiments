
 int inc = 50;
int inc2 = 50;


void setup() {
  size(600, 600);
  smooth();
  noStroke();
}


void draw() {

  //background(25);

 
  if (frameCount % 10 == 0) {
    inc +=50;
  }
   for (int x = 25; x < inc; x+= 50) {
   if (x >= width) {
   inc2 += 50;
   inc = 50;
   }
   for (int y = 25; y < inc2; y+= 50) {
   fill(255, 0, 0);
   ellipse(x, y, 30, 30);
   }
   }

}


