
float theta = 0.0;
PImage imgDay;
PImage imgNight;
void setup() {
  size(700,394);
  smooth();
  imgDay = loadImage("worldDay.png");
}

void draw() {
  background(0);
  image(imgDay,0,0);
 
   // Increment theta (try different values for " angular velocity " here)
  theta += 0.02;
  noStroke();
  fill(255);
  float x = theta;
  
   // A for loop is used to draw all the points along a sine wave (scaled to the pixel dimension of the window).
  for (int i = 0; i <= 70; i++) {
    // Calculate y value based off of sine function
    float y = sin(x)*height/2;
    // Draw an ellipse
    ellipse(i*10,y + height/2,8,8);
    // Move along x-axis
    x += 0.2;
    //imgNight = loadImage("worldNight.png");
    //image(imgNight,0,.8);
  }
}






//images[0] = loadImage("worldStart");


