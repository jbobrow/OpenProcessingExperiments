


int num = 25000;  //number of particles in the scene
float[] x = new float[num];  // make an array to store their x coordinates
float[] y = new float[num];  // and one for their y coordinates
PImage img;

void setup(){
  size(479,720);
  img = loadImage("MattnNat.jpg");

  
  //seed the arrays with random x and y coordinates:
  for (int i = 0; i < num; i++){  
    x[i] = random(width);
    y[i] = random(height);
  }
  stroke(255); 
}

void draw(){
  background(0);

  for (int i = 0; i < num; i++){
    color c = img.get(int(x[i]), int(y[i]));  // get the color from our image at a coordinate determined by the arrays
    float b = brightness(c) / 255.0 ;   // set b equal to a fraction from 0-1.0 based on the brightness of that color c
    float speed = pow(b,1) + 1;    // by adding 1 I've sped up the movement
    x[i] += speed;                            // move the particles using speed (the current x position + speed = new x position)
    stroke(c);
    strokeWeight(5);
    if (x[i] > width) {                       // if the particles leave the window
      x[i] = 0;                               // start them over on the left side...
      y[i] = random(height);                  // ...at a new, random height
    }
    
    point(x[i], y[i]);                        // draw the point to the screen
  }
}

