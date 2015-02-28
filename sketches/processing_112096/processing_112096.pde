
PImage cup;

void setup() {
  size(400, 400);
  cup = loadImage("coffeCup.png");
  //noLoop();
  smooth();
}

void draw() {

  //background
  int stripe = width/10;
  int padding = 5;
  for (int i=0;i<12;i++) {
    noStroke();

    float fillRed = random(180, 220);
    float fillGreen = random (110, 130);
    float fillBlue = random(10, 40);
    fill(fillRed, fillGreen, fillBlue);
    rect(i*stripe + padding, 0, (i+padding)*stripe+padding, height);

    fill(225, 210, 170);
    ellipse(height/2, width/2, 320, 320);
    
    float h = map(hour(), 0, 24, 0, width);
    float m = map(minute(), 0, 60, 0, width);
    float s = map(second(), 0, 60, 0, width);
    stroke(255);
    line(100, height-40, 90,height-h-40);
    //ellipse(20,height-40-m,5,5);
    line(100, height-40, 100, height-m-40);
    line(105, height-40, 110, height-s-40);
    float randSmoke = random(85, 110);
    fill(255);
    image(cup, 60, height-100);
    text("How badly do YOU need coffee?", (width/2)-59, height/2);

    float smokeHeight = map(second(), 0, 60, 0, height);
  }
}





