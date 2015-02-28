
void setup()
{
  size(600, 600);
  background (255); 
  drawBackground();
  drawCircles();
}


void draw()
{
}

void drawBackground()
{

  fill(10);
  rect(0, 150, 150, 300);

  fill(20);
  rect(227, 150, 150, 300);

  fill(30);
  rect(450, 150, 150, 300);
}

void drawCircles()
{

  float x, y, z;


  ellipseMode(CENTER);
  
  //drawing circles for first box
  for (int i = 0; i < 130; i++)
  {

    x = random(5.0, 30.0);
    y = random(0.0,140.0);
    z = random(165.0,430.0);

    fill(random(255), random (255), random(255));

    ellipse(y, z, x, x);

    fill(random(255), random (255), random(255));
    ellipse(y, z, x-15.0, x-15.0);
  
}

  //drawing circles for second box
  for (int i = 0; i < 130; i++)
  {

    x = random(5.0, 30.0);
    y = random(240,360.0);
    z = random(165.0,430.0);

    fill(random(255), random (255), random(255));

    ellipse(y, z, x, x);

    fill(random(255), random (255), random(255));
    ellipse(y, z, x-15.0, x-15.0);
  }

  //drawing circles for third box
  for (int i = 0; i < 130; i++)
  {

    x = random(5.0, 30.0);
    y = random(470.0,600.0);
    z = random(165.0,430.0);

    fill(random(255), random (255), random(255));

    ellipse(y, z, x, x);

    fill(random(255), random (255), random(255));
    ellipse(y, z, x-15.0, x-15.0);
  }
  
}





