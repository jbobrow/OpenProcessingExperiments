


void setup() {
  size (500, 500);
}

void draw() {
  //cerchiosfondo
    fill (23, 23, 23, 10);
  smooth();
  stroke(56, 32, 87, 30);
  ellipse ( 250, 250, random( 500), random (500) );
  
  //cerchio1
  fill (23, mouseY, 123, 10);
  smooth();
  stroke(56, mouseY, 87, 30);
  ellipse ( 250, 250, random( 400), random (400) );

  //cerchio2
  fill (mouseY, 23, 123, 10);
  smooth();
  stroke(56, 45, mouseY, 30);
  ellipse ( 100, 100, random( 200), random (200) );

  //cerchio3
  fill (mouseY, 23, 123, 10);
  smooth();
  stroke(56, 45, mouseX, 30);
  ellipse ( 400, 400, random( 200), random (200) );

  //cerchio4
  fill (56, 56,mouseY, 10);
  smooth();
  stroke(56, 45, mouseY, 30);
  ellipse ( 100, 400, random( 200), random (200) );

  //cerchio5
  fill (56, 56, mouseY,10);
  smooth();
  stroke(56, 45, mouseX, 30);
  ellipse ( 400, 100, random( 200), random (200) );
}


