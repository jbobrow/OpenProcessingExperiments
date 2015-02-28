
/*  Jeff Hendrickson March 09  */
/*  Multiplied Acceleration  */
/*  I started with Ira Greenberg's acceleration ideas and this is one
      example of what I've come up with.  The jittery groups of rects at
      each side will slowly start towards one another and disappear out the
      opposite side   */

float w;
float h;
int x = 0;
float y;
float speed = 0.8;

void setup() {
  size(600, 400);
  y = height/random(2,4);
  frameRate(30);
  rectMode(CENTER);
  smooth();
}

void draw() {
  background(0);
  speed*=1.05;  //play with this number to make the horizontal speed change - it is 
                //very delicate and large increments make it happen very fast
  
  for (int j=1; j<500; j++) {  //this set the number of rectangles
    w = random(10,40);
    h = random(10,40);
    fill(0, random(255), random(100),100);
    rect(speed*random(-1.2,1.2), y, w, h);  //left group
    y = height/2 + random(-150,150);
    rect((-speed*random(-1.2,1.2)+(width-10)), y, w, h);  //right group
    //ellipse(speed*random(-1.2,1.2), y, w, h);  uncomment this to add in ellipses
  }
}
/*  uncomment this section if you want a screen shot
void mousePressed()  {
  save("accelMany-110.tif");
}
*/

