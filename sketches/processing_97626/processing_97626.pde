
//Bucle
 
int totalElements = 50;
int tamany = 40;
float [] pX = new float [totalElements];
float [] pY = new float [totalElements];
float [] vX = new float [totalElements];
float [] vY = new float [totalElements];
  
void setup() {
size(500,500);


background(241,30,245);

  for (int i=0; i <totalElements; i++){
  
 vX [i] = random (-20,20);
  vY [i] = random (-20,20);
}
}
 
void draw() {
   
background(35,72,250);
for (int i=0; i<=height; i = i+5) {
   
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

fill(250,35,35);
strokeWeight(7);
stroke(57,245,30);
ellipse(pX[i],pY[i],26,25);
}
 
 for(int y=0; y < height; y+=5+tamany) {
 
for(int x=0; x < width;x+=5+tamany) {
strokeWeight(3);
stroke(0);
fill(64,(200),(203), 30);
ellipse(x+8,y+9,tamany,tamany);
 
}
 
}
 
int specialX = 50 - (60 + tamany);
 
int specialY = 20 - (100 + tamany);
 
 for (int i=2; i<=height; i = i+6) { 
  
 } 
}

    



