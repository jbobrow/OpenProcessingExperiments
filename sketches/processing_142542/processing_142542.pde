
// SOS iDesign
// KU DYNAMIC MEDIA
// David Mrugala

float xW = 50;
float direction = 1;

void setup(){
  size(600,600);
  background(0,45,48);
//  noLoop();
}

void draw(){
  noStroke();
  fill(0,45,48,10); // adds more transparency
  rect(0,0,width,height); 
  
  // grid filled with ellipses
  for (int i = 75; i < width-25; i = i + 50) {
    for (int j = 75; j < height-25; j = j + 50) {
      stroke(255);
      strokeWeight(xW/20);
      noFill();
      ellipse(i,j,xW,xW);
     }
  } 
  
  // counter for the width and height of the ellipse
  xW = xW + direction;
  
  // change of direction once the limit is reached
  if (xW > 100){
      direction = direction * -1;
  }
  if (xW < 1){
      direction = direction * -1;
  } 
}
