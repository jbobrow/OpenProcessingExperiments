
Random generator;

void setup() {
 size(800,400);
 background(0);
 frameRate(30);
  
 colorMode(HSB);
 
 generator = new Random();
 stroke(255);
 line(width/2, 0, width/2, height);
 
 noStroke();
 textSize(12);
 
  fill(255);
  text("Random distribution", width/2 + 5, height - 5);
  text("Gaussian distribution", 5, height - 5);
}

void draw() {
  float sd = 40; // scatter
  float mean = width/4; // midpoint
  float hueSd = 45;
  float hueMean = 255/2;
  float clr = hueSd * generator.nextGaussian() + hueMean;
  if(clr < 0) clr = 0;
  if(clr > 255) clr = 255;
  float pos = sd * generator.nextGaussian() + mean;
  float pos2 = sd * generator.nextGaussian() + mean;
  fill(clr, 200, 255, 25);
  ellipse(pos, pos2, 25, 25);
  
  // ----------------
  
  
  float posx = random(width/2 + (25/2), width);
  float posy = random(0, height);
  fill(random(0,255), 200, 255, 25);
  ellipse(posx, posy, 25, 25);
}


