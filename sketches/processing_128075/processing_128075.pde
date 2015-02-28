
/**
 This example provides a pretty good simulated cloudy sky.
 
 This is the same code as we used for the noise field, with relatively
 few modifications. I fixed the scale and number of divisions to some
 nice range based on what I wanted to see. I took out the keyboard
 controls (since I had fixed those parameters). Finally, I changed the color
 mode to HSB and used our noise fucntion to vary the sturation instead
 of the color. 
 
 C. Andrews
 2014-01-13
 **/



float scale = 0.008;
float numDivisions = 200;


void setup() {
  size(600, 600);
  noLoop();  
  noStroke();
  colorMode(HSB, 360, 100, 100);
}


void draw() {
  background(255);


  float  w = width / numDivisions;
  float h = height / numDivisions;


  for (int j = 0; j < numDivisions; j++) {
    float y = h*j;

    for (int i = 0; i < numDivisions; i++) {
      float x = w*i;

      fill(220, noise(x*scale, y*scale)*100, 100);
      rect(x, y, w+.5, h+.5);
    }
  }
}




