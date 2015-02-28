
//Hao-Yun Mei, hmei
//Copyright_Hao-Yun Mei_Carnegie Mellon University

void setup()
{
  size (400, 400);
  smooth();
  strokeWeight(.2);
  textAlign(CENTER, CENTER);
}

void draw()
{
  // drawThis();
  background(0);
  whileLoop();
  forLoop();
  showFramerate();
  if (keyPressed) saveFrame("hw8.jpg");
}

void whileLoop()
{
  float x=0;
  float y=0;
  while (x < width)
  {
    line (x, 0, width-x, height);
    x = x+10;
    stroke (random(255), random(255), random(255));
  }
}

void forLoop()
{
  for ( float r = 0; r < width; r = r +50)
  {
    noFill();
    ellipse (width/2, height/2, r, r);
    line(0, r , width, height-r);
  }
}

void showFramerate()
{
  stroke(255);
  text(frameRate, 50, 20);
  text(frameCount, 50, 40);
}


