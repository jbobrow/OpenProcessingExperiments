
/*
  Arrays - Ultra Intro
 
 With just one array
 
 */
int number = 10;
int spacing = 65;

float[] rectY = new float[number];
float[] vels = new float[number];
float[] accs = new float[number];
PImage[] cars = new PImage[number];
String[] racers = {
  "car1.png", "car2.png", "car3.png", "car4.png", "car5.png", "car6.png", "car7.png", "car8.png", "car9.png", "car10.png"
};


void setup() {
  size(650, 700);
  frameRate(10);
  smooth();
  noStroke();
  for (int i = 0; i<number; i++) { 
    rectY[i] = 0;
    vels[i] = random(0, 3);
    accs[i] = random(2, 2);
    cars[i] = loadImage(racers[i]);
  
  }
}

void draw() {
  background(0, 22, 255);
  for (int i = 0; i < number; i++) {
    fill(255, i*50, 188);
    accs[i] = random(2, 2);
    vels[i] = vels[i] + accs[i];
    rectY[i] = rectY[i] + vels[i];
    image(cars[i],(i*spacing), rectY[i]);
    
    }
  }


