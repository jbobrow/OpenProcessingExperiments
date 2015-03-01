
int count=0;
float startX=0;
float startY=0;
float currentX=0;
float currentY=0;

void setup() {
  size(400, 400);

  currentX= width/2;
  currentY= height/2;

  startX=width/2;
  startY=height/2;
  noStroke();
  background(255);
  smooth();
}

void draw() {
  fill(255, 0, 0, 100);
  ellipse( startX, startY, 4, 4); 
  
  if (count++ < 1000) {
    noStroke();
    fill(200, 200, 200, 30);
    ellipse( currentX, currentY, 4, 4);
    currentX+=random(-2, 2);
    currentY+=random(-2, 2);
  }
  else {
    stroke(255, 0, 0, 180);
    line(currentX, currentY, startX, startY);
    fill(255, 0, 0, 100);
    ellipse( startX, startY, 4, 4); 
    text("distance = [" + dist(currentX, currentY, startX, startY) + "]", 50, 50);
  }
}
void keyPressed() {
  count=0;
  background(255);
  currentX= width/2;
  currentY= height/2;

  startX=width/2;
  startY=height/2;
  noStroke();

}

