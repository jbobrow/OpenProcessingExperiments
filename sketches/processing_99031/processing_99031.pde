
//Bucle
 
int totalElements = 100;
  
float [] pX = new float [totalElements];
float [] pY = new float [totalElements];
float [] vX = new float [totalElements];
float [] vY = new float [totalElements];
  
void setup() {
size(800,800);
stroke(115,249,252);
  for (int i=0; i <totalElements; i++){
  pX [i] = random (width);
  pY [i] = random (height);
  vX [i] = random (-20,20);
  vY [i] = random (-20,20);
  }
}
 
 
void draw() {
   
background(255,111,255);
for (int i=0; i<=height; i = i+5) {
  
  line(width/2,height/2,0,i);
  line(width/2,height/2,i,0);
  line(width/2,height/2,width,i);
  line(width/2,height/2,i,height);
 }
for (int i=0; i<totalElements; i++){
      
 pX [i] = pX [i] + vX[i];
 pY [i] = pY [i] + vY[i];
        
 if (pX [i] < 0 ||pX [i] > width)  {
 vX [i] = -vX [i];
 }        
 if (pY [i] < 0 ||pY [i] > height)  {
 vY [i] = -vY [i];        
 } 
fill(255,0,255);
  ellipse(pX[i],pX[i],60,60);
  fill(0,255,0);
  ellipse(pX[i],pX[i],21,21);
  fill(255,255,0);
  rect(pX[i],pY[i],13,13);
  fill(0,255,255);
  ellipse(pX[i],pX[i],15,15);
fill(52,232,80);
ellipse(pX[i],pY[i],26,25);
}
 
}



