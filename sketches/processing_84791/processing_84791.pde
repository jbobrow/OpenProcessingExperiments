
void setup()
{
  size(400,400);
  background(255);
}

void draw()
{
  noStroke();
  fill(230,178,92);
  ellipse(200,200,200,200);
  
  fill(204,94,30,125);
  translate(width/2, height/2);
for (int i=0;i<360;i+=30){
rotate(radians(30));
quad(50, 150, 10, 35, 100, 60, 80, 0);}
  
  noLoop();
}


