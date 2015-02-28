
void setup() {
smooth();
  size(250, 250);
  noStroke();
  //grid of squares, i want it to last on the screen without the y affected by the float y.
  frameRate (10);
}
 
 
 
void draw() {
  colorMode(RGB);
  if (frameCount>=30)
    for (int i = 1; i < 225;i++) {
      fill(60, 210, 50, 130);
      rect(0, 100, 250, 250);
    }
  fill (255, 0, 0);
  textSize(40);
  if (frameCount>=40)text( "but SERIOUS!", width*.5, 200 );
  for (int i =255; i>0;i--) {
 
    if (frameCount < 30 )stroke( i*3-355, i*3-150, 255, 100);
 
    line(0, i, 500, i);
    
    textAlign(CENTER);
    fill(255, 255, 0);
 
    if (frameCount<40)
      text("f(_)NnY........", width*.5, 75);
  }
}

