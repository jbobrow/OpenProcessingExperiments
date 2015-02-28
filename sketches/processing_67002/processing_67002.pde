
int numCircle = 35;
 
float[] circleX = new float [numCircle];
float[] circleY = new float [numCircle];
float[] velX = new float [numCircle];
float[] velY = new float [numCircle];
 
void setup() {
  size(500,500);
  smooth();
  noStroke();
   
  for (int i=0; i < numCircle; i++) {
   circleX[i] = random(width);
   circleY[i] = random(height);
   println("X = " + circleX[i] + "Y = " + circleY[i]);
   velX[i] = random(i);
   velY[i] = random(i);
  }
  
}
 
void draw(){
 background(25,25,0);
 
 for (int i = 0; i < numCircle; i++) {
  fill(255,i*20,i*30,85);
    ellipse(circleX[i], circleY[i], i+20, i+20);
 
 circleY[i] += velY[i];
 circleX[i] += velX[i];

if ((circleY[i] < 0) || (circleY[i] > height)) {
    velY[i]*=-1;
  }  
   
if ((circleX[i] < 0) || (circleX [i] > width)) {
    velX[i]*=-1;
  }
    

     
       
 }
}


