
//Name = An yohan
//ID = 201420087

float xW = 140;
float direction = 1;
 
void setup(){
  size(600,600);
  background(0);
//  noLoop();
}
 
void draw(){
  noStroke();
  fill(#325A7D,10); // adds more transparency
  rect(0,0,width,height);
   
  // grid filled with ellipses
  for (int i = 75; i < width-25; i = i + 75) {
    for (int j = 75; j < height-25; j = j + 75) {
      stroke(255);
      strokeWeight(5);
      noFill();
      ellipse(i,j,xW,xW);
     }
  }
   
  // counter for the width and height of the ellipse
  xW = xW + direction;
   
  // change of direction once the limit is reached
  if (xW > 140){
      direction = direction * -1;
  }
  if (xW <140 ){
      direction = direction * -1;
  }
}
