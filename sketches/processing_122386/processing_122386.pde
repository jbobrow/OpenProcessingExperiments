
size(400,400);
fill(0,0,0);
textSize(40);
text("comienzo:",1,50);
 
 
int x=0;
void setup(){
   noStroke();
   }
void draw(){
   background(111, 240, 79);
   fill(245,111,8);
   ellipse(x, 290, 80, 80);
   x=x+3;
   }
   void setup()
{
  x = 10;
  y = 10;
  x_velocity = 5;
  y_velocity = 5;
  gravity = .04;
  radius = 10;
}
void draw()
{

  y_velocity += gravity;
  x += x_velocity;
  y += y_velocity;
   
  if(y>(height-radius))
  }

      
 
