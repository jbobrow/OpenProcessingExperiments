
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
  rotate(radians(51.5));
  fill(255,135,100,50); 
  //ㄱ
  rect(-30,-86,100,34);
  rect(35,-86,35,74);
  noFill();
  //ㄴ
  fill(110,185,95,50);
  rect(-30,-6,100,34);
  rect(-30,-46,35,64);
  noFill();
  fill(115,155,210,50);
  rect(-30,-46,100,34);
  noFill();
 
 }
}


