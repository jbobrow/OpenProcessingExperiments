
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
quad(120, 130, 80, 30, 70, 160, 80, 90);}

  fill(255,255,255,125);
for (int i=0;i<360;i+=30){
rotate(radians(30));
quad(100, 30, 160, 15, 73, 68, 44, 150);}
  
  noLoop();
}


