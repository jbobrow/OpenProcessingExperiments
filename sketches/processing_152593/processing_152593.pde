
  /*  Process 5 after Reas
   *  by Neroli Wesley 24 June 2014
   */
  
  int num = 10;                        // number of circles
  float [] circles = new float[num];  // not allocated
  float [] x = new float[num];        // start x
  float [] y = new float[num];        // start y
  float [] dx = new float[num];       // change in x
  float [] dy = new float[num];       // delta y 

void setup () {
  size(500,500);
  background(255);
  
 
  for (int i = 0; i < num; i++) {
      circles[i] = 50;               // diameter  
      x[i] = width/2;                // initial x for all the circles
      y[i] = height/2;               // initial y for all the circles
      dx[i] = random(-1,1)*5;        // random x and y 
      dy[i] = random(-1,1)*5;        // times 5 for funky effect
    }
}
  
void draw () {
  //background(255, 50);
    for (int i = 0; i < num; i++) {  // move each circle its random amount
      x[i] += dx[i];
      y[i] += dy[i];
    
      // When the shape hits the edge of the window, it reverses its direction
      // half the circle diametre makes them bounce off the edges
      if (x[i] > width-circles[i]/2 || x[i] < circles[i]/2) {
        // dx = dx > 0 ? -random(min, max) : random(min, max); modelled off this
        // I want it to bounce reflecting so make it either - or +ve the same amount
        // use abs to get a positive number
        dx[i] = dx[i] > 0 ? -dx[i] : abs(dx[i]);
        //println(x[i]);
      }
      if (y[i] > height-circles[i]/2 || y[i] < circles[i]/2) {
        dy[i] = dy[i] > 0 ? -dy[i] : abs(dy[i]);
      }
      stroke(0,20);
      //ellipse(x[i], y[i], circles[i],circles[i]);
      for (int j = 0 ; j < num; j++) {        // test against each other circle
        float collision = dist(x[i],y[i], x[j],y[j]);  // check if the circles
        //println(collision);
        if (collision < circles[i]/2 + circles[j]/2) { // draws a line to itself at x,y so draws a line
          line (x[i], y[i], x[j], y[j]);
        }
      }
    }
      
}


