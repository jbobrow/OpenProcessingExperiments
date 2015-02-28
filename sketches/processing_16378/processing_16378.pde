
//Spectra Revolver
//DESMA 2010 Interacitivty 28
//by Stephen Ou

float angle = 0.0;
float rb = 0.0;
float grow = 0.0;
boolean drawit;


void setup()
{
  size(1024,768);
  smooth();
  rectMode(CENTER);
  ellipseMode(CENTER);
  background(0);
  noCursor();
  colorMode(HSB, 360,100,100);
  drawit=true;
}

void draw()
{
  //  pushMatrix();
  //  translate(mouseX,mouseY);
  //  rotate(angle);
  //  fill(rb,100,100,70);
  //  noStroke();
  //  ellipse(0,0,10,10);
  //  popMatrix();
  if (mousePressed);
  {
    pushMatrix();
    translate(mouseX,mouseY);
    rotate(angle);
    fill(rb,100,100,20);
    noStroke();
    for(int i=0; i<20; i++)
    {
      scale(1.1);

      triangle(0+grow,-5+grow,2+grow,3+grow,-2+grow,3+grow);
    }
    popMatrix();
    angle +=0.1;
    grow +=0.01;
    rb +=0.1;
    if (rb>360) {
      rb=0;
    }
    if(grow>50) {
      grow = 50;
    }
  }
}

//void mouseMoved()
//{
//  drawit = false;
//}


