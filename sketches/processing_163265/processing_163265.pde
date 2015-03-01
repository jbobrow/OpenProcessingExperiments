

int circleSize = 50;
int circleSize2= 30;

void setup() {
  size(500,600);
 }
 
 
  void draw() {
  background(255);
background((random (0, 255)), (random (0, 255)), (random (0, 255)));
 


 for (int i = 0; i <10; i++){
   ellipse(i*70, 0, circleSize, circleSize);
 ellipse(i*65, 100, circleSize, circleSize);
 ellipse(i*70, 200, circleSize, circleSize);
 ellipse(i*65, 300, circleSize, circleSize);
 ellipse(i*70, 400, circleSize, circleSize);
 ellipse(i*65, 500, circleSize, circleSize);
 ellipse(i*70, 600, circleSize, circleSize);
 }
 
  

for( int i=0; i<15; i++){
     ellipse(i*65, 50, circleSize2, circleSize2); 
     ellipse(i*70, 150, circleSize2, circleSize2);
     ellipse(i*65, 250, circleSize2, circleSize2);
     ellipse(i*70, 350, circleSize2, circleSize2);
     ellipse(i*65, 450, circleSize2, circleSize2);
     ellipse(i*70, 550, circleSize2, circleSize2);

 
  if (mousePressed){
  circleSize = 30;
}
  else {
    circleSize=60;
  }
  
    if (mousePressed){
   circleSize2 = 60; 
 }
   else  {
     circleSize2= 30;
   }

 }
  } 
 

 
  
  
 
 
  
 
  
  
  
  
  
  




