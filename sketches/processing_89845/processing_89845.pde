
int x = 10;
int speed = 1;
void setup()
{
 size(200, 200);
}

void draw()
{
 if(mouseX > (width/2 + 10) || mouseX < (width/2 - 10) || mouseY > (height/2 + 10) || mouseY < (height/2 - 10))
 drawShapes(255, 255, 255);
}

void drawShapes( int color1, int color2, int color3)
{
 
 background(255);
 fill(0, 0, color1);
 ellipse(x, height/2 , 20, 20);
 rectMode(CENTER);
 fill(color2, 0, 0);
 rect(x, height/2 - 5, 10, 10);
 fill(0, color3, 0);
 rect(x, height/2 + 5, 10, 10);
 x = x + speed;
 if((x - 10) < 0 || (x + 10) > 200)
 {
  speed = speed * -1;
 }
}


