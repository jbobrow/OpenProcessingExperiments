
//Kelvin Pan
//Computer Programming 1
//Simon 16/17
//9.18.12
//User Input: Seizures
//Website: awxrus.webs.com OR openprocessing.org

//variables
int r = 255;
int g = 255;
int b = 255;
int counter = 0;

//setup
void setup()
{
  size(1000, 500);
  background(225, 225, 225);
  noStroke();
}

//draw
void draw()
{
  counter = counter + 1;
  //changing background
  background(r, g, b, 200);
  //RANDOM VARIABLE
  int rgb = int(random(1, 8));
  if (dist(pmouseX, pmouseY, mouseX, mouseY) > 90 && counter*60 < 5001)
  {
    //RED
    if (rgb == 1)
    {
      r=255;
      g=0;
      b=0;
    }
    //ORANGE
    if (rgb == 2)
    {
      r=255;
      g=165;
      b=0;
    }
    //YELLOW
    if (rgb == 3)
    {
      r=255;
      g=255;
      b=255;
    }
    //LIME GREEN
    if (rgb == 4)
    {
      r=0;
      g=255;
      b=0;
    }
    //SKY BLUE
    if (rgb == 5)
    {
      r=0;
      g=191;
      b=255;
    }
    //INDIGO
    if (rgb == 6)
    {
      r=75;
      g=0;
      b=130;
    }
    //VIOLET/PINK
    if (rgb == 7)
    {
      r=238;
      g=130;
      b=238;
    }
  }
  if (dist(pmouseX, pmouseY, mouseX, mouseY) < 90 && counter*60 > 5000)
  {
    r = 255;
    g = 255;
    b = 255;
    counter = 0;
  }

  //character
  fill(0);
  //body
  beginShape();
  vertex(mouseX-100, mouseY+70);
  vertex(mouseX+100, mouseY+70);
  vertex(550, 525);
  vertex(450, 525);
  endShape(CLOSE);
  //head
  ellipse(mouseX, mouseY+70, 200, 200);
  fill(255);
  ellipse(mouseX+60, mouseY+70, 20, 20);
  ellipse(mouseX-60, mouseY+70, 20, 20);
  arc(mouseX, mouseY+90, 80, 50, 0, PI);
}
