

int numberOfObjects = 600;
int minSize = 5;
int maxSize = 40;

int colorVariationRange = 80;

void setup(){
  size(800, 800);
    background(105, 252, 224);
  
  colorMode(RGB);
  drawThings();
}

void drawThings(){
 
  
   float randomBaseHue = random(0, 255 - colorVariationRange);
   
   background(random(randomBaseHue, randomBaseHue + colorVariationRange), 
    random(randomBaseHue, randomBaseHue + colorVariationRange), 
    random(randomBaseHue, randomBaseHue + colorVariationRange));
  
  for (int i=0; i < numberOfObjects; i = i + 1) {
    fill(random(randomBaseHue, randomBaseHue + colorVariationRange), 
    random(randomBaseHue, randomBaseHue + colorVariationRange), 
    random(randomBaseHue, randomBaseHue + colorVariationRange));
    
    stroke(random(randomBaseHue, randomBaseHue), random(randomBaseHue, randomBaseHue), 
    random(randomBaseHue, randomBaseHue));
    float randomSize = random(minSize, maxSize);
    
    rect(random(randomSize / 8, width - (randomSize/2)), 
    random(randomSize / 3, height - (randomSize/9)), 
    randomSize, randomSize);
  
  }
  
}
void draw(){
  
}

void keyPressed() {
  if (key == ' ') {
    drawThings();
  } 
}


