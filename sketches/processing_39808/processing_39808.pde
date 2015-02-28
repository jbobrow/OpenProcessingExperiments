
void setup() {
  size(300, 300);
}
//integers for later coordinates
int x1 = 0;
int x2 = 190;
int x3 = 87;
int x4 = 287; 
int x5 = 50;
int x6 = 110;

void draw() {
  background(0);

  strokeWeight(4); //strokewejight for the following batch of rects
  rect(250, x1, 150, x1);// the following rects have coordinates that allow the shapes to grow
  fill(10, 50, 255, 50);
  rect(90, x2, 150, 150);
  fill(240, 50, 255, 50);
  rect(50, x3, 150, x3);
  fill(100, 27, 255, 50);

  strokeWeight(1); //strokewejight for the following batch of rects
  rect(110, x4, 150, 150);
  fill(250, 150, 100, 50);
  rect(190, x5, 150, 150);
  fill(40, 160, 100, 50);
  rect(0, x6, 150, 150);


  strokeWeight(1); //strokewejight for the following batch of rects
  rect(x1, x1, 150, x1);// the following rect's coordinates consist of three integers which creat diagonal movement and grow
  fill(10, 50, 255, 50);
  rect(x2, x2, 150, x2);
  fill(240, 50, 255, 50);
  rect(x3, x3, 150, x3);
  fill(100, 27, 255, 50);

  strokeWeight(4); //strokewejight for the following batch of rects
  rect(x4, x4, x4, 150); // the following rect's coordinates consist of three integers which creat diagonal movement and grow
  fill(250, 150, 100, 50);
  rect(x5, x5, x5, 150);
  fill(40, 160, 100, 50);
  rect(x6, x6, x6, 150);
  fill(40, 160, 100, 50);

  //allows figures to move across screen
  x1++;
  x2++;
  x3++;
  x4++;
  x5++;
  x6++;

  //figures start back at zero once the full height of process is reached
  if (x1 > height) x1 = 0;
  if (x2 > height) x2 = 0;
  if (x3 > height) x3 = 0;
  if (x4 > height) x4 = 0;
  if (x5 > height) x5 = 0;
  if (x6 > height) x6 = 0;
}


