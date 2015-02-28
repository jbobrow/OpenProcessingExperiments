
void setup () {
  size(500, 300);
  background(0);
}
 
void draw() {
  float a = map(mouseX, 0, 600, 150, 200);
  float b = map(mouseX, 0, 600, 350, 380);
  float c = map(mouseY, 0, 600, 150, 200);
 
ellipseMode(CENTER);
 
    //left eye
    stroke(0);
    fill(255);
    ellipse(150, 150, 200, 200);
    
    //right eye
    stroke(0);
    fill(255);
    ellipse(350, 150, 200, 200);
 
    //left pupil
    fill(0);
    ellipse(a, c, 100, 100);
 
    //right pupil
    fill(0);
    ellipse(b, c, 100, 100);
  }



