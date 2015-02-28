
int numBubbles = 0;
int mouseCount = 0;
Bubble bubbles[] = new Bubble[50];

void setup(){
  size(500,500);
  frameRate(50);
  smooth();
  background(255);
  strokeWeight(4);
}

class Bubble{
  int initX, initY, initDiameter, count;
  Bubble (int x, int y, int z){
    initX = x;
    initY = y;
    initDiameter = z;
    count = 0;
  }
  void render(){
    int diameter = initDiameter;
    int xPos = initX;
    int yPos = initY;
    int step = diameter/(diameter/3);
    int r = 0;
    int g = 200;
    int b = 255;
    stroke(255);
    for (int i = 0; i < 25; i++){
      fill(r,g,b);
      ellipse(xPos,yPos,diameter,diameter);
      diameter -= step;
      r += 255/25;
      g += 50/25;
      xPos += 1;
      yPos -= 1;
      noStroke();
    }
  }
  
  void erase(){
    fill(255);
    ellipse(initX,initY,initDiameter+1,initDiameter+1);
  }
  
  void grow(){
    erase();
    initDiameter += 5;
    render();
    count++;
  }
  
  void pop(){
    erase();
    for(int i = 0; i < numBubbles; i++){
      if (bubbles[i] != null){
        bubbles[i]= bubbles[i+1];
      }
    }
    numBubbles--;
  }
  
  int getCount(){
    return count;
  }
}

void mouseReleased() {
  int diameter = 150 + int(random(100));
  if (numBubbles <= 50){
    bubbles[numBubbles] = new Bubble(mouseX, mouseY, diameter);
  }
  for(int i = 0; i <= numBubbles; i++){
    bubbles[i].render();
  }
  numBubbles++;
  mouseCount++;
}

void draw(){
  for(int i = 0; i <= numBubbles; i++){
    if (bubbles[i] != null && bubbles[i].getCount() > 50){
      bubbles[i].pop();
    }
  for(int j = 0; j <= numBubbles; j++){
    if (bubbles[j] != null){
      bubbles[j].grow();
    }
  }
}
}
  

