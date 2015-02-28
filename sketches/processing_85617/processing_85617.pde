
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
quad(0, 94, 19, 30, 79, 62, 70, 36);}

  fill(255,255,255,125);
for (int i=0;i<360;i+=30){
rotate(radians(30));
quad(20, 60, 0, 45, 48, 68, 44, 49);}

  fill(57,154,255,125);
for (int i=0;i<360;i+=30){
rotate(radians(30));
quad(0, 30, 84, 30, 187, 67, 67, 20);}

  fill(138,25,46,125);
for (int i=0;i<360;i+=30){
rotate(radians(30));
quad(18, 36, 64, 25, 63, 18, 9, 94);}
  
  noLoop();
}


