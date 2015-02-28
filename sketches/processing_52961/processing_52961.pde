
PFont font;
PImage guy;
float x, y;
float c, d;
float angle = 0.0;

void setup()
{
  smooth();
  size(500, 500);
}

void draw()
{

  background(0);
  font = loadFont("HelveticaNeue-Bold-48.vlw"); 
  guy = loadImage("guy.png");

  angle+=.1;
  float sinVal = sin(angle)*100;
  float stop = sin(0)*100;
  c = random(100, 150);
  d = random(230, 255);

  if (mousePressed == true)
  {
    pushMatrix();
    fill(c, 0, 0);
    angle+=.5;
    translate(mouseX, mouseY);
    rotate(angle);
    rectMode(CENTER);
    rect(0, 25, 150, 150);
    fill(0, 0, c);
    rect(0, -150, 50, 50);
    fill(255, 255, c);
    rect(0, -100, 25, 25);
    fill(255, c, c);
    rect(0, 50, 25, 25);
    popMatrix();
    angle += .2;
    sinVal = sin(angle)*50;
    image(guy, mouseX-25-sinVal, 300);
  }

  if (mouseX > width/2-25 && mouseX < width/2+25 )
  {
    if ( mouseY > height/2-25 && mouseY < height/2+25)
    {
      x = sinVal;
      fill(c, d, x);
    }

    else
    {
      x = stop;
      fill(255);
    }
  }

  pushMatrix();
  textFont(font);
  translate(width/2-50, height/2);
  text("dance", x, 0);
  popMatrix();
}


