
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
quad(10, 5, 0, 35, 80, 115, 0, 40);}
  
    fill(157,207,239,125);
for (int i=0;i<360;i+=30){
rotate(radians(30));
quad(20, 0, 10, 75, 50, 60, 10, 80);}

    fill(34,45,128,125);
for (int i=0;i<360;i+=30){
rotate(radians(30));
quad(0, 60, 60, 60, 50, 0, 90, 110);}

  noLoop();
}


