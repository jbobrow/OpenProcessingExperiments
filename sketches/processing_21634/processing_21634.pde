
//Color Grid - Lauren Flood

//Horizontal and diagonal lines randomly sweep across the page in different colors
//White dots are plotted randomly behind the lines
//Click and drag the mouse to make trails of colored dots

void setup ()
{
  size(500,500);
  background(0);
  smooth();
  frameRate(10);
}

void draw ()
{
  for(int i=50; i<500; i +=50) //line grid
  {
    {
      stroke(random(255),random(255),random(255));
      strokeWeight(random(5));
      line(i,random(500),i,random(500));
      line(random(500),i,random(500),i);
    }
    {
      stroke(255); //white dots
      point(random(500), random(500));
    }
    if (mousePressed) //trail of colored dots
    {
      noStroke();
      ellipse (mouseX, mouseY, 20, 20);
      fill(random (55, 255), random (55, 255), random (55,255)); //I chose colors above 55 so they don't fade into the black background
    }
  }
}


