
// Jill Goodwyn
// Carnegie Mellon University
// Electronic Media Studio II Section D
// Professor Singer
// September 2011
// jpgoodwyn@gmail.com

// Homework for 9.12.2011

int r1 = 250;
int r2 = 150;
int r3 = 250;

void setup()
{
  size(500, 500);
  smooth();
  ellipseMode(CENTER);
  background(200,75,255);
}

void draw()
{
  loopCupcake();
  drawButton();
}

// The giant button in the center of the screen
void drawButton()
{
  int diam = width/5;

  fill(200,75,255);
  rect(width/3,height/3,width/3,height/3);
  stroke(255);
  strokeWeight(4);
  fill(250, 150, 250);
  ellipse(width/2,height/2, diam,diam);

  // Only draw the color change if the mouse is pressed and held down
  if(mousePressed)
  {
    if (mouseX > (width/2)-(diam/2) && mouseX < (width/2)+(diam/2))
    {
      if (mouseY > (height/2)-(diam/2) && mouseY < (height/2)+(diam/2))
      {
        r1 = int(random(255));
        r2 = int(random(255));
        r3 = int(random(255));
        fill(r1, r2, r3);
        ellipse(width/2,height/2, diam,diam);
        fill(255);
        noStroke();
        ellipse((width/2)-(diam/4),(height/2)-(diam/5),diam/4,diam/4);
        ellipse((width/2)+(diam/4),(height/2)-(diam/5),diam/4,diam/4);
        ellipse(width/2,(height/2)+(diam/6), diam/1.5, diam/2);
      }
    }
  }
}

// Loops the cupcakes
void loopCupcake()
{
  int oneTenthWidth = width/6;
  int oneTenthHeight = height/6;

  for(int x = 0; x <= 5; x++)
  {
    for(int y = 0; y <= 5; y++ )
    {
      int r = 150 + (x*20);
      int g = 0  + (x*20);
      int b = 230 + (x*20);

      drawCupcake((oneTenthWidth * x) + (oneTenthWidth/2),
      (oneTenthHeight * y) + (oneTenthWidth/2),
      oneTenthWidth, r, g, b);
    }
  }
}

// Draws a friggin cupcake wherever you want it, at whatever size you want
void drawCupcake(int cupcakeX, int cupcakeY, int cupcakeDiam, int r, int g, int b)
{

  // the circle background
  stroke(r, g, b);
  strokeWeight(cupcakeDiam/30);
  fill(r1, r2, r3);
  ellipse(cupcakeX, cupcakeY, cupcakeDiam, cupcakeDiam);

  // the wrapper (bottom)
  stroke(250, 100, 200);
  strokeWeight(cupcakeDiam/18);
  strokeJoin(ROUND);
  fill(r, g, b);
  quad(cupcakeX-cupcakeDiam/3, cupcakeY, 
  cupcakeX+cupcakeDiam/3, cupcakeY, 
  cupcakeX+cupcakeDiam/6, cupcakeY+cupcakeDiam/3, 
  cupcakeX-cupcakeDiam/6, cupcakeY+cupcakeDiam/3);

  // the cake
  stroke(250,200,0);
  strokeWeight(cupcakeDiam/18);
  fill(250, 200, 0);
  ellipse(cupcakeX, cupcakeY-cupcakeDiam/20, cupcakeDiam/1.6, cupcakeDiam/5);
  noStroke();
  fill(250,200,100);
  ellipse(cupcakeX-cupcakeDiam/20, cupcakeY-cupcakeDiam/20, cupcakeDiam/1.8, cupcakeDiam/6);

  // the frosting
  noStroke();
  fill(255);
  ellipse(cupcakeX, cupcakeY-cupcakeDiam/5, cupcakeDiam/3, cupcakeDiam/4);
  ellipse(cupcakeX-cupcakeDiam/5, cupcakeY-cupcakeDiam/6, cupcakeDiam/5, cupcakeDiam/6);
  ellipse(cupcakeX+cupcakeDiam/5, cupcakeY-cupcakeDiam/6, cupcakeDiam/5, cupcakeDiam/6);

  // cherry!
  noStroke();
  fill(225,0,0);
  ellipse(cupcakeX, cupcakeY-cupcakeDiam/3, cupcakeDiam/8, cupcakeDiam/8);
  fill(225,75,75);
  ellipse(cupcakeX-cupcakeDiam/60, cupcakeY-cupcakeDiam/2.9,
  cupcakeDiam/12, cupcakeDiam/12);

  // text
  fill(255);
  textSize(cupcakeDiam/8);
  text("EMS II", cupcakeX-cupcakeDiam/6, cupcakeY+cupcakeDiam/5);
  textSize(cupcakeDiam/15);
  text("2011", cupcakeX-cupcakeDiam/12, cupcakeY+cupcakeDiam/3.7);
}


