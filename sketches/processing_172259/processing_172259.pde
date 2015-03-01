

void setup() {
  size(500, 500);
  noStroke();
  smooth();
  colorMode(HSB,360,100,100);
}

void draw() {
  

  float  x1 = map(mouseX, 0, width, 0, 500);
  float mood = map(mouseX, 0,width,0,100);
  float happy = random(0,360);
  
  background(360,0,mood);

  ellipse(x1, 25, 50, 50);  
  ellipse(x1, 75, 50, 50);
  ellipse(x1, 125, 50, 50);
  ellipse(x1, 175, 50, 50);
  ellipse(x1, 225, 50, 50);
  ellipse(x1, 275, 50, 50);
  ellipse(x1, 325, 50, 50);
  ellipse(x1, 375, 50, 50);
  ellipse(x1, 425, 50, 50);
  ellipse(x1, 475, 50, 50);
  
  fill(happy,mood,mood);
  
  
}

