
void setup(){
size(500, 500);
 background(255);
 smooth();
}

void draw(){
  noStroke();
  //ㄱㄱ
  translate(width/2, height/2);
  for (int i=0;i<360;i=i+30){
  rotate(radians(60)); 
  fill(255,135,100,50);
  rect(-38,-85,100,30);
  rect(27,-85,35,85);
  //ㄴ
  fill(110,185,95,50);
  rect(-38,-20,100,20);
  rect(-38,-85,35,85);
 }
}



