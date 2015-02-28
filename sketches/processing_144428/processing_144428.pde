
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: KIM sunguk
// ID: 201420068 KIM sunguk

float xW = 100;
float direction = 1;
  
void setup(){
  size(600,600);
  background(#B6FF00);
noLoop();
}
  
void draw(){
  noStroke();
  fill(#D8FF00,10);
  rect(0,0,width,height);
    

  for (int i = 20; i < width-0; i = i + 75) {
    for (int j = 20; j < height-0; j = j + 75) {
      stroke(#0057FF);
      strokeWeight(4);
      noFill();
      rect(i,j,xW,xW);
      ellipse(i,j,xW,xW);
     }
  }

   
  xW = xW + direction;
    
  if (xW > 140){
      direction = direction * -1;
  }
  if (xW <140 ){
      direction = direction * -1;
  }
}



