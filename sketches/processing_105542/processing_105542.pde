
int numCircle = 20;
 
float [] circleX = new float [numCircle];
float [] circleY = new float [numCircle];
 
float [] speedX = new float [numCircle];
float [] speedY = new float [numCircle];
 

void setup() {
size(200, 200);
smooth();

 
 
  for (int i = 0; i < numCircle; i++) {
    circleX[i] = random(width);
    circleY[i] = random(height);
 
    speedX[i] = random (-2, 10);
    speedY[i] = random (-2, 10);
}
}
  
void draw() {
 
background (0);
fill(50,256,70,200);
 
 
for (int i= 0; i<numCircle; i++) {
if(mousePressed == true)
circleX[i]= circleX [i] + speedX[i];
circleY[i]= circleY [i] + speedY[i];
 
if(circleX[i] >= width) {
speedX[i] = speedX[i] *-1;
}
 
if(circleY[i] >=height) {
speedY[i] = speedY[i] *-1;
}
 
if(circleX[i] <= 0) {
speedX[i] = speedX[i] *-1;
}
 
if(circleY[i] <= 0) {
speedY[i] = speedY[i] *-1;
}
 
ellipse(circleX[i],circleY[i], i+1, i+1);
}
}
