
void setup() {

  smooth();
  noFill();
  size(500, 500);
}
void draw() {


  for (float i =0; i <= 10; i++)
  { 
    drawCircle(250, 250, i*50);



    /* ellipse(width/2, height/2, d, d);*/
  }

  // With a for loops
  for (float x = 0; x < width; x+=10) {
    for (float y = 0; y < height; y+=10) {
      noStroke();
      fill(random(255), 100);
      tint(255, 255);
      rect(x, y, 10, 10);
    }
  } 
}
  void drawCircle (float xPos, float yPos, float cirDiameter) {
    ellipse(xPos, yPos, cirDiameter, cirDiameter);
  }

  /*// With a while loop
   int x = 0;
   while (x < width) {
   int y = 0;
   while (y < height) {
   noStroke();
   fill(random(255));
   rect(x,y,10,10);
   y += 10;
   }
   x += 10;
   }*/


