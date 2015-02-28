
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
quad(10, 45, 0, 135, 80, 65, 80, 40);}
  
    fill(157,207,239,125);
for (int i=0;i<360;i+=30){
rotate(radians(30));
quad(20, 20, 70, 75, 50, 0, 160, 80);}

    fill(34,45,128,125);
for (int i=0;i<360;i+=30){
rotate(radians(30));
quad(40, 60, 110, 30, 50, 130, 90, 50);}

  noLoop();
}


