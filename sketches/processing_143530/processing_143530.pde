
/*
 Konkuk University
 SOS iDesign
 
Name:Lim Hyun Seung
 ID: 201420104 Lim Hyun Seung
 
*/


float xW = 50;
float direction = 5;
 
void setup(){
  size(600,600);
  background(255);
    frameRate(20);
}
 
void draw(){
  noStroke();
  fill(#325A7D,10);
  rect(2,0,width+X,height-Y);
   
  //RECT
  for (int i = 25; i < width-25; i = i + 50) {
    for (int j = 25; j < height-25; j = j + 50) {
      stroke(255);
      strokeWeight(xW/50);
      noFill();
      rect(i-20,j-20,xW,xW);
     }
  }
  
  //RECT
  for (int i = 85; i < width+0; i = i + 100) {
    for (int j = 85; j < height+0; j = j + 150) {
      stroke(255);
      strokeWeight(xW/20);
      fill(0, 211, 255, 10);
      ellipse(i-20,j-20,xW,xW);
     }
  }
   
   
  xW = xW + direction;
  if (xW > 100){
      direction = direction * -1;
  }
  if (xW < 2){
      direction = direction * -1;
        noLoop();
  }
}
