


/**
 *thanks to the Noise1D exemple. 
 
 */

float xoff = 0.0;
float xincrement = 0.005; 
float n=0;
void setup() {
  size(220, 220);

  background(0);

  smooth();
}

void draw()
{
  noStroke();
  fill(0, 3);
  rect(0, 0, width, height);


  strokeJoin(BEVEL);
  strokeWeight(2); 

  beginShape(LINES);
 for (int i=0; i<width; i+=2) {  

    // Get a noise value based on xoff and scale it according to the window's height
    n = noise(xoff)*(1.5 *height);
 // With each cycle, increment xoff
    xoff += xincrement;
    //randomize shape color
    stroke(random(0, 255), 0, random(0, 255));
    //point(i,n);
    vertex(i, n);
  }

  endShape();
}


