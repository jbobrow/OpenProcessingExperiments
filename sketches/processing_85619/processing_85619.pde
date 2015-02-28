
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
quad(10, 34, 31, 30, 99, 62, 60, 96);}

  fill(255,255,255,125);
for (int i=0;i<360;i+=30){
rotate(radians(30));
quad(20, 10, 30, 13, 48, 96, 49, 46);}

  fill(57,154,255,125);
for (int i=0;i<360;i+=30){
rotate(radians(30));
quad(13, 30, 84, 31, 69, 97, 66, 20);}

  fill(138,25,46,125);
for (int i=0;i<360;i+=30){
rotate(radians(30));
quad(18, 31, 34, 123, 63, 98, 96, 99);}
  
  noLoop();
}


