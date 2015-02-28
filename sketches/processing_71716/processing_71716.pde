
int catOvalX = 150;
int catOvalY = 140;
int catChinX = catOvalX + 50;
int catChinY = catOvalY + 135;
int catLeftEarX = catOvalX + 50;
int catRightEarX = catLeftEarX + 150;
int catLeftEarY = catOvalY + 60;
int catRightEarY = catLeftEarY;

int catEarSeparation = 150;

int catOvalWidth = 350;
int catOvalHeight = 200;
int catChinWidth = 250;
int catChinHeight = 150;

int catNoseX = catOvalX + 100;
int catNoseY = catOvalY + 140;
int catLeftEyeX = catOvalX + 75;
int catLeftEyeY = catOvalY + 80;
int catRightEyeX = catLeftEyeX + 100;
int catRightEyeY = catLeftEyeY;
int catEyeWidth = 100;
int catEyeHeight = 70;
int catEyePupilWidth = 60;
int catEyePupilHeight = 60;

color colorOfEars = #78797C;
color colorOfPupils = #474EFC;
color colorOfHead = #8C8D90;
color colorOfNose = #EE646B;
color colorOfWhiskers = #E3E3E3;

int backgroundColor = color(random(255), random(255), random(255));

void setup()
{
  size(600, 600);
  background(backgroundColor);
  smooth();

  setValues();
}

void leftEar()
{
  //----------Left Ear-----------
  fill(colorOfEars);
  beginShape();
  curveVertex(catOvalX + 75, catOvalY - 29);
  curveVertex(catOvalX + 52, catOvalY + 63);
  curveVertex(catOvalX + 75, catOvalY - 29);
  curveVertex(catOvalX + 104, catOvalY - 29);
  curveVertex(catOvalX + 152, catOvalY + 53);
  curveVertex(catOvalX + 140, catOvalY + 40);
  endShape();
}

void rightEar()
{
  //---------Right Ear-----------
  fill(colorOfEars);
  beginShape();
  curveVertex(catOvalX + 75 + catEarSeparation, catOvalY + 40);
  curveVertex(catOvalX + 52 + catEarSeparation, catOvalY + 53);
  curveVertex(catOvalX + 75 + catEarSeparation, catOvalY - 29);
  curveVertex(catOvalX + 104 + catEarSeparation, catOvalY - 29);
  curveVertex(catOvalX + 152 + catEarSeparation, catOvalY + 63);
  curveVertex(catOvalX + 140 + catEarSeparation, catOvalY - 29);
  endShape();
}

void eyes()
{
  fill(colorOfPupils);
  ellipse(catLeftEyeX, catLeftEyeY, catEyeWidth, catEyeHeight);
  ellipse(catRightEyeX, catRightEyeY, catEyeWidth, catEyeHeight);

  fill(0);
  ellipse(catLeftEyeX + (catEyePupilWidth / 2), catLeftEyeY + (catEyePupilHeight/2), catEyeWidth - catEyePupilWidth, catEyeHeight - catEyePupilHeight);
  ellipse(catRightEyeX + (catEyePupilWidth / 2), catRightEyeY + (catEyePupilHeight/2), catEyeWidth - catEyePupilWidth, catEyeHeight - catEyePupilHeight);
}

void nose()
{
  fill(colorOfNose);
  triangle(catNoseX, catNoseY - 50, catNoseX + 50, catNoseY, catNoseX + 100, catNoseY - 50);
}

void whiskers()
{
  stroke(colorOfWhiskers);
  for (int i = 1; i <= 4; i++)
  {
    line(catNoseX - 20/i, catNoseY - (10 + (i * 6)), catNoseX - (40 * i),catNoseY - (10 + (i * 18)));
    line(catNoseX + 100 + 20/i, catNoseY - (10 + (i * 6)), catNoseX + 100+  (40 * i),catNoseY - (10 + (i * 18)));
  }
  stroke(0);
}

void mouth()
{
 line(catNoseX + 50, catNoseY, catNoseX + 50, catNoseY + 10);
 noFill();
 arc(catNoseX, catNoseY - 10, 50, 40, 0, PI);
 arc(catNoseX + 50, catNoseY - 10, 50, 40, 0, PI);
}

