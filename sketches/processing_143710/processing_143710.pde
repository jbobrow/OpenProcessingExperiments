
void setup()
{
  size(500, 500);
  background(0);
  smooth();
}

void draw()
{
  background(0);

  translate(width/2, height/2);


  fill(150, 150, 150);
  ellipse(0, 0, 375, 375);
  fill(255, 255, 255);
  ellipse(0, 0, 355, 355);

  for (int i=0; i<360; i+=20)
  {
    pushMatrix();

    rotate(radians(i) );
    //translate(0, mouseX);
    translate(25, sin(millis()/2500.0)*25);
    //ellipse(0, 0, 10, 10);
    fill(200, 150, 225);
    arc(0, 0, 25, 25, 0, PI+QUARTER_PI, PI);
    //triangle(0, 0, 0, 20, 20, 10);

    popMatrix();

    pushMatrix();

    rotate(radians(i) );
    translate(0, sin(millis()/2500.0)*250);
    fill(200, 150, 225);
    //arc(0, 0, 25, 25, 0, PI+QUARTER_PI, PIE);
    arc(25, 27, 25, 25, 0, HALF_PI);
    noFill();
    arc(25, 27, 30, 30, HALF_PI, PI);
    arc(25, 27, 35, 35, PI, PI+QUARTER_PI);
    arc(25, 27, 40, 40, PI+QUARTER_PI, TWO_PI);

    popMatrix();

    pushMatrix();
    float sec= map(second(), 0, 60, 0, 360);
    rotate(radians(sec));
    fill(200, 150, 225);
    stroke(0);
    line(0, 0, 125, 0);
    popMatrix();
  }
}

