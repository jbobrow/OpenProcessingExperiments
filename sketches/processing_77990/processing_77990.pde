
void setup() {
smooth();
  size(255, 255);
  noStroke();
  //grid of squares, i want it to last on the screen without the y affected by the float y.
  frameRate (10);
}



void draw() {
  colorMode(RGB);
  if (frameCount>=30)
    for (int i = 1; i < 225;i++) {
      fill(225, 0, 0, 25);
      rect(0, 0, 255, 255);
    }
  fill (0, 0, 0); 
  textSize(32); 
  if (frameCount>=30)text( "PASSION", width*.5, 130 );
  for (int i =255; i>0;i--) { 

    if (frameCount < 30 )stroke( i*3-355, i*3-150, 255, 80);

    line(0, i, 500, i);
   
    textAlign(CENTER);
    fill(0, 050, 250);

    if (frameCount<30)
      text("chill", width*.5, 130);
  }
}
