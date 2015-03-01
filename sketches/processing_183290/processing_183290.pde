
int cx;
int cy;
int sx;
int sy;
int tx;
int ty;
int distance1;
int distance2;

void setup() {
  size(200, 200);
  findCoffee();
  displayGrid();
}

void draw() {
}

void displayGrid() { 
  int y = 20;
  int x = 20;
  //int spacing
  for (int i=20; i<200; i =i+20) { 
    line(i, 0, i, height);
    line(0, i, width, i);
  }
}
void findCoffee()
{
  background(200);
  displayGrid();
  
  cx = int(random(1, 10));
  cx *=20;  
  cy= int(random(1, 10)); 
  cy *=20;
  sx= int(random(1, 10)); 
  sx *=20;
  sy= int(random(1, 10)); 
  sy *=20;
  tx= int(random(1, 10)); 
  tx *=20;
  ty= int(random(1, 10)); 
  ty *=20;
  cityBlockDistance();  //calculating distance
  rectMode(CENTER);
  ellipseMode(CENTER);
    if (distance2<distance1) {
    fill(0, 0, 255);
  } else {
    fill(255);
  }
  rect(sx, sy, 10, 10);
  if (distance1<distance2) {
    fill(0, 0, 255);
  } else {
    fill(255);
  }
  ellipse(cx, cy, 10, 10);
  fill(0, 128, 0);
  triangle(tx-5, ty+5, tx, ty-5, tx+5, ty+5);
}
void cityBlockDistance() {
  distance1 = abs(tx-cx)+abs(ty-cy);
  distance2 = abs(tx-sx)+abs(ty-sy);
}
void mousePressed(){
  findCoffee();
}



