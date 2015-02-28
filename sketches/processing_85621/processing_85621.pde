
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
quad(10, 4, 18, 26, 92, 50, 60, 6);}

  fill(255,255,255,125);
for (int i=0;i<360;i+=30){
rotate(radians(30));
quad(26, 20, 86, 112, 8, 26, 40, 45);}

  fill(57,154,255,125);
for (int i=0;i<360;i+=30){
rotate(radians(30));
quad(11, 20, 28, 61, 69, 92, 6, 0);}

  fill(138,25,46,125);
for (int i=0;i<360;i+=30){
rotate(radians(30));
quad(11, 61, 32, 16, 3, 90, 56, 29);}
  
  noLoop();
}


