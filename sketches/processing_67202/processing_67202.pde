
int numCircle = 100;

float [] circleX = new float [numCircle];
float [] circleY = new float [numCircle];
float [] velX = new float [numCircle];
float [] velY = new float [numCircle];

float gravity;


void setup(){
  size(500,500);
  smooth();
  noStroke();
 
  for(int i=0; i<numCircle; i++) {
   circleX[i]  = random(width);
   circleY[i] = random(height);
   velX[i] = random (-5, 5);
   velY[i] = random ( -5,5); 
   
   gravity =0.9;
  }
}




void draw(){
 background(0);
 
 for (int i=0; i< numCircle; i++){
 
 fill(0,0,random(255));
 ellipse(circleX[i],circleY[i], 60,60);
 circleX[i] += velX[i];
 circleY[i] += velY[i];
 

//
//  for (int i=0; i < circleX; i++){
//  fill(mouseY, mouseX,random(255),random(20,100));
//  ellipse(circleX[i], circleY[i], 60,60);
  
  if((circleX[i] < 0) || (circleX[i] > width)) {
    velX[i]*=-1;
  }
   
   if((circleY[i] < 0) || (circleY[i] > height)){
    velY[i]*=-1;
  } 
  }  
 }
 
 


void mouseReleased(){ 
  for (int i=0; i<numCircle;i++){
  circleX[i] = mouseX;
  circleY[i] = mouseY;
  
  velX[i] = random(-5,5);
  velY[i] = random(-3,3);
 }
} 

