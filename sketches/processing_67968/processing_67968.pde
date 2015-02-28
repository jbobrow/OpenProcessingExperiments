
void setup()

 {

   size(650, 330);

 }

   

 void draw()

 {

  background(252 , 250, 250);

  smooth();

 

  noFill();

  stroke(0, 0, 255);

  strokeWeight(11);

  ellipse(120, 120, 150, 150);

 

  noFill();

  stroke(0);

  strokeWeight(11);

  ellipse(300, 120, 150, 150);

 

  noFill();

  stroke(255, 0, 0);

  strokeWeight(11);

  ellipse(mouseX, mouseY, 150, 150);

 

  noFill();

  stroke(255, 255, 0);

  strokeWeight(11);

  ellipse(210, 200, 150, 150);

 

  noFill();

  stroke(0, 255, 0);

  strokeWeight(11);

  ellipse(390, 200, 150, 150);

 }



