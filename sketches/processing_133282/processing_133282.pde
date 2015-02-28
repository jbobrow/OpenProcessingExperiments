

size (800, 400);
background(#210507);

 int resolution = 200;
 float radius = 70;
 float circleX = width * 0.5;
 float circleY = height * 0.5;
  
 beginShape();
 for (int i=0; i<resolution; i=i+1) {
   float waveAngle = map( i, 0, resolution, 0, TWO_PI * 50);
   float waveOffset = sin(waveAngle) * 100;
   
  float angle = map(i, 0, resolution, 0, TWO_PI);
  float circleoffX = cos(angle) * (radius + waveOffset);
  float circleoffY = sin(angle) * (radius + waveOffset);
  float x = circleX + circleoffX;
  float y = circleY + circleoffY;
  fill(#000000, 20);
  stroke(#FFFFFF, 200);
   vertex(x, y);
 }
 endShape(CLOSE);
 
    int resolution3 = 500;
 float radius3 = 30;
 
  beginShape();
 for (int i=0; i<resolution3; i=i+1) {
   float waveAngle = map( i, 0, resolution3, 0, TWO_PI * 10);
   float waveOffset = sin(waveAngle) * 100;
   
  float angle = map(i, 0, resolution3, 0, TWO_PI);
  float circleoffX = cos(angle) * (radius3 + waveOffset);
  float circleoffY = sin(angle) * (radius3 + waveOffset);
  float x = circleX + circleoffX;
  float y = circleY + circleoffY;
  fill(#7E34AD, 50);
  stroke(#FFFFFF, 200);
   ellipse(x, y, 10, 10);
 }
 endShape(CLOSE);
 
 int resolution4 = 500;
 float radius4 = 70;
 
  beginShape();
 for (int i=0; i<resolution4; i=i+1) {
   float waveAngle = map( i, 0, resolution4, 0, TWO_PI * 20);
   float waveOffset = sin(waveAngle) * 100;
   
  float angle = map(i, 0, resolution4, 0, TWO_PI);
  float circleoffX = cos(angle) * (radius4 + waveOffset);
  float circleoffY = sin(angle) * (radius4 + waveOffset);
  float x = circleX + circleoffX;
  float y = circleY + circleoffY;
  fill(#DBCA0D, 100);
  stroke(#DBCA0D, 80);
   line(x, y, 400, 200);
 }
 endShape(CLOSE);
 
int resolution2 = 36;
 float radius2 = 150;
  for (int i=0; i<resolution2; i=i+1) {
  float angle = map(i, 0, resolution2, 0, TWO_PI);
  float circleoffX = cos(angle) * radius2;
  float circleoffY = sin(angle) * radius2;
  float x = circleX + circleoffX;
  float y = circleY + circleoffY;
  noStroke();
  fill(#C9E2EA);
  ellipse( x, y, 4, 4);
   
 }
 
 int resolution1 = 44;
 float radius1 = 170;
  for (int i=0; i<resolution1; i=i+1) {
  float angle = map(i, 0, resolution1, 0, TWO_PI);
  float circleoffX = cos(angle) * radius1;
  float circleoffY = sin(angle) * radius1;
  float x = circleX + circleoffX;
  float y = circleY + circleoffY;
  fill(#C9E2EA);
  ellipse( x, y, 5, 5);
   
 }
 
 
 
 