void head()
{
  ellipseMode(CORNER);
  fill(colorOfHead);
  ellipse(catChinX, catChinY, catChinWidth, catChinHeight);
  ellipse(catOvalX, catOvalY, catOvalWidth, catOvalHeight);
  noStroke();
  ellipse(catChinX, catChinY, catChinWidth, catChinHeight);
  stroke(1);
}

void updateValues()
{
  catChinX = catOvalX + 50;
  catChinY = catOvalY + 125;
  catLeftEarX = catOvalX + 50;
  catRightEarX = catLeftEarX + 150;
  catLeftEarY = catOvalY + 60;
  catRightEarY = catLeftEarY;

  catEarSeparation = 150;

  catNoseX = catOvalX + 120;
  catNoseY = catOvalY + 210;

  catLeftEyeX = catOvalX + 75;
  catLeftEyeY = catOvalY + 80;
  catRightEyeX = catLeftEyeX + 110;
  catRightEyeY = catLeftEyeY;
}

void setValues()
{
  catChinX = catOvalX + 50;
  catChinY = catOvalY + 125;
  catLeftEarX = catOvalX + 50;
  catRightEarX = catLeftEarX + 150;
  catLeftEarY = catOvalY + 60;
  catRightEarY = catLeftEarY;

  catEarSeparation = 150;

  catOvalWidth = 350;
  catOvalHeight = 250;
  catChinWidth = 250;
  catChinHeight = 135;

  catNoseX = catOvalX + 120;
  catNoseY = catOvalY + 250;

  catLeftEyeX = catOvalX + 75;
  catLeftEyeY = catOvalY + 80;
  catRightEyeX = catLeftEyeX + 110;
  catRightEyeY = catLeftEyeY;
  catEyeWidth = 80;
  catEyeHeight = 60;
  catEyePupilWidth = 40;
  catEyePupilHeight = 20;

  colorOfEars = #78797C;
  colorOfPupils = #474EFC;
  colorOfHead = #8C8D90;
  colorOfNose = #EE646B;
}

void switchColors(int randomColorSelector)
{
  if (randomColorSelector == 1)
  {
    //----Ragdoll Cat-----
    colorOfEars = #78797C;
    colorOfPupils = #474EFC;
    colorOfHead = #8C8D90;
    colorOfNose = #EE646B;
    colorOfWhiskers = #E3E3E3;
  }

  else if (randomColorSelector == 2)
  {
    //----Black Cat----
    colorOfEars = #12110F;
    colorOfPupils = #DDED69;
    colorOfHead = #393630;
    colorOfNose = #E5BCBE;
    colorOfWhiskers = #747474;
  }

  else if (randomColorSelector == 3)
  {
    //-----Ginger Cat-----
    colorOfEars = #AD7D25;
    colorOfPupils = #DBBB1B;
    colorOfHead = #FAC967;
    colorOfNose = #ED8D69;
    colorOfWhiskers = #AF9304;
  }
}

void drawingTools()
{
  int mouseCatXDiff = mouseX - catOvalX;
  int mouseCatYDiff = mouseY - catOvalY;

  println("X = " + mouseCatXDiff + "  Y = " + mouseCatYDiff);
}

void draw()
{
  //background(backgroundColor);
  fill(backgroundColor, 30);
  rect(0, 0, width, height);

  updateValues();

  //noStroke();

  head();
  leftEar();
  rightEar();
  nose();
  eyes();
  whiskers();
  mouth();

  //drawingTools();
}

void keyPressed()
{
  if (key == CODED)
  { 
    if (keyCode == UP)
    { 
      catOvalY =  catOvalY - 7;
    }
    else if (keyCode == DOWN)
    { 
      catOvalY =  catOvalY + 7;
    } 
    if (keyCode == LEFT)
    { 
      catOvalX =  catOvalX - 7;
    }
    else if (keyCode == RIGHT)
    { 
      catOvalX =  catOvalX + 7;
    }
  }
}

void mousePressed()
{
  //catOvalWidth = 335 + (int)random(15);
  catOvalHeight = 250 + (int)random(35);

  catChinHeight = catOvalHeight - 115;

  catEyePupilWidth = 20 + (int)random(20);
  catEyePupilHeight = 10 + (int)random(10);
  catEyeWidth = 75 + (int)random(5);
  catEyeHeight = 55 + (int)random(5);

  int randomColorSelector = (int)random(3) + 1;
  switchColors(randomColorSelector);
}
