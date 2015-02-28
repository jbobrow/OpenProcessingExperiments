
int[] pointContainerx = new int[10]; 
int[] pointContainery = new int[10];
float x1, y1;
int startcounter = 0;
float greyBalls = random(255);

void setup() {
 size(400,400);
 frameRate(24);
 smooth();
 strokeWeight(3);
}

void draw() {
 if (startcounter<10){
  x1 = random(10, (width-10));
  y1 = random(50, (height-50));
  fill(0,0,0);
  noStroke();
  ellipse(x1, y1, 20, 20);
  fill(greyBalls);
  //noStroke();
  ellipse(x1, y1, 18, 18);
  pointContainerx[startcounter] = x1;
  pointContainery[startcounter] = y1;
 }else if(startcounter>9 && startcounter<20) {
  float greyLine = random(255);
  stroke(greyLine, 140);
  for (int i=startcounter-10; i<10; i++){
   line(pointContainerx[startcounter-10], pointContainery[startcounter-10], pointContainerx[i], pointContainery[i]);
  }
 }else if(startcounter<25){
  background(255, 30);
  greyBalls = random(255);
 }else{
  startcounter = -1;
 }
 startcounter += 1;
}
