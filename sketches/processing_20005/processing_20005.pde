
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


void keyPressed() {
  if (key == 'a' || key == 'A') {
    columnWidth--;
    makeColumn();
  }
  else if (key == 'd' || key == 'D') {
    columnWidth++;
    makeColumn();
  }
  
  else if (key == 'w' || key == 'W') {
    columnCapitol++;
    makeColumn();
  }
  
  else if (key == 's' || key == 'S') {
    columnCapitol--;
    makeColumn();
  }
  if (key == CODED) {
    if (keyCode == UP) {
      columnHeight++;
      makeColumn();
    } 
    else if (keyCode == DOWN) {
      columnHeight--;
      makeColumn();
    } 
    else if (keyCode == LEFT) {
      columnBase--;
      makeColumn();
    } 
    else if (keyCode == RIGHT) {
      columnBase++;
      makeColumn();
    }
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







