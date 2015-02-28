
float xp = 250;
float yp = 250;

void setup()
{
 size(500, 500); 
}

void draw()
{
  background(255);
  ellipse( xp, yp, 100, 100);
  
  float dista = dist(mouseX, mouseY, xp, yp);
  if(dista < 100) {
    xp = xp + (xp - mouseX)/25;
    yp = yp + (yp - mouseY)/25;
  }
}

