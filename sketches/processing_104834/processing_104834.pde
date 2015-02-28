
void setup() {
  size(600, 600);
  background(255);
}

void draw() {
  background(255);
  noStroke();
  fill(33);
  randomPos(20);
}

void randomPos(int amount) {
  float gutter = (height*width)/30000;
  int amountRow = amount;
  float colorG = 255/amount;
  float sizeX = ((width-gutter*2)/amountRow);
  float sizeY = ((height-gutter*2)/amountRow);
  
  float posX = gutter;
  float posY = gutter;
  
  for (int i=0; i < amountRow; i++) {
    for (int j=0; j < amountRow; j++) {
      translate (j*sizeX, i*sizeY);
      randomRect(posX, posY, sizeX, sizeY, gutter);
      translate(-j*sizeX, -i*sizeY);
    }
  }
}

void randomRect(float posX, float posY, float sizeX, float sizeY, float gutter) {
  float jitter;
  
  beginShape();
  
  jitter = random(gutter*0.2, gutter*0.9);
  vertex(posX+jitter, posY+jitter);
  
  jitter = random(gutter*0.2, gutter*0.9);
  vertex(sizeX+jitter, posY+jitter);
  
  jitter = random(gutter*0.2, gutter*0.9);
  vertex(sizeX+jitter, sizeY+jitter);
  
  jitter = random(gutter*0.2, gutter*0.9);
  vertex(posX+jitter, sizeY+jitter); 
  
  endShape(CLOSE);
}
