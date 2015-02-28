
float[] wave = new float[80];
int inc = 0;
int originX = 0;
int originY = 0;
int offset = 100;
boolean running = false;

void setup() {
  size(800, 400);
  background(0);
  noStroke();
  smooth();
  textSize(30);
    
  for (int i = 0; i < 80; i++) {
    float sine = sin(i/2);
    wave[i] = map(sine, -TWO_PI, TWO_PI, 255.0, 0.0);
  }
  
}

void draw() {
  fill(0, 10);
  rect(0, 0, width, height);
  
  if (running == true) {
    pushMatrix();
    translate(originX, originY);
    
    fill(0);
    text("slits are " + offset * 2 + " pixels apart", width / 2 - originX, height - originY);
    
    // draw waves
    fill(255, 255, 100, wave[inc] - inc * 3);
    
    rect(inc * 10 - offset, 0 - originY, 10, height);
    rect(-offset - (inc * 10), 0 - originY, 10, height);
    
    rect(inc * 10 + offset, 0 - originY, 10, height);
    rect(offset - (inc * 10), 0 - originY, 10, height);
    
    // draw particle
    rect(-5, -10, 20, 20);

    
    inc = ((inc + 1) % 80);
    if (inc == 0) running = false;
    popMatrix();
  }
  
  else {
    fill(255);
    textAlign(CENTER, CENTER);
    text("click to fire a photon", width / 2, height / 2);
    textAlign(CENTER, BOTTOM);
  }
  
}

void mouseClicked() {
  if (running == false) {
    originX = mouseX;
    originY = mouseY;
    offset = int(map(mouseY, 0, 400, 0, 250));
    running = true;
  }
}
    

