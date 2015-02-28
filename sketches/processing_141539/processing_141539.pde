
// Use 2D noise to create a simple texture
// adapted from http://processing.org/examples/noise2d.html

float increment = 0.02;
boolean stopped = false;
float detail = .5;

void setup() {
  size(500, 500,P2D);
  colorMode(HSB,height,100,3); // hue varies between 0 and height
  noStroke();  
  noiseSeed((int)millis());
} 

void draw() {
  smooth();  
  if (!stopped) {
   update_background();
  }
}

void update_background() {
  loadPixels();
  float xoff = 0.0;
  detail = map(mouseX,0,width,.3,.9);
  noiseDetail(8,detail);
  for (int x=0;x<width;x++) {
    xoff += increment;
    float yoff = 0.0;
    for (int y=0; y<height;y++) {
      yoff += increment;  
      pixels[x+y*width] = color(mouseY,100,noise(xoff,yoff));
    }
  }
  updatePixels();
}

void keyPressed() {
  switch(key) {
  case ' ':
    setup(); // generate new random noise
    break;
  case 's':  // save pattern
    int m = (int)millis();
    save("pattern"+str(m)+".jpg");
    break;
  default:
    println("unknown key");   
    break;
  }
}

void mousePressed() {
  stopped = !stopped; // toggle
}



