
void setup()
{
  size(400,400);
  background(255);
}

void draw()
{
  noStroke();
  fill(0,91,153);
  ellipse(200,200,200,200);
  
  fill(102,183,230,125);
  translate(width/2, height/2);
for (int i=0;i<360;i+=30){
rotate(radians(30));
quad(0, 50, 130, 115, 70, 40, 40, 60);}
  
  noLoop();
}


