
/* Name Project One, Time. 
 Time is being filed away by seconds. White rectangles with black border.
 The rectangles are on rows and columns with rectangles facing the other
 direction merging into the bottom set of rectangles.
 Lisa Donaldson, Sept. 25, 2012. lsdonald@sfu.ca
 */


int x = 1; 
int y = 2;

int s = second(); // declares the time function
int m = minute();
int h = hour();

void setup() { 
  size(600, 200); // screen size
  background(0); // background color black
}
void draw() {

  if (mousePressed == true) {  /* if mouse is pressed draw circles that moves
   with the mouse, and displays time.
   */

    x = mouseX; // assigning mouseX to x
    y = mouseY; // assigning mouseY to y

    fill(255, 0, 255, 15); // circles color is pink with transparency
    ellipse(x, y, width/5 + x, height/5 +y);/* pink circle that with time and is 
     centered under the mouse location.
     */
    fill(0);// text color
    text("" +hour()%12 +"   Hour(s)", x -20, y - 20 ); //place time in circle

    fill(0, 0, 255, 15);// blue color for circle with a transparency added
    ellipse(150, 100, width/2 - x, height/5 -y);// smaller blue circle with set
    // x, y location
    fill(0); // color of letter/time
    text("" + minute() + "   minutes", x, y);// posted time of minutes

    fill(255, 0, 0, 15); // red color with transparency
    ellipse(450, 125, width/10 + x, height/2 +y);// red circle
    fill(0);// text color
    text("" + second() + "   seconds", x +20, y +20);/* text and time on top of
     all the circles
     */
  }
  else { /* if there is no click draw the following rectrangle pattern and
   actions.
   */


    int s = second();
    fill(255);

    for (int i = 0; i<30; i++) {

      for (int m = 0; m<600; m += 105) {

        rect(m, i*11, 100, 10); 
        rect(i*30, s, 100, 100);
      }
    }
  }
}



