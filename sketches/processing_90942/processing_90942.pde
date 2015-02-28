
int [] intArray = {
  20, 20, 150, 150, 0
};



int x = 20, speedX = 1, a = 150, y = 0, speedY = 1;



void setup()
{
  size(200, 200);
  background(0);
  rect(20, 0, 160, 180);
}

void draw()
{
if (mouseX < 20 || mouseX > 180 || mouseY > 180)
  {
   
  }
  else{
  smooth();
  strokeWeight(5);
  background(0);
  fill(255);
  rect(20, 0, 160, 180);

  intArray[0] = intArray[1] + speedX;
  intArray[1] = intArray[1] + speedX;
  intArray[2] = intArray[2] - speedX;
  intArray[3] = intArray[3] - speedX;
  intArray[4] = intArray[4] - speedY;

  fill(47, 168, 222);
  rect(intArray[0], 20, 30, 30);
  rect(intArray[2], 20, 30, 30);
  ellipse(intArray[1], 100, 20, 20);
  ellipse(intArray[3], 100, 20, 20);
  stroke (26, 226, 234);
  line(100, intArray[4], 100, intArray[4] + 150);

  if (intArray[1]> width - 20 || intArray[1] < 0)
    speedX = speedX * -1;
  if (intArray[4]> height - 150 || intArray[4] < 0)
    speedY = speedY * -1;
}
}
