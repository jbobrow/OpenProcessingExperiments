
//mouse ile tıkla rengin değişsin:)

void setup()
{
  size(400,400);
  frameRate(2);
  background(155);
}
void draw(){
  rect(30,30,random(100),random(100));
}
void mousePressed(){
  fill(random(250),random(8),random(178));
}


