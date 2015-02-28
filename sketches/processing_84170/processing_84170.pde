
float yvel = random(1, 3);

int snowball = 30;
float[] snowballX = new float[snowball];
float[] snowballY = new float[snowball];

void setup()
{
  size(300, 400);
  frameRate(24);
  noStroke();
  smooth();

  for (int i=0; i<snowball; i++)
  {
    snowballX[i] = random(width);
    snowballY[i] = random(height);
  }
}

void draw()
{
  background(200);
  
  //text
  fill(245);
  textAlign(CENTER);
  textSize(12);
  text("H a p p y  H o l i d a y s !", 150, 250);

  //xmas trees
  pushMatrix();
  fill(170);
  translate(width/2, height/3+10);
  scale(0.5, 0.5);
  xmasTree();
  popMatrix();
  pushMatrix();
  fill(180);
  translate(width/4, height/3+30);
  scale(0.25, 0.25);
  xmasTree();
  popMatrix();
  pushMatrix();
  translate(width*3/4, height/3+30);
  scale(0.25, 0.25);
  xmasTree();
  popMatrix();

  //mouse sparkles
  for (int i=0; i<10; i++)
  {
    fill(255);
    ellipse(mouseX+(random(-5, 5))*i, mouseY+(random(-5, 5))*i, 2, 2);
  }

  //falling snow
  for (int i=0; i<snowball; i++)
  {
    snowballY[i] += yvel;

    fill(255, 50);
    ellipse(snowballX[i], snowballY[i], 15, 15);
    fill(255);
    ellipse(snowballX[i], snowballY[i], 10, 10);

    //repeat once goes below the screen
    if (snowballY[i] >= height)
    {
      snowballY[i] = 0;
    }

    //snow shakes when mouse is near
    if (mouseX > snowballX[i]-50 && mouseX < snowballX[i]+50 
      && mouseY > snowballY[i]-50 && mouseY < snowballY[i]+50)
    {
      snowballY[i] = snowballY[i]+(random(-1.5, 1.5));
      snowballX[i] = snowballX[i]+(random(-1.5, 1.5));
    }
    else {
      snowballY[i] = snowballY[i];
      snowballX[i] = snowballX[i];
    }

    //snow lights up when mouse is moving
    if (mouseX != pmouseX)
    {
      fill(255, 50);
      ellipse(snowballX[i], snowballY[i], 16, 16);
    }
  }
}

void xmasTree()
{
  triangle(0, 0, -50, 50, 50, 50);
  triangle(0, 25, -65, 100, 65, 100);
  triangle(0, 65, -75, 150, 75, 150);
}
