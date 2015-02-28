
/*
Missoni pattern generator.
Press space key to generate a screenshot.
@author Rafael Rinaldi (rafaelrinaldi.com)
*/
float variation, count, items;
float x, y;
float weight, padding;

void setup() {
  
  size(500, 600);
  background(0);
  smooth();
  noFill();
  
  variation = random(40, 80);
  x = 0;
  y = -variation;
  items = y;
  count = 0;
  weight = random(5, 20);
  padding = 0;
  
  while(y < height + variation) drawLine();
  
}

void draw() {
}

void drawLine() {
  
  x = 0;
  count = 0;
  
  stroke(random(150), random(150), random(150));  
  strokeWeight(weight);
  strokeJoin(MITER);
  beginShape();
  vertex(0, y);
  
  while(x < width) {
    
    if(count % 2 == 0) {
      vertex(x + variation, y + variation);
    } else {
      vertex(x + variation, y);
    }
    
    x += variation;
    
    ++count;
    
  }
  
  endShape();
  
  ++items;
  y = (weight + padding) * items;
}

/*
TODO: User should be able to increase/decrease variation.
*/
void keyPressed() {
  if(keyCode == 32) saveFrame("missoni-####.png");
}

/*
Changes the pattern. (Colors, etc)
*/
void mousePressed() {
  setup();
}

