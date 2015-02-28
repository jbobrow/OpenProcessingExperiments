
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
quad(20, 4, 38, 26, 92, 52, 60, 56);}

  fill(255,255,255,125);
for (int i=0;i<360;i+=30){
rotate(radians(30));
quad(26, 20, 86, 12, 58, 26, 49, 45);}

  fill(57,154,255,125);
for (int i=0;i<360;i+=30){
rotate(radians(30));
quad(16, 20, 28, 68, 69, 92, 56, 50);}

  fill(138,25,46,125);
for (int i=0;i<360;i+=30){
rotate(radians(30));
quad(18, 61, 32, 26, 53, 92, 56, 29);}
  
  noLoop();
}


