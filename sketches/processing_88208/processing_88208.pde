
int renoT,renoA,renoB;
float r=500;
void setup() {
renoT=100;
renoA=130;
renoB=300;
  size(500, 500,P3D);
  
  background(255, 0, 0);
  ellipse(250, 98, 100, 100);
  rect(185, 150, 130, 130);
  strokeWeight(7);    
  line(184, 159, 149, 250);
  line(316, 150, 346, 250);
 
  if (mouseX < 50) {
    cursor(HAND);
  } 
  else {
    cursor(WAIT);
  }
}
void draw() {
  ellipseMode(CENTER);
  ellipse(250, 98, 100, 100);
  rect(185, 150, 130, 130);


  rect(renoT, renoA, 130, 130);
 renoT++;
  renoA++;
  renoB++;
  if (renoT>=height){
    renoT=255;
    fill(255,0,255);
    if (renoA>=width){
      renoA=255;
      fill(230,0,255);
      if(renoB>=height){
        renoB=255;
        r=r+2;
        
      } 
    }
  }
}

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












