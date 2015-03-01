
void setup()
{
  size (500, 500);
  colorMode(HSB, 360, 100, 100);
  background(0, 0, 100);
  smooth();
}

void draw()

{
  background(0, 0, 100);  

  pushMatrix();
  stroke(0, 0, 0);
  rectMode(CENTER);
  fill(0, 0, 62);
  rect(250, 350, 180, 180);
  popMatrix();

  if (mouseY<260)
  {
    pushMatrix();
    stroke(0, 0, 0);
    rectMode(CENTER);
    fill(0, 0, 62);
    translate(135, 250);
    rotate(radians(-110));
    rect(70, -20, 180, 90);
    popMatrix();

    pushMatrix();
    stroke(0, 0, 0);
    fill(0, 0, 72);
    rect(250, 225, 70, 70);
    popMatrix();

    pushMatrix();
    stroke(0, 0, 0);
    fill(0, 0, 20);
    ellipse(300, 230, 40, 40);
    popMatrix();

    pushMatrix();
    stroke(0, 0, 0);
    fill(0, 0, 80);
    ellipse(300, 230, 15, 15);
    popMatrix();

    if ( mouseX<=310 && mouseX>=290 && mouseY<=240 && mouseY>=220 && mousePressed==true)
    {
      for (int i=215; i<290; i+=5)
      {
        stroke (36, 98, 99);
        line (i, 190, i, 150+(random(10)));
      }
    }
  } else
  {

    pushMatrix();
    rectMode(CENTER);
    fill(0, 0, 62);
    rect(250, 220, 180, 90);
    popMatrix();
  }



  pushMatrix();
  stroke(0, 0, 0);
  rectMode(CENTER);
  fill(0, 0, 62);
  ellipse(160, 265, 15, 15);
  popMatrix();
}
