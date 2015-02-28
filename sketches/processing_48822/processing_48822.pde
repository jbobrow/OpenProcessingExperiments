
int blink = -200;

void setup () {
  size (400, 400);
  smooth ();

}

void draw () {

  background (100, 100, 255);

  ellipseMode (CENTER);
  noStroke ();

  // Eye Ball
  fill (255);
  ellipse (200, 200, 200, 200);

  // Pupil

  float x = map (mouseX, 0, width, 165, 235);
  float y = map (mouseY, 0, height, 165, 235);

  fill (200, 100, 255);
  ellipse (x, y, 100, 100);
  fill (150, 100, 255, 95);
  ellipse (x, y, 80, 80);
  fill (0, 0, 0, 180);
  ellipse (x, y, 30, 30);
  fill (200, 200, 255);
  ellipse (x + 10, y - 10, 20, 20);

  // Blink
  fill(100, 100, 255);
  rectMode(CORNER); 
  rect (0, blink, 400, 300);
  if ((mousePressed == true) && (blink<100)) {
    blink+=20;
  }
  else if (blink>-200)
  {
    blink-=20;
  }

  // Arms and Legs
  stroke (0);
  noFill ();

  ellipse (200, 200, 200, 200);
  
  line (291, 240, 300, 300);
  line (109, 240, 100, 300);
  
  line (170, 295, 170, 345);
  line (230, 295, 230, 345);
  
  fill (0);
  
  ellipse (300, 300, 5, 5);
  ellipse (100, 300, 5, 5);
  
  ellipse (170, 345, 5, 5);
  ellipse (230, 345, 5, 5);
  
  fill (209, 79, 225);
  noStroke ();
  ellipse (mouseX, mouseY - 5, 40, 40);
  
  fill (227, 182, 123);
  triangle (mouseX - 20, mouseY, mouseX + 20, mouseY, mouseX, mouseY + 40);

}
                
