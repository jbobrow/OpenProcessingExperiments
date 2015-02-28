
//setup sketch
void setup() {
  size(500, 500);
}

void draw() {

  background(24, 116, 205);
  smooth ();



  //backboard
  strokeWeight(4);
  fill( 255, 255, 0);
  rect(200, 200, 200, 150);
  fill(0);
  
  //inner rectangular box on backboard
  rect(250, 270, 100, 70);
  fill(135, 206, 255);
  rect(250, 270, 100, 70);

  //support beam hoop hangs from
  strokeWeight(4);
  fill(20, 50, 250);
  rect(280, 0, 35, 200);

  //rim
  strokeWeight(2);
  strokeCap(ROUND);
  fill(0, 0, 0);
  line (265, 330, 335, 330);

  //net
  fill(0);
  strokeCap(SQUARE);
  line(265, 330, 270, 375);
  line(335, 330, 330, 375);
  line(270, 375, 275, 390);
  line(330, 375, 325, 390);
  line(275, 390, 280, 375);
  line(280, 375, 285, 390);
  line(285, 390, 290, 375);
  line(290, 375, 295, 390);
  line(295, 390, 300, 375);
  line(300, 375, 305, 390);
  line(305, 390, 310, 375);
  line(310, 375, 315, 390);
  line(315, 390, 320, 375);
  line(320, 375, 325, 390);


  //shot clock
  fill( 123, 79, 89);
  rect (320, 120, 80, 80);

  //number 11 (signifying 11 seconds left on the shot clock)

  strokeWeight(3);
  stroke(255, 0, 0);
  line (345, 150, 345, 185);
  line (375, 150, 375, 185);
  line (345, 150, 335, 160);
  line (335, 185, 355, 185);
  line (375, 150, 365, 160);
  line (365, 185, 385, 185);

  //basketball - moves with mouse

  stroke(0);
  strokeWeight(3);
  ellipseMode(CENTER); 
  fill( 238, 118, 0);
  ellipse(mouseX, mouseY, 55, 55);
  
  //seams in basketball
  strokeWeight(3);
  line(mouseX, mouseY-28, mouseX, mouseY+25);
  arc(mouseX-20, mouseY, 30, 42, -1.571, 1.571);
  arc(mouseX+20, mouseY, 30, 42, 1.785, 4.632);
  strokeWeight(3);
  line(mouseX-25, mouseY, mouseX+25, mouseY);
}
