
float gravity = 0.1;  
int numCircle = 100;   
float[] circleX = new float [numCircle];
float [] circleY = new float [numCircle];
float [] diameter = new float [numCircle];
float[] speed = new float [numCircle]; 
boolean fall; 


// now let's go into our setup loop

void setup() {
  size(500, 500); // declare the size of your sketch
  smooth(); // use smooth so that your circles are anti-aliased, i.e. not pixely
  noStroke(); // let's leave the stroke off. Comment this out to see it with stroke
  colorMode(RGB, 256); // optional: declare color mode (RGB, HSV, etc.) and the range
  fall = false;

  for (int i = 0; i < numCircle; i++) { // the first item in an array is 0--it is 0 dist from the start
    circleX[i] = random(width); 
    circleY[i] = random(height);
    diameter[i] = random(20, 50);
    speed[i] = 0;
  }
}


// now let's draw 'em.

void draw() {
  background(0, 0, 220); // background color
  fill(150, 0, 200, 200); // color to fill circles with. fourth value is alpha

  println(speed);

  if (fall == true) {
    // If balls reach the bottom
    //Reverse speed
    for (int i = 0; i <numCircle; i++) {
      circleY[i] = circleY[i]+ speed[i];
      speed[i] = speed[i] + gravity;
      if (circleY[i] > height) {
        // Multiplying by -0.95 instead of -1 slows the square down each time it bounces (by decreasing speed).  
        // This is known as a "dampening" effect and is a more realistic simulation of the real world (without it, a ball would bounce forever).
        speed[i] = speed[i] * -0.95;
      }
    }
  }

  for (int i = 0; i < numCircle; i++) {
    //fill(255, i*30, 180, 200); // color to fill circles with. fourth value is alpha
    ellipse(circleX[i], circleY[i], diameter[i], diameter[i]);
  }
}  

void mouseClicked () {
  fall = true;
}
