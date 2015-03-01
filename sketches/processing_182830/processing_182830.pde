
int x = 250;
int y = 250;
int r = 0;

void setup()
{
  size(500, 500);
}

void draw()
{
  background(40, 99, 222);
  stroke(4);
  rectMode(CENTER);
  strokeWeight(4);
  fill(220);
  rect(x, y - 125, 100, 100);       //head
  rect(x, y + 5, 100, 100);       //torso
  rect(x - 97, y + 45, 25, 25);         //left hand
  rect(x + 98, y + 48, 25, 25);         //right hand
  ellipse(x, y - 220, 30, 30);         //antenna top
  fill(100);
  ellipse(x, y + 160, 50, 100);     //wheel
  fill(0);
  rect(x, y - 60, 5, 30);        //top connection
  rect(x, y + 82, 5, 50);        //bottom connection
  rect(x + 75, y - 21, 50, 5);        //right bicept
  rect(x + 98, y + 9, 5, 50);        //right forearm
  rect(x - 75, y - 25, 50, 5);        //left bicept
  rect(x - 97, y + 5, 5, 50);        //left forearm
  rect(x, y - 190, 5, 30);         //antenna
  fill(255);
  rect(x, y - 100, 50, 10);             //mouth
  fill(255, 0, 0);
  ellipse(x - 25, y - 140, 25, 40);      //left eye
  ellipse(x + 25, y - 140, 25, 40);      //right eye
  fill(r, 0, 0);
  ellipse(x, y - 25, 20, 20);      //top button
  ellipse(x, y + 5, 20, 20);     //middle button
  ellipse(x, y + 35, 20, 20);           //bottom button
  r = r + 5;
  r = r % 255;
  fill(0);
  strokeWeight(1);
  rect(x - 13, y - 99, 5, 7);        //left tooth
  rect(x, y - 99, 5, 7);             //middle tooth
  rect(x +13, y - 99, 5, 7);          //right tooth
  fill(255);
  strokeWeight(4);
  ellipse(x + 115, y - 210, 100, 50);               //text bubble
  triangle(x + 85, y - 190, x + 70, y - 200, x + 65, y - 180);     //text bubble
  noStroke();
  ellipse(x + 78, y - 195, 12, 12);                //text bubble
  fill(0);
  textSize(12);
  text("Kill all humans!", x + 70, y - 205);        //text bubble
}

void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == UP)
    {
      y = y - 5;
    }
    if (keyCode == DOWN)
    {
      y = y + 5;
    }
    if (keyCode == LEFT)
    {
      x = x - 5;
    }
    if (keyCode == RIGHT)
    {
      x = x + 5;
    }
  }
}



