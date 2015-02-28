
// Example 02-02 from "Getting Started with Processing" 
// by Reas & Fry. O'Reilly / Make 2010

void setup() {
  size(920,600);
  smooth();
}

void draw() {
  if (mousePressed) {
    fill(0);
  } else {
    fill(random(255),random(255),random(255));
  }
  ellipse(mouseX, mouseY, 80, 80);
}
//===========SaveImage
void keyReleased() {
  if (key=='s' || key=='S') saveFrame(timestamp()+".png"); }
  String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
 
//==============
