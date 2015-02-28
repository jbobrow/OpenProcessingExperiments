
/* Base code by C.Reas and B.Fry
The image I used for this composition was a picture I took of a shutter panel
in the Arab World Institute in Paris. The institute was designed by architect 
Jean Nouvel.
The image me inspired me to exploit the figure/void relationship established by
the shutters. Each shutter is comprised of many small shutters which create 
small appertures that create an overall pattern in the entire square.
This figure/void relationship inspired me to explore and emphasize this inverse
condition. That is why I spit the composition into a white half and a black 
half with the points crossing over them black and white respectively.
Therefore, although the composition is essentially the same in both halfs, they
are the inverse of each other.*/

PImage pic;

int count = 10000;  //number of points present at one time in the composition
//setting up the array parameters
float[] x = new float[count]; 
float[] y = new float[count]; 

void setup() {
  size(300, 300);
  pic = loadImage("IDMAshutter_inverse.jpg");

  for (int i = 0; i < count; i++) { //seeding array - cordinates of each point
    // are random
    x[i] = random(width); 
    y[i] = random(height);
  }
}

void draw() {
  // makes top half of canvas white
  fill(255);
  rect(0, 0, 300, 150);
  // makes bottom half of canvas black
  fill(0);
  rect(0, 150, 300, 150);

  for (int i = 0; i < count; i++) {
    color c = pic.get(int(x[i]), int(y[i])); // scans image and analyzes colors
    float b = brightness(c) / 255.0; // defining b as the brightness value in 
    // between 0 and 1
    float speed = b + 0.1; // speed of particles is directly related 
    // to the brightness of the pixel being scanned
    x[i] += speed;                            

    if (x[i] > width) {                 // if the particles leave the window
      x[i] = 0;                         // start them over on the left side...
      y[i] = random(height);              // ...at a new, random height
    }
    if (y[i] >= 0 && y[i] <150) { // any point having their y-coordinate in 
      // between 0 and 150 will be black in order to be seen on the white back
      stroke(0);
    } 
    else { // any point having their y-coordinate in between 0 and 150 will 
      // be white in order to be seen on the black background
      stroke(255);
    }

    point(x[i], y[i]);
  }
}


