
float scatter = 0;
boolean scatterTimer = false;

float scatterDir1x = 0;
float scatterDir2x = 0;
float scatterDir3x = 0;
float scatterDir4x = 0;
float scatterDir5x = 0;
float scatterDir6x = 0;
float scatterDir7x = 0;


float scatterDir1y = 0;
float scatterDir2y = 0;
float scatterDir3y = 0;
float scatterDir4y = 0;
float scatterDir5y = 0;
float scatterDir6y = 0;
float scatterDir7y = 0;

void setup()
{
  background(0);
  size(640, 480);

    scatterDir1x = random(-10,10);
    scatterDir2x = random(-10,10);
    scatterDir3x = random(-10,10);
    scatterDir4x = random(-10,10);
    scatterDir5x = random(-10,10);
    scatterDir6x = random(-10,10);
    scatterDir7x = random(-10,10);

    scatterDir1y = random(-10,10);
    scatterDir2y = random(-10,10);
    scatterDir3y = random(-10,10);
    scatterDir4y = random(-10,10);
    scatterDir5y = random(-10,10);
    scatterDir6y = random(-10,10);
    scatterDir7y = random(-10,10);
  
}

void draw()
{

  background(0);

  if (mousePressed)
  {
    scatter = 0;
    scatterTimer = false;
    scatterDir1x = random(-10,10);
    scatterDir2x = random(-10,10);
    scatterDir3x = random(-10,10);
    scatterDir4x = random(-10,10);
    scatterDir5x = random(-10,10);
    scatterDir6x = random(-10,10);
    scatterDir7x = random(-10,10);

    scatterDir1y = random(-10,10);
    scatterDir2y = random(-10,10);
    scatterDir3y = random(-10,10);
    scatterDir4y = random(-10,10);
    scatterDir5y = random(-10,10);
    scatterDir6y = random(-10,10);
    scatterDir7y = random(-10,10);
    
  }

  textAlign(CENTER);

  textSize(48);
  
  if((mouseX > width/2 - 65) && (mouseX < width/2 + 85) && (mouseY > height/2 - 35) && (mouseY < height/2 + 35))
  {
    scatterTimer = true;
  }
  if(scatterTimer)
  {
    scatter = scatter + 1;
  }

  text("S", (width/2 - 75) + scatterDir1x * scatter, (height/2)+ scatterDir1y * scatter);
  text("c", (width/2 - 50) + scatterDir2x * scatter, (height/2)+ scatterDir2y * scatter);
  text("a", (width/2 - 25) + scatterDir3x * scatter, (height/2)+ scatterDir3y * scatter);
  text("t", (width/2) + scatterDir4x * scatter, (height/2)+ scatterDir4y * scatter);
  text("t", (width/2 + 25) + scatterDir5x * scatter, (height/2)+ scatterDir5y * scatter);
  text("e", (width/2 + 50) + scatterDir6x * scatter, (height/2)+ scatterDir6y * scatter);
  text("r", (width/2 + 75) + scatterDir7x * scatter, (height/2)+ scatterDir7y * scatter);
}



