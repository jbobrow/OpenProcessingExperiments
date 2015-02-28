
// Introduction to Computational Arts: Processing
// Week 3_Assignment 2: A Dynamic Sketch
// "Lines and Points" Michael Kruger 2014-02-19
/*
The sketch “Lines and Points” is based on controlled randomness. 
1. A bundle (280) of coloured lines is running form the left upper corner to the right lower corner. 
2. 20 white outlier lines are placed in a complete random order.
3. 5 circles are placed on each outlier line (mid-point , 2 quarter and 2 eighth-points).
4. The size of the circle is:
a. based on the length of the line and
b. the position on the line (smaller towards the edge).
*/


// global variables
float counter = 0;
color[] palette = {
  #F4C42B, #D99E2F, #C07F2B, #FCEA9E, #EBB131
};

void setup() {
  size(720, 720);
  background(palette[0]);
  noLoop();
}

void draw() {
  // while statement
  while (counter < 300) {

    if (counter < 280) {
      float x1 = random(-width/4, 0);
      float y1 = random(-height/4, 0);
      float x2 = random(width/4, width + width/4);
      float y2 = random(height/4, height + height/4);

      float r = random(1, 5);
      strokeWeight(random(2));
      stroke(palette[int(r)]);
      line(x1, y1, x2, y2);
    } 
    else {

      // 20 outliers
      float xc1 = random(width);
      float yc1 = random(height);
      float xc2 = random(width);
      float yc2 = random(height);

      float r = random(1, 5);
      stroke(255);
      strokeWeight(1);
      line(xc1, yc1, xc2, yc2);

      // circle on lines
      noStroke();
      fill(255, random(104,205));


      // mid-point
      float xM = (xc1+xc2)/2;
      float yM = (yc1+yc2)/2;
      // quarter-point 1
      float xQ1 = (xc1+xM)/2;
      float yQ1 = (yc1+yM)/2;
      // quarter-point 2
      float xQ2 = (xc2+xM)/2;
      float yQ2 = (yc2+yM)/2;
      // eighth-point 1
      float xE1 = (xc1+xQ1)/2;
      float yE1 = (yc1+yQ1)/2;
      // eighth-point 2
      float xE2 = (xM+xQ2)/2;
      float yE2 = (yM+yQ2)/2;

      // dim of circle based on lenght of outlier line
      if (dist(xc1, yc1, xc2, yc2) > width/2) {

        float d = random(65,80);


        // circle mid-point
        ellipse(xM, yM, d, d);
        // circle quarter-point 1
        ellipse(xQ1, yQ1, d*0.75, d*0.75);
        // circle quarter-point 2
        ellipse(xQ2, yQ2, d*0.5, d*0.5);
        // circle eighth-point 1
        ellipse(xE1, yE1, d*0.5, d*0.5);
        // circle eighth-point 2
        ellipse(xE2, yE2, d*0.75, d*0.75);
      } 
      else {

        float d = random(30,50);

        // circle mid-point
        ellipse(xM, yM, d, d);
        // circle quarter-point 1
        ellipse(xQ1, yQ1, d*0.75, d*0.75);
        // circle quarter-point 2
        ellipse(xQ2, yQ2, d*0.5, d*0.5);
        // circle eighth-point 1
        ellipse(xE1, yE1, d*0.5, d*0.5);
        // circle eighth-point 2
        ellipse(xE2, yE2, d*0.75, d*0.75);
      }
    }
    counter++;
    
  }
  //save("W3_A2.jpg");
}





