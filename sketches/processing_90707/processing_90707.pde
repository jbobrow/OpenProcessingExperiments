
void setup(){
  size (800,600);
  smooth();
}

void draw(){
  noStroke();
  background(0);
  for(int yPos = 0; yPos < 800; yPos += 50){
    for(int xPos = 0; xPos < 900; xPos += 50){
      stroke(random(0,255),random(0,255),random(0,255));
      fill(random(0,255),random(0,255),random(0,255));
      rect(xPos,yPos,50,50);
      fill(random(0,255),random(0,255),random(0,255));
      ellipse(xPos,yPos,50,50);
    }
    stroke(0);
    strokeWeight(5);
    strokeJoin(ROUND);
    
   
  }
  delay(0);
}
