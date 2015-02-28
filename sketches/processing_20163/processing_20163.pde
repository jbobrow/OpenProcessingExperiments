
import processing.video.*;
Movie algo;

int[] rgb = { // array color variable | 0 = one color, 255 = complete random
  200, 150, 100
}; 
int cv = 60; 

float aNoise = random(400, 800);//creating a random for the size
float bNoise = random(300, 600);

int c = int(aNoise);
int d = int(bNoise);

float fps = 0;


void setup() {
  size(c, d);

  algo = new Movie(this, "algo.mov");
  algo.loop();

  smooth();
}


void draw() {
  float start = millis();
  
  algo.resize(c, d);
  image(algo, 0, 0);
  
  noStroke();
  for (int i = 0; i < 10; i++) {
    customShape( random(rgb[0], rgb[0]+cv), random(rgb[1], rgb[1]+cv),random(rgb[2], rgb[2]+cv) );
  }
  for (int i = 0; i < 3; i++) {
    rgb[i] += 1;
    if ( rgb[i] + cv > 255 )
      rgb[i] = 0;
  }
  float end = millis();
  float elapsed = end - start;
  float current_fps = 1000/elapsed;
  if (abs(current_fps - fps) > 0.5)
  {
    fps = current_fps;
  }
frameRate(fps/random(30));
  
}

//shape, shape, shape
void customShape( float r, float g, float b ) {
  fill( r, g, b );
  beginShape();
  vertex(random(width), random(height));
  vertex(random(width), random(height));
  vertex(random(width), random(height));
  endShape();
}

// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}


