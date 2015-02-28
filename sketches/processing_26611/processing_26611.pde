
float tileCount = 20;
float r = random(50);
int actRandomSeed = 0;


void setup(){
  size(600, 600);
  stroke(255);
}

void draw() {


  translate(width/tileCount/2, height/tileCount/2);

  background(0);
  smooth();
  fill(0);
  
  randomSeed(actRandomSeed);

  strokeWeight(mouseY/100);

  for (int gridY=0; gridY<tileCount; gridY++) {
    for (int gridX=0; gridX<tileCount; gridX++) {

      float posX = width/tileCount * gridX;
      float posY = height/tileCount * gridY;

      float shiftX = random(-mouseX, mouseX)/20;
      float shiftY = random(-mouseX, mouseX)/20;

      ellipse(posX+shiftX, posY+shiftY, mouseY/50, mouseY/50);
    }
  }
}


