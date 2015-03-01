
  /*  Process 0 after Reas
   *  by Neroli Wesley 24 June 2014
   */
  
  int num = 40;                        // number of circles
  float [] circles = new float[num];  // diameter
  float [] x = new float[num];        // start x
  float [] y = new float[num];        // start y
  float [] dx = new float[num];       // change in x
  float [] dy = new float[num];       // delta y 

void setup () {
  size(500,500);
  background(0);
  
 
  for (int i = 0; i < num; i++) {
      circles[i] = 200;               // diameter  
      x[i] = random(0, width);                // initial x for all the circles
      y[i] = random(0, height);               // initial y for all the circles
      dx[i] = random(-1,1);        // random x and y 
      dy[i] = random(-1,1);        // times 5 for funky effect
    }
}
  
void draw () {
  //background(255, 5);
  fill(255,50);
  rect(width,height);
    for (int i = 0; i < num; i++) {  // move each circle its random amount
      x[i] += dx[i];
      y[i] += dy[i];
    
      // When the shape hits the edge of the window, it reverses its direction
      // half the circle diametre makes them bounce off the edges
      if (x[i] > width-circles[i]/8 || x[i] < circles[i]/8) {
        // dx = dx > 0 ? -random(min, max) : random(min, max); modelled off this
        // I want it to bounce reflecting so make it either - or +ve the same amount
        // use abs to get a positive number
        dx[i] = dx[i] > 0 ? -dx[i] : abs(dx[i]);
        //println(x[i]);
      }
      if (y[i] > height-circles[i]/8 || y[i] < circles[i]/8) {
        dy[i] = dy[i] > 0 ? -dy[i] : abs(dy[i]);
      }
      if (i % 2 == 0) {
        stroke(#FCE805, 40);
      } else {
      stroke(#F74205,20);
      }
      //ellipse(x[i], y[i], circles[i],circles[i]);
      for (int j = 0 ; j < num; j++) {        // test against each other circle
        float collision = dist(x[i],y[i], x[j],y[j]);  // check if the circles
        //println(collision);
        if (collision < circles[i]/2 + circles[j]/2 && collision > 0) { 
          line (x[i], y[i], x[j], y[j]);
        }
      }
    }
      
}


