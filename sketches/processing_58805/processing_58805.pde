
//Candice Ferreira. Problem set 1 question 3

void setup () {
  size (600, 600);
  background(0);
  stroke (0);
  smooth();
}

void draw () {
 fill (200,0,200);
  ellipseMode(CENTER);
ellipse (300, 300, 380, 380);
// mouth
fill (0);
ellipse (300, 380, 80, 40);
//left eye
fill (0);
ellipse (260, 250, 100, 100);
// right eye
fill (0);
ellipse (330, 250, 100, 100);
// left pupil
fill (0,0,255);
ellipse (260, 250, 20, 20);
// right pupil
fill (0,0,255);
ellipse (330, 250, 20, 20);
}

void mouseDragged () {
  fill (mouseX, mouseY, 255, 255);
   ellipse (300, 300, 380, 380);
   // mouth
fill (0);
ellipse (300, 380, 80, 40);
//left eye
fill (0);
ellipse (260, 250, 100, 100);
// right eye
fill (0);
ellipse (330, 250, 100, 100);
// left pupil
 fill (mouseX, mouseY, 255, 255);
ellipse (260, 250, 20, 20);
// right pupil
 fill (mouseX, mouseY, 255, 255);
ellipse (330, 250, 20, 20);

}
  


