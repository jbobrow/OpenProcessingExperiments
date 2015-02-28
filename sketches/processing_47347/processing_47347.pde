
int[] a_numbers;

void setup()
{
  size(800, 800);
  noStroke();
  smooth();
  a_numbers = int(loadStrings("answer.txt"));
  noLoop();
}

void draw()
{
  background(0);
  fill(255);

  int yes = 0;
  int no = 0;

  for (int i=0; i<a_numbers.length; i++) {;
    float sw = random(5);
    strokeWeight(sw);
    float offset = random(0,800);
    stroke(255, 100);
    if (a_numbers[i]==1)
    {
      stroke(162, 255, 194, 100);
    }
    else if (a_numbers[i]==0)
    {
      stroke(250, 150, 100, 100);
    }
    line(offset, 800, offset, 0);
  }

  for (int j=0; j<800;j++)
  {
    fill(0);
    noStroke();
    pushMatrix();
    translate(random(0, 800), random(0, 800));
    rect(0, 0, 6, 2);
    popMatrix();
  }


  for (int i=0; i<a_numbers.length;i++)
  {
    if (a_numbers[i]==1)
    {
      yes++;
      stroke(255, 100);
      strokeWeight(random(1, 10));
      fill(80, 220, 240, 150);
      ellipse( random(50, 750), random (50, 750), 40, 40);
    }

    else if (a_numbers[i]==0)
    {
      no++;
      stroke(255, 100);
      strokeWeight(random(1, 10));
      fill(220, 20, 20, 150);
      ellipse( random(50, 700), random (50, 750), 20, 20);
    }
  }
}

void mousePressed()
{
  redraw();
}

