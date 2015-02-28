
void setup() {
  size(400, 400);
}
void draw() {
  background(255);

  rect(mouseX, mouseY, pmouseX-mouseY, mouseY-mouseX ); 
  fill( random(0, 255), random(0, 255), random(0, 255), random(0, 255) );

  stroke(random(0, 255), random(0, 255), random(0, 255));
  fill(random(0, 255), random(0, 255), random(0, 255), random(0, 255));
  rect(mouseX, 150, 100, 100);
  int rect_y = round( map(mouseY, 0, height, random(0,200), random(0,200)) );

  stroke(random(0, 255), random(0, 255), random(0, 255));
  fill(random(0, 255), random(0, 255), random(0, 255), random(0, 255));
  rect( 150, rect_y, random(100,50), random(100,150) );  
  int rect_x = round( map(mouseX, 100, width, width, 0) );

  stroke(random(0, 255), random(0, 255), random(0, 255));
  fill(random(0, 255), random(0, 255), random(0, 255), random(0, 255));
  rect( rect_x, 200, random(50,100), random(50,100) );
  int r = round( map(mouseX, 0, width, 0, 255) );

  frameRate(15);
}



