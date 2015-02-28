
/**
 * Psycho Paint
 *
 * Created by Rene Hangstrup Møller
 *
 * Warming up for the Processing workshop at Open Space Aarhus
 * http://osaa.dk/wiki/index.php/Processingworkshops
 */
 
void setup() {
  size(400, 400);
  smooth();
  background(0);
  colorMode(HSB);
}

void draw() {
  filter(BLUR);
  
  if (mousePressed) {
    filter(DILATE);
  } else {
    filter(ERODE);
  }
  
  stroke(frameCount % 256, 255, 255);
  strokeWeight(10);

  line(pmouseX, pmouseY, mouseX, mouseY);
    
}


