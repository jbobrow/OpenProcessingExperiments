
void setup() {
  size(400,400);
  makeColumn();
}

float columnCapitolWidth = 75;
float columnCapitol = 50;
float columnHeight = 200;
float columnBase = 50;
float baseProportion = 0.5;
float columnWidth = columnBase * baseProportion;

void draw() {
}


void mouseDragged() {
  if (mouseButton == LEFT) {
    columnWidth = columnWidth + (mouseX-pmouseX);
    columnHeight = columnHeight + (mouseY-pmouseY);
    makeColumn();
  } 
  else  if (mouseButton == RIGHT) {
    columnBase = columnBase + (mouseX-pmouseX);
    columnHeight = columnHeight + (mouseY-pmouseY);
    makeColumn();
  }
}

void makeColumn() {
  background(255);
  beginShape();
  vertex(width/2 - columnBase, height-50);
  vertex(width/2 - columnBase * baseProportion, height-100);
  vertex(width/2 + columnBase * baseProportion, height-100);
  vertex(width/2 + columnBase, height-50);
  vertex(width/2 - columnBase, height-50);
  endShape();
  beginShape();
  vertex(width/2 - columnWidth, height-100-columnHeight);
  vertex(width/2 + columnWidth, height-100-columnHeight);
  vertex(width/2 + columnBase * baseProportion, height-100);
  vertex(width/2 - columnBase * baseProportion, height-100);
  vertex(width/2 - columnWidth, height-100-columnHeight);
  endShape();
  beginShape();
  vertex(width/2 - columnWidth, height-100-columnHeight);
  vertex(width/2 - columnWidth / baseProportion, height-100-columnHeight-columnCapitol);
  vertex(width/2 + columnWidth / baseProportion, height-100-columnHeight-columnCapitol);
  vertex(width/2 + columnWidth, height-100-columnHeight);
  vertex(width/2 - columnWidth, height-100-columnHeight);
  endShape();
}






