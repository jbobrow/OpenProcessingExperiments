
float columnPosition = 300;
float rowPosition = 300;
float timer = 0.0;
float hue = 0.0;
float saturation = random(50, 100);
float brightness = random(50, 100);
float confetti = random(20, 40);
float timerAcceleration = 0.0167;
float ellipseSize = 30;
float shadowMode = 0.0;

void setup() {
 size(600, 600);
 background(255);
 colorMode(HSB, 360, 100, 100, 100);
 frameRate(60);
 rectMode(CENTER);
 ellipseMode(CENTER);
 noStroke();
}

// Causes left-clicking to randomly change the color, and right clicking to stop or instantly clock out the timer
void mousePressed() {
  if (mouseButton == LEFT) {
    ellipseSize += 30;
    if (ellipseSize >= 120) {
      ellipseSize = 30;
    }
  }
  if (mouseButton == RIGHT) {
      timerAcceleration = 0.0;
  }
}
void mouseReleased() {
  if (mouseButton == RIGHT) {
    timer = 1.1;
    timerAcceleration = 0.0167;
  }
}

void draw() {
  saturation = 100;
  brightness = random(70, 100);

  if (shadowMode > 10.0) {
  saturation = 0;
  brightness = random(0, 50);
  }
  if (shadowMode > 20.0) {
  saturation = random(0, 100);
  brightness = random(0, 100);
  }
  if (shadowMode > 30.0) {
    shadowMode = 0.0;
  }
  
  fill(360 - hue, saturation, brightness, 100);
  ellipse(mouseX, mouseY, ellipseSize, ellipseSize);
  
  // Every second, a new row and column begin.
  if (timer >= 1.0) {
    shadowMode += 1.0;
    columnPosition = random(0, 600);
    rowPosition = random(0, 600);
    hue += 30;
    confetti = random(20, 40);
    if (hue >= 360) {
      hue = 0;
    }
    timer = 0.0;
  }
  
  // Draw shapes in randomly-colored rows and columns across the screen
  shapeStorm(hue, columnPosition, rowPosition, saturation, brightness);
  // Drop confetti in random positions on the screen
  confettiRumble(hue, confetti, saturation, brightness);
  
  // Ticks the timer
  timer += timerAcceleration;
 }

void shapeStorm(float colour, float column, float row, float saturationYo, float brightnessYo) {
    for (int i=0; i<20; i++) {
    fill(colour, saturationYo, brightnessYo, random(50, 100));
    ellipse(column, random(0, width), random(30, 60), random(30, 60));
    ellipse(random(0, height), row, random(30, 60), random(30, 60));
  }
}

void confettiRumble(float colour, float confettiYo, float saturationYo, float brightnessYo) {
    for (int i=0; i<3; i++) {
    fill(colour, saturationYo, brightnessYo, 100);
    rotate(random(0, TWO_PI));
    rect(random(600), random(600), confettiYo, confettiYo);
  }
}


