
int renoT,renoA,renoB;
float reno=0;
float enoT=500;


void setup() {
renoT=500;
renoA=0;
renoB=0;
  size(500, 500,P3D);
  
  background(0, 0, 0);
  ellipse(250, 98, 100, 100);
 
  
  
  rect(185, 150, 130, 130);
   ellipseMode(RADIUS);
  
  
  ellipse(173,95,30,30);
  fill(255,123,52);
  triangle(250,0,190,49,296,49);
  
  
   
  line(184, 159, 149, 250);
  line(316, 150, 346, 250);
  
   noFill();
  fill(255,0,135);
  strokeWeight(10);
  ellipseMode(CENTER);
  ellipse(240,95,30,30);
  noFill();
 
  if (mouseX < 50) {
    cursor(HAND);
  } 
  else {
    cursor(WAIT);
  }
}
void draw() {
  noFill();
  ellipseMode(CENTER);
  ellipse(250, 98, 100, 100);
  rect(185, 150, 130, 130);

 stroke(255,0,05,300);
  rect(renoT, renoA, 130, 130);
  ellipse(renoT,renoA,120,100);
 stroke(255,255,255,200);
  noFill();
 
  
 renoT--;
  renoA++;
  renoB++;
  if (renoT>=height){
    renoT=500;
    
    fill(255,0,255);
    if (renoA>=width){
      renoA=0;
      
      fill(230,0,255);
      //if(renoB>=height){
        renoB=255;
        reno=reno-2;

        
      } 
    }
  }
//}

void mousePressed() {
  if (mouseButton == LEFT) {
    fill(59,232,126);
  } 
  else if (mouseButton == RIGHT) {
    
    fill(240, 221, 7);
  } 
  else {
    fill(126);
  }
} 












