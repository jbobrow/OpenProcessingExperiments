
int numLines = 12;

float[] x = new float[numLines];

float[] speed = new float[numLines];

float offset =25; // Set space between lines



void setup() {

  size(500, 500);

  smooth();

  strokeWeight(2);

  for (int i = 0; i < numLines; i++) {

     // Set initial position

    speed[i] = 0.8 + (i / offset); // Set initial speed

  }

}



void draw() {

  background(204);
  

  for (int i = 0; i < x.length; i++) {

    x[i] += speed[i]; // Update line position

    if (x[i] > (width/2 + offset)) { // If off the right,

      x[i] = -offset * 3; // return to the left

    }

    float y = i * offset; // Set y-coordinate for line
    fill(255,0,0,50);
    rect(x[i], y, x[i] + offset, y + offset); // Draw line
   fill(0,255,0,30);
        ellipse(x[i], y, x[i] + offset, y + offset);
}
}

