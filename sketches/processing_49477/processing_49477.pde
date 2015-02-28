
float maxSize = 10;
float minSize = 2;
float currentSize = 2;
void setup(){
  size(800,600);
  background(150);
  fill(#ededde);
  noStroke();
  smooth();
}

void draw(){
  if(mousePressed){
    if(currentSize < maxSize){
      currentSize += 0.2;
    }
    translate(mouseX,mouseY);
      ellipse(random(currentSize) - currentSize*0.5,random(currentSize) - currentSize*0.5, currentSize*2,currentSize*2);
      ellipse(random(currentSize*0.5) - currentSize*0.25,random(currentSize*0.5) - currentSize*0.25, currentSize,currentSize);
      ellipse(random(currentSize * 0.8)- currentSize * 0.4,random(currentSize * 0.8)- currentSize * 0.4, currentSize * 0.8,currentSize * 0.8);
    translate(-mouseX,-mouseY);
  }
}

void mouseReleased(){
  currentSize = minSize;
}
