
// reference to C.Reas and B.Fry, Processing. page 340 - brightness to control particles
// also to N.Senske for comments

int num = 30000;  //number of particles 
float[] x = new float[num];  //array to store x coordinates
float[] y = new float[num];  //and y coordinates
PImage pict;

void setup() {
  size(300, 300);

  pict = loadImage("7maple.jpg");// pict of my dog

  //seed the arrays 
  for (int i = 0; i < num; i++) {  
    x[i] = random(width);
    y[i] = random(height);
  }
  stroke(random(0,255), random(0,255), random(0,255));//each time sketch is refreshed, a new random color is used in particles
}

void draw() {
  background(255);//white background

  for (int i = 0; i < num; i++) {
    color c = pict.get(int(x[i]), int(y[i]));  // get the color from picture determined by the arrays
    float b = brightness(c) / 200.0;          // set b equal to a fraction from 0-1.0 based on the brightness of that color c
    float speed = pow(b, 2) + 0.08;            // let speed be equal to b squared plus 0.05
    x[i] += speed;                            // move the particles using speed (the current x position + speed = new x position)

    if (x[i] > width) {                       // if the particles leave the window it restarts
      x[i] = 0;                               
      y[i] = random(height);                  // ...at a new, random height
    }

    point(x[i], y[i]);                        // draw the point to the screen
  }
}


