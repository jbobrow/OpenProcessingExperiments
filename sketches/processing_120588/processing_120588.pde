
void setup () {
  size (600,600);
  background(485,394,392);
  frameRate(10);
  smooth ();
   
}
 
void draw () {
  float durchmesser = dist (pmouseX, pmouseY, mouseX, mouseY);
  if (mousePressed == true)
  fill(34,50);
  stroke(30,180,30);
  strokeWeight(2);
  ellipse(mouseX,mouseY,70,70);
  dist (mouseX, mouseY, pmouseX, pmouseY);
   
}
 
void keyPressed () {
   if (key == 's');
   println("Frame abspeichern");
   saveFrame("screenshot-####.tif");
 }

