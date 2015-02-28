
void setup () {
  size (400, 400);
  background (#10FF00);
  smooth();
}
 
void draw () {
}
 
void mouseDragged () {
  tele ();
}
 
void tele() {
 
  ellipseMode (CENTER); 
  color from = color(random(255)) ;
  color to = color(random(255));
  color buba = lerpColor(from, to, .70);
  color huba =lerpColor(from, to, .30);
  fill(buba);
 

fill(buba);
ellipse (mouseX, mouseY, 130, 130); // face

fill (huba);
ellipse(mouseX, mouseY+25, 70, 70); //mouth
2
fill(buba);
ellipse(mouseX-25, mouseY-25, 30, 30); // left eye

fill(buba);
ellipse(mouseX+25, mouseY-25, 30, 30); //right eye


fill(huba);
ellipse(mouseX-25, mouseY-32, 15, 15); // left eye ball

fill(huba);
ellipse(mouseX+25, mouseY-32, 15, 15); //right eye ball




 
}

                
