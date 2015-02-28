
//La Tour Eiffel
//Photo Credit Miles Thomas 2009
//Sketch by Miles Thomas, October 2nd 2011

int pix = 10000;
float [] x = new float[pix];
float [] y = new float[pix];
PImage eiffel; //sets up eiffel image

void setup() {
  size(300, 400);
  eiffel = loadImage("eiffel3.jpg"); //loads eiffel image into sketch
  stroke(50, 50, 200); //purplish/blue points

  //sets up array
  for (int r = 0; r < pix; r++) {
    x[r] = random(width);
    y[r] = random(height);
  }
}

void draw() {
  background(0); //black background to highlight color
  for (int r = 0; r < pix; r++) {
    color c = eiffel.get(int(x[r]), int(y[r]));  
    float b = brightness(c) / 200.0;          
    float speed = pow(b, 2) + .01; //speed as a percentage of brightness
    x[r] += speed; 

    //restarts sketch    
    if (x[r] > width) {
      x[r] = 0;
      y[r] = random(height);
    }
    point(x[r], y[r]); //loads points for array
  }
}  


