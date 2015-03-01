
ArrayList branches = new ArrayList();

void setup()
{
  size(640, 640);
  stroke(0, 150, 255, 65);
  for (int i = 0; i < 10; i++)
  {
    branches.add(new Branch());
  }
}

void draw()
{
  background(0);
  for (int i = 0; i < branches.size (); i++) 
  {
    Branch b = (Branch)branches.get(i);
    
    pushMatrix();
    translate(width/2, height);
    rotate(radians(b.startAngle));
    b.branch(b.segments);
    popMatrix();
    
  }
}

class Branch
{
  float segments, startAngle, theta, num;
  
  Branch()
  {
    segments = random(100, 250);
    startAngle = random(-30, 30);
  }

  void branch(float len)
  {
    float t = map(len, 1, 160, 1, 5);
    theta = sin(len+num) * 3;
    strokeWeight(t);
    line(0, 0, 0, -len);
    ellipse(0, 0, t, t);
    translate(0, -len);
    len *= 0.50;
    if (len > 2)
    {
      pushMatrix();
      rotate(radians(-20+theta));
      branch(len);
      popMatrix();

      pushMatrix();
      rotate(radians(20-theta));
      branch(len);
      popMatrix();
    }
    else
    {
      ellipse(0, 0, 3, 3);
    }
    num += 0.001;
  }
}


