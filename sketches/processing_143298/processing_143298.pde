
float xW = 50;
float direction = 1;
 
void setup(){
  size(600,600);
  background(68,515,52);
  background(308.8,152.75,500.95);
  background(599.25,439.45,0);
  background(308.8,152.75,500.95);
//  noLoop();
}
 
void draw(){
  noStroke();
  fill(#325A7D,10); // adds more transparency
  rect(0,0,width,height);
   
  // grid filled with ellipses
  for (int i = 75; i < width-25; i = i + 50) {
    for (int j = 75; j < height-25; j = j + 50) {
      stroke(0);
      strokeWeight(xW/40);
      noFill();
      rect(i,j,xW,xW);
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

