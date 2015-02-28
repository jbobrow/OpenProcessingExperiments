
int [] myArray = {30, 60, 90, 120, 150};
int x = 0 , speedX = 1;
 
void setup()
{
  size(200, 200);
}
void draw()
{
  background(255);
  noStroke();
  fill (0);
  rect(0, 0, 20, height);
  fill (0);
  fill (0);
  rect( width - 20, 0, 20, height);
if (( mouseX > 20 && mouseX < width - 20) && ( mouseY > 20 && mouseY < height - 20))
 {


 }
 
else
  {
    fill( 125, 255, 0);
    ellipse(x +30, myArray[0] , 10, 20);
    fill(101, 206, 0);
    rect(x + 25, myArray[1] , 10, 10);
    fill(76, 155, 20);
    ellipse(x+30, myArray[2] , 20, 20);
    fill(100, 45, 93);
    ellipse(x+30,myArray[3], 15, 15);
    fill(80, 16, 33);
    ellipse(x+30, myArray[4], 10, 10);
    x = x+ speedX;
    if( x > width - 60 || x < 0)
    speedX = speedX * -1;
  }
}
