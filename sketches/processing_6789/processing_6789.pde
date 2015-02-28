
/**
 * Demonstration for a "stripchart recorder" class.
 */

Stripchart s1;
Stripchart s2;
Stripchart s3;
Stripchart s4;
int n = 0;

void setup() {
  size(400, 250, P2D); // animation is much smoother in P2D; text looks better with JAVA2D
  background(255);
  
  /*
   * Parameters to constructor are:
   * x position, y position
   * number of data points to display at any time
   * height of "recording" area
   * interval at which to draw the gray vertical bar; set to zero for no bar
   * color of stripchart plot
   * minimum and maximum values to plot (will constrain to those values)
   *
   * The actual height of the stripchart includes some extra vertical space
   * above and below the recording area. The actual width of the stripchart
   * includes room for the minimum and maximum values.
   */
  s1 = new Stripchart(10, 50, 180, 50, 45, color(0, 128, 0), -1.0, 1.0); 
  s2 = new Stripchart(10, 110, 180, 50, 45, color(255, 0, 0), -1.0, 1.0);
  s3 = new Stripchart(10, 170, 120, 50, 0, color(0, 128, 128), 0, 400);
  s4 = new Stripchart(200, 170, 120, 50, 0, color(128, 0, 128), 0, 250);
  frameRate(30);
}

void draw() {
  /*
   * The first chart draws a cosine wave, one dot per frame
   */
  s1.plot(cos(radians(frameCount % 360)));
  
  /*
   * The next chart draws a sine wave, but is "faster" because
   * it adds three pieces of data every time it displays the chart.
   */
  s2.addData(sin(radians(n)));
  s2.addData(sin(radians(n + 1)));
  s2.addData(sin(radians(n + 2)));
  s2.display();
  n = (n + 3) % 360; 
  
  /* The last two charts track mouseX and mouseY movement */
  s3.plot(mouseX);
  s4.plot(mouseY);

}


