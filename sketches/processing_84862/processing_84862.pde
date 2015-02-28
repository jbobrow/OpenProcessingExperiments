
void setup()
{
size(500, 500);
 background(255);
 smooth();
}

void draw(){
  noStroke();
 
  translate(width/2, height/2);
  
 for (int i=0;i<360;i=i+30){
  rotate(radians(72));
  fill(255,135,100,50); 
  //ㄱ
  rect(-30,-85,100,35);
  rect(35,-85,35,75);
  noFill();
  //ㄴ
  fill(110,185,95,50);
  rect(-30,-5,100,35);
  rect(-30,-45,35,65);
  noFill();
  fill(115,155,210,50);
  rect(-30,-45,100,35);
  noFill();
 
 }
}


