
float c_x=0;       //change start point of left and right.
float c_y=0;       //change start point of up and down.
float move_x=9;    //change speed of left and right.
float move_y=12;   //change speed of up and down.
float ran1;
float ran2;
float speedDecrese=0.85;  //change rate that ball decteses or speeds up.
float r;
float g;
float b;
void setup()
{
  ran1 = random(1,4);
  ran2 = random(.5,4);
  r = random(1,100);
  g = random(1,100);
  b = random(1,100);
 size(400,400,P3D);
}
void draw()
{
  background(r,g,b,50);
  circle_1_move();
  reset();
}
void circle_1_move()
{
   noStroke();
   fill(255,160,5);
   lights();
   pushMatrix();
   popMatrix();
   translate(c_x,c_y,30);
   sphere(20);
   c_x = c_x + move_x;
   c_y = c_y + move_y;
}
void reset()
{
 if(c_x>width)
{
 c_x = width;
 move_x = (-move_x * speedDecrese);
}
if(c_y>height)
{
 c_y = height;
 move_y = (-move_y * speedDecrese);
}
if(c_x < 0)
{
 c_x = 0;
 move_x = (-move_x * speedDecrese);
}
if(c_y < 0)
{
 c_y = 0;
 move_y = (-move_y * speedDecrese);
}
}


