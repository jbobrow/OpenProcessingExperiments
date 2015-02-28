
void setup () {
  size ( 600, 600);
strokeWeight (5);
fill (50, 125, 155);
  rect (0, 0, 600, 600);
fill (50, 0, 50);
  triangle ( 180, 18, 18, 360, 81, 360);
strokeWeight (10);
fill (0, 0, 0);
  ellipse( 300, 145, 75, 75);
  ellipse( 300, 130, 35, 75);
  ellipse( 400, 160, 75, 75);
  ellipse( 420, 260, 75, 55);
  ellipse( 440, 250, 85, 45);
  ellipse( 435, 255, 75, 35);
  ellipse( 220, 110, 75, 75);
  ellipse( 210, 110, 45, 75);
strokeWeight (7.5);
fill (0, 0,0);
  ellipse(242, 400, 145, 40);
  ellipse(242, 500, 140, 140);
  ellipse(490, 364, 130, 125);
fill (50, 125, 155);
  ellipse(500, 600, 200, 200);
  ellipse(500, 600, 175, 175);
  ellipse(500, 600, 125, 125);
  fill (26, 0, 0);
  ellipse( 359, 450, 280, 280);
  ellipse(500, 600, 100, 100);
fill (200, 0, 0);
  arc(359, 450, 280, 280, PI, TWO_PI);
}
void draw () {
  println (mouseX);
  println (mouseY);
}



