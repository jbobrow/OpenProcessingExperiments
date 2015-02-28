
void setup()
{
  size(400,400);
  background(0);
}

void draw()
{
  noStroke();
  fill(57,120,183,105);
  ellipse(200,200,200,200);
  
  fill(88,61,255,125);
  translate(width/2, height/2);
for (int i=0;i<360;i+=30){
rotate(radians(30));
quad(50, 50, 30, 15, 70, 60, 20, 60);}
  
  noLoop();
}


