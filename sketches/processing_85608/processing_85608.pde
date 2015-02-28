
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
quad(0, 25, 90, 35, 180, 65, 180, 50);}
  
    fill(157,207,239,125);
for (int i=0;i<360;i+=30){
rotate(radians(30));
quad(20, 0, 90, 75, 50, 60, 60, 50);}

    fill(34,45,128,125);
for (int i=0;i<360;i+=30){
rotate(radians(30));
quad(40, 60, 180, 30, 150, 30, 90, 50);}

  noLoop();
}


