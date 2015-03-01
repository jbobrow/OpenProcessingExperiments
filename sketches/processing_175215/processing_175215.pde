
float counter = 0;

void setup()
{
  size(500, 500);
}

void draw()
{

  if (mousePressed == true)
  {
    stroke(0);
    strokeWeight(2);
    translate(width/2, height/2);
    background(139, 100, 80);
    rectMode(CENTER);
    fill(0, 0, 139);
    rect(0, 0, 350, 350);
    line(-175, 0, 175, 0);
    line(0, -175, 0, 175);

    fill(255, 255, 255);
    ellipse(-120, 110, 40, 40);
    fill(255, 255, 255);
    ellipse(-120, 150, 50, 50);
    fill(0);
    ellipse(-130, 105, 5, 5);
    fill(0);
    ellipse(-110, 105, 5, 5);
    fill(255, 127, 36);
    triangle(-120, 115, -120, 120, -110, 115);

    for (int i=0; i<360; i+=40)
    {
      fill(255);
      noStroke();
     
      float amp = sin(millis()/500.0+i)*150;
       ellipse(amp, -175+frameCount*2, 10, 10);
        ellipse(amp, -100+frameCount*2,10,10);
        ellipse(amp, -10+frameCount*2,10,10);
     

      if ( frameCount > 80)
      {
        frameCount = 0;
      }
    }
  } else
  {
    stroke(0);
    strokeWeight(2);
    translate(width/2, height/2);
    background(139, 100, 80);
    rectMode(CENTER);
    fill(0, 0, 139);
    rect(0, 0, 350, 350);
    line(-175, 0, 175, 0);
    line(0, -175, 0, 175);

    fill(255, 255, 255);
    ellipse(-120, 110, 40, 40);
    fill(255, 255, 255);
    ellipse(-120, 150, 50, 50);
    fill(0);
    ellipse(-130, 105, 5, 5);
    fill(0);
    ellipse(-110, 105, 5, 5);
    fill(255, 127, 36);
    triangle(-120, 115, -120, 120, -110, 115);
  }
}

