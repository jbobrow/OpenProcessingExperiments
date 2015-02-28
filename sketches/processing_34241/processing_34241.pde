
int xpos = 20;
int ypos = 20;
int r = 2;

//ellipseSize = Es 
int Es = 20;
void setup ()
{
  size (450, 450);
  smooth ();
  background (200);
}
void draw() {
  fill (20);
  noStroke();
  rect ( 0, 0, width, height);

  // Example: 2D Array

  int cols = width;
  int rows = height;

  // Draw Grid


  for (int i = width/xpos; i < cols; i+=width/xpos) {

    for (int j = height/ypos; j < rows; j+=height/ypos) {
      stroke(255);
      fill(255);
      //strokeWeight(4);
      //fill (int(random(255)));
      ellipse(i, j, Es, Es);

      //ellipse(i+int(random(-r,r)),j,Es,Es);
    }
  }
}
       
