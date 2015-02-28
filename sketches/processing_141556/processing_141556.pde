


float x = 1;
public void setup () {
  size (500, 500);
  background (103);
  cursor(CROSS);
}

public void draw () {
  fill(0, 0, 0, 2);
  rect(0, 0, 500, 500);
  noFill ();
  stroke (60, 200, 180, 75);
  ellipse (0+x, 0+x, mouseX, mouseY);
  ellipse (0+x, 500-x, mouseX, mouseY);
  ellipse (500-x, 0+x, mouseX, mouseY);
  ellipse (500-x, 500-x, mouseX, mouseY);
  stroke (255, 60);
  ellipse (250, 0+x, mouseX, mouseY); 
  ellipse (0+x, 250, mouseX, mouseY);
  ellipse (500-x, 250, mouseX, mouseY);
  ellipse (250, 500-x, mouseX, mouseY);
  strokeWeight (1);

  x=x+1;
  if (x>=250) {
    x=-250;
  }
}

