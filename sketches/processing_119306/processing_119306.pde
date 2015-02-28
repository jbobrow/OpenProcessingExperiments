
void setup()

{
  
  size (500, 500);
  background (0);
  
}

void draw()

{
  
  background (0);
  
  fill (255, 255, 0);
  stroke (0);
  rect (225, 225, 50, 50);
  
  float bewegung = map (mouseX, 500, 10, 10, 190);
 
  ellipse (30 + bewegung, 30 + bewegung, 50, 50);
  ellipse (470 - bewegung, 30 + bewegung, 50, 50);
  ellipse (30 + bewegung, 470 - bewegung, 50, 50);
  ellipse (470 - bewegung, 470 - bewegung, 50, 50);
  
  stroke (255);
  strokeWeight (2);
  line (0, 490, 500, 490);
  line (0, 470, 500, 470);
  line (0, 440, 500, 440);
  line (0, 400, 500, 400);
  line (0, 350, 500, 350);
  line (0, 300, 500, 300);
  line (0, 240, 500, 240);
  line (0, 160, 500, 160);
  line (0, 80, 500, 80);
  
}
