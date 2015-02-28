
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
  rotate(radians(60)); 
  fill(110,185,95,60);
  rect(-45,-38,100,32);
  rect(-45,-103,35,97);
  noFill();
  fill(115,160,210,60);
  rect(-45,-103,100,32);
  noFill();
 }
}


