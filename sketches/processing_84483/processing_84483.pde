
void setup()
{
size(500, 500);
background(255,240,160);
 smooth();
}

void draw(){
  noStroke();
  fill(155,180,200,50);
  translate(width/2, height/2);
  for (int i=0;i<360;i=i+30){
  rotate(radians(45)); 
  arc(0,5,150,60,0,PI/3);
 }
 
}


