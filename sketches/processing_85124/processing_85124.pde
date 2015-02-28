
void setup(){
size(500, 500);
 background(255);
 smooth();
}

void draw(){
  noStroke();
  //ㄱ
  translate(width/2, height/2);
  for (int i=0;i<360;i=i+30){
  rotate(radians(90)); 
  fill(255,135,100,50);
  rect(-35,-70,105,35);
  rect(35,-70,35,105);
  //ㄴ
  fill(110,185,95,50);
  rect(-35,0,105,35);
  rect(-35,-70,35,105);
 }
}



