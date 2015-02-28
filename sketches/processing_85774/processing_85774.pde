
void setup () {
  size ( 600, 600);
 fill ( 255, 255, 255);
  rect(0, 0, 600, 600);
 fill (255, 0, 0);
strokeWeight(5);
  rect( 80, 80, 300, 300 );
 fill ( 0, 0, 255);
  rect( 80, 400, 300, 300 );
 fill ( 0, 0, 255);
  rect( 423, 80, 300, 100);
 fill ( 255, 200, 0); 
  rect( 423, 210, 150, 100);
 fill ( 0, 255, 0); 
  rect( 423, 350, 75, 50);
 fill ( 255, 200, 0);
  rect( 423, 420, 75, 50);
fill (200, 0, 0);
  arc(580, 600, 280, 280, PI, TWO_PI);
strokeWeight (10);
fill (20, 200, 50);
  ellipse( 100, 35, 75, 75);
  ellipse( 420, 35, 75, 75);
  ellipse( 35, 390, 75, 75);
}
void draw () {
  println (mouseX);
  println (mouseY);
}



