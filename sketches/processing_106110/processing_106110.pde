
int x = 40;
int y = 40;
int t = 1;

void setup()
{
  size(200, 200);
  background(255);
}
void draw() {
  background(255);
  fill(192);
  noStroke();
  //this is a where the square is before it rotates 
  rect(x, y, 40, 40);
  
  pushMatrix();
    // move the origin to the pivot point
    translate(x, y); 
  
    // then pivot the grid
    rotate(radians(t));
  
    // and draw the square at the origin
    fill(0);
    rect(0, 0, 40, 40);
  popMatrix(); 
  t += QUARTER_PI;
  if (t == TWO_PI) { 
    //TWO_PI is a full rotation.
    t = 0;
    //Set back to 0 because if not, t will keep on getting bigger and bigger, which isn't good coding practice.
  }
}


