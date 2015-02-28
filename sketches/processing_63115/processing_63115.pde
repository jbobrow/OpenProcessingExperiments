
size(500, 500);
smooth();
noFill();
background(255);

int xPos = 250;
int yPos = 250;

strokeWeight(2);

for (int b=10; b<=400; b+=10)
{
  {
   
    ellipse(xPos, yPos, b - 600, b + 1);
    ellipse(xPos/2 - 80, yPos, b-600, b +1);
    ellipse(xPos*2 - 50, yPos, b-600, b +1);

  }
}


