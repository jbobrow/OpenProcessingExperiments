
int steps = 1;              // How many sinewaves are added
int whichWave = 0;          // 0: Square, 1: Saw
String formula = "sin(x)";  // Just to show the formula
long timer = 0;
long timing = 300;

void setup() {
  size(600, 200);
}

void draw() {
  background(100);
  
  // Draw wave
  noFill(); stroke(255); strokeWeight(2);
  beginShape();
  for(int x = 0; x < width; x++) {  // For each horizontal pixel,
    float y = height * 0.5;         // Default Y value 
    for(int i = whichWave; i < steps*2+whichWave; i += 2) {
      // Add "sin(odd number * x)/odd number" or with even numbers according to which wave it's gonna make
      // Odd numbers get square wave, even numbers get saw wave 
      y += sin(x*0.042*(i+1))*40/(i+1);
    }
    vertex(x, y);
  }
  endShape();
  
  // Show text
  fill(255); textSize(24); text(steps, 4, 30);
  fill(255, 100); textSize(10); text(formula, 35, 10, width-40, height-20);
  
  if(millis() - timer > timing) {
    // If timer hits, increment a step and add text
    if(steps < 150) formula += " + sin(" + (steps*2+whichWave+1) + "x)/" + (steps*2+whichWave+1);
    steps++;
    timer = millis();
  }
}

void mousePressed() {
  // If mouse is pressed, change the mode
  steps = 1;
  whichWave = whichWave == 0 ? 1 : 0;
  formula = whichWave == 0 ? "sin(x)" : "sin(2x)/2";
}
