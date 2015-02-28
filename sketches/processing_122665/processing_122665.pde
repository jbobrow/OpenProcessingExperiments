
float counter =0;
float counter2 =0;
float step = 0;
void setup()
{
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
}
void draw()

{
  background(220, 100, 20);
  translate(width/2, height/2);
  if (hour() > 0 && hour() < 7) 
  {
    fill(45, 50, 100);
    noStroke();
    ellipse(-150, 20, 150, 150);
  }
  else if (hour() >7 && hour() <12)
  {
    fill(50, 70, 100);
    noStroke();
    ellipse(-130, -50, 150, 150);
  }
  else if (hour() >12 && hour() <16.30)
  {
    fill(50, 100, 100);
    noStroke();
    ellipse(0, -150, 150, 150);
  }
  else if (hour() >16.30 && hour() <20)
  {
    fill(20, 100, 100);
    noStroke();
    ellipse(130, -100, 150, 150);
  }
  else if (hour() >20 && hour() <23.30)
  {
    fill(220, 60, 50);
    noStroke();
    ellipse(150, 0, 150, 150);
  }

  counter += 0.01;

  float step = map(second(), 0, 59, 0, 150);
  float step2 = map(minute(), 0, 59, 0, 40);
  float amplitude = map(50, -100, height, 10, 100);

  for (int i=0; i<20; i++)

  {
    if (hour() > 0 && hour() < 17.30) 
    {
      pushMatrix();
      translate(-250, 100);
      translate(i*step, sin(counter+i)*amplitude);
      fill(220, 100, 100);
      noStroke();
      rect(0, 0, 20, 20);
      popMatrix();
    }

    else if (hour() >17.30 && hour() <23.30)
    {
      pushMatrix();
      translate(-250, 100);
      translate(i*step, sin(counter+i)*amplitude);
      fill(220, 50, 50);
      noStroke();
      rect(0, 0, 20, 20);
      popMatrix();
    }
    if (hour() > 0 && hour() < 17.30) 
    {
      counter += 0.002;
    }
    else 
    {
      counter += 0;
    }
    {
      pushMatrix();
      int min2= minute()*8;
      fill(20, 100, 100);
      noStroke();
      translate(-250, 200);
      //rotate(radians(90));
      rect(0, 0, min2, 50);
      popMatrix();
    }
        {
      pushMatrix();
      int std2= hour()*8;
      fill(20, 100, 20);
      noStroke();
      translate(-250, 225);
      //rotate(radians(90));
      rect(0, 0, std2, 25);
      popMatrix();
    }
   }
}
