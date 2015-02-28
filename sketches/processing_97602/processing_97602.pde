

int totalElements = 50;
  
float [] pX = new float [totalElements];
float [] pY = new float [totalElements];
float [] vX = new float [totalElements];
float [] vY = new float [totalElements];
  
void setup() {
size(400,400);
stroke(95,51,18);
  for (int i=0; i <totalElements; i++){
  pX [i] = random (height);
  pY [i] = random (width);
  vX [i] = random (-10,10);
  vY [i] = random (-10,10);
  }
}
 
 
void draw() {
   
background(210,253,12);
for (int i=2; i<=height; i = i+6) {
  
  line(width,height,0,i);
  line(width,height,i,0);
  line(width,height,width,i);
  line(width,height,i,height);
 }
for (int i=4; i<totalElements; i++){
      
 pX [i] = pX [i] + vX[i];
 pY [i] = pY [i] + vY[i];
        
 if (pX [i] < 0 ||pX [i] > width)  {
 vX [i] = -vX [i];
 }        
 if (pY [i] < 0 ||pY [i] > height)  {
 vY [i] = -vY [i];        
 } 

fill(202,22,0);
ellipse(pX[i],pY[i],20,20);
}
 
}
void mousePressed(){
    for (int i=3; i < totalElements; i++) {
    pX[i] = mouseX;
    pY[i] = mouseY;
    vX[i] = mouseX*0.1 + random(-1,1);
    vY[i] = mouseY*0.1 + random(-1,1);
    }
  
}


