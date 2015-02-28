
// Example 05-21 from "Getting Started with Processing" 
// by Reas & Fry. O'Reilly / Make 2010

int x = 455;
int y = 300;
void setup() {
  size(920,600);
}

void draw() {
  if (keyPressed && (key == CODED)) { // If it's a coded key
    if (keyCode == LEFT ) {            // If it's the left arrow
      x--;
      x=x-4;
    } 
    else if (keyCode == RIGHT) {      // If it's the right arrow
      x++;
      x=x+4;
    }
     if (keyCode == UP) {            // If it's the Up arrow
      y--;
      y=y-4;
    } 
    else if (keyCode == DOWN) {      // If it's the Down arrow
      y++;
      y=y+4;
    }
    /*
      if (keyCode == LEFT && keyCode == UP) {            // If it's the left arrow
      x--;
      x=x-4;
      y--;
      y=y-4;
      }
    if (keyCode == RIGHT && keyCode == DOWN) {            // If it's the left arrow
      x++;
      x=x+4;
      y++;
      y=y+4;
      }
      */
  }
  rect(x, y, 10-x/15, 10+y/15);
  ellipse(x,y,10+x/5,16-y/5);
  
}
//===========SaveImage
void keyReleased() {
  if (key=='s' || key=='S') saveFrame(timestamp()+".png"); }
  String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
 
//==============
