
//Kyle Lleses 
//PS1-3

void setup () {
  size (500, 500);
  smooth ();
}

void draw () {
  background (0, 0, 0);

  fill (255, 255, 255);
  ellipse (250, 254, 270, 280);

  // teeth
  fill (255, 255, 255);
  rect (142, 330, 220, 80);

  fill (0, 0, 0);
  rect (172, 370, 30, 40);
  rect (235, 370, 30, 40);
  rect (300, 370, 30, 40);

  //outer eye
  fill (205, 205, 201);
  ellipse (185, 255, 65, 60);
  ellipse (315, 255, 65, 60);
  //eyes
  fill (0, 0, 0);
  fill(mouseX,mouseY,0,255);
  ellipse (185, 250, 65, 60);
  ellipse (315, 250, 65, 60);

  //noseh
  fill (205, 205, 201);
  arc (250, 335, 57, 93, PI, TWO_PI);
  //nose
  fill (0, 0, 0);
  arc (250, 330, 55, 90, PI, TWO_PI);


  noStroke();
}


