
void setup() {
//  noLoop();
  size(700,700, P2D);
}

void makeLine(float noiseAmount, float noiseSpeed) {
  float start_x = random(mouseX);
  float start_y = random(mouseY);
  float end_x = random(width); 
  float end_y = random(height);
  
  end_x = end_x + noise(end_x, end_y, frameCount*0.005*noiseSpeed)*40*noiseAmount;
  end_y = end_y + noise(end_x, end_y, frameCount*0.001)*40*noiseAmount;
  start_x = start_x + noise(end_x, end_y, frameCount*0.003*noiseSpeed)*40*noiseAmount;
  start_y = start_y + noise(end_x, end_y, frameCount*0.004*noiseSpeed)*40*noiseAmount;
  line(start_x, start_y, end_x, end_y);
}

void draw() {
  background(0,0,0);
  randomSeed(0);
   
  int counter = 0;
  int desiredNumberOfLines = 4000;
  while (counter < desiredNumberOfLines)
  {
    strokeWeight(1);
    int red = 155 + (int) random(100);
    int green = 80;// + (int) (sin(frameCount*0.01) * 170);
    int blue = red/4;
    int alpha = 50;
    if (counter % 80 == 0) {
      red = (int) random(40);
      green = (int) random(20);
      blue =  (int) random(20);
      alpha = 50 + (int) random(60);
      strokeWeight(1.7);
    }
    if (counter % 130 == 0) {
      red = 200 + (int) random(frameCount % 55 + 1);
      green = 160 + (int) random(80);
      blue = (int) random(20);
      strokeWeight(1.);
    }
    stroke(red, green, blue, alpha); 
    
    float r = random(1.2);
    float noiseAmount = r * r;
    makeLine(noiseAmount, random(0.05));
    counter = counter + 1;
  }
}


