
// 48-257, bumyeolk_Project1
// Bumyeol Kim, Copyright 2012

float buttonWidth, buttonHeight;
float boxSide;
int n;

void setup()
{
  size(800, 600);
  background(0);
  buttonWidth = .15 * width;
  buttonHeight = .07 * height;
  boxSide = .07 * height;
  n = 0;
}

void draw()
{   
  mouseClick(n); 
}

void drawFinishedPage()
{
  background(0);
  fill(#FFE874);
  textSize(35);
  textAlign(CENTER);
  text("Thank You!", .5 * width, .86 * height);
  rect(.82 * width, .03 * height, buttonWidth, buttonHeight);
  fill(0);
  textSize(23);
  text("ReStart", .9 * width, .08 * height);
  if(mousePressed)
  {
    if(mouseX >= .82 * width && mouseX <= .82 * width + buttonWidth && mouseY >= .03 * height && mouseY <= .03 * height + buttonHeight)
    {
      n = 0;
    }
  }
}

void drawFrontPage()
{
  fill(0);
  rect(0, 0, width, height);
  textAlign(CENTER);
  textSize(40);
  fill(255);
  text("Welcome", width/2 , .15 * height);
  fill(#00CE5E);
  rect(.8 * width, .9 * height, buttonWidth, buttonHeight); 
  fill(0);
  textSize(25);
  text("Next", .8 * width + buttonWidth/2, .9 * height + buttonHeight * .75);
}

void mouseClick(int n)
{
  if(n == 0)
  {
    drawFrontPage();
  }
  if(n == 1)
  {
    fill(0);
    rect(0, 0, width, height);
    drawQ1();
  }
  if(n == 2)
  {
    fill(0);
    rect(0, 0, width, height);
    drawQ2();
  }
  if(n == 3)
  {
    fill(0);
    rect(0, 0, width, height);
    drawQ3();
  }
  if(n == 4)
  {
    fill(0);
    rect(0, 0, width, height);
    drawQ4();
  }
  if(n == 5)
  {
    fill(0);
    rect(0, 0, width, height);
    drawQ5();
  }
  if(n == 6)
  {
    fill(0);
    rect(0, 0, width, height);
    drawFinishedPage();
  }
}

void mousePressed()
{
  if(mouseX >= .8 * width && mouseX <= .8 * width + buttonWidth && mouseY >= .9 * height && mouseY <= .9 * height + buttonHeight)
  {
    if(n >= 0 && n <= 5)
    {
      n++;
    }  
  }
}

void drawQ1()
{
  background(0);
  textAlign(CENTER);
  fill(255);
  text("There is no doubt that Larry is a genuine ------- :", .5 * width, .4 * height);
  text("he excels at telling stories that fascinate his listeners.", .5 * width, .5 * height);
  fill(#00CE54);
  textAlign(LEFT);
  text("(A) braggart", .2 * width, .6 * height);
  text("(B) dilettante", .2 * width, .65 * height);
  text("(C) pilferer", .2 * width, .7 * height);
  text("(D) prevaricator", .2 * width, .75 * height);
  text("(E) raconteur", .2 * width, .8 * height);
  
  fill(#B363D1);
  rect(.2*width, .85*height, boxSide, boxSide);
  rect(.3*width, .85*height, boxSide, boxSide);
  rect(.4*width, .85*height, boxSide, boxSide);
  rect(.5*width, .85*height, boxSide, boxSide);
  rect(.6*width, .85*height, boxSide, boxSide);
  
  fill(225);
  textAlign(CENTER);
  text("(A)", .23*width, .9*height);
  text("(B)", .33*width, .9*height);
  text("(C)", .43*width, .9*height);
  text("(D)", .53*width, .9*height);
  text("(E)", .63*width, .9*height);
  text("click your", .11*width, .88*height);
  text("choice ->", .11*width, .92*height);
   
  fill(#00CE5E);
  rect(.8*width, .9*height, buttonWidth,buttonHeight); 
  fill(255);
  textSize(25);
  text("Next", .8*width+buttonWidth/2, .9*height+ buttonHeight*.75);
  
  if(mousePressed)
    {
      if(mouseX >= .2 * width && mouseX<= .2 * width + boxSide && mouseY >= .85 * height && mouseY <= .9 * height + boxSide)
      {
        fill(255);
        rect(.1 * width, .25 * height, .8 * width, .5 * height);
        textAlign(CENTER);
        textSize(25);
        fill(0);
        text("Nope...", .5*width, .5*height);
      }
      if(mouseX >= .3 * width && mouseX<= .3 * width + boxSide && mouseY >= .85 * height && mouseY <= .9 * height + boxSide)
      {
        fill(255);
        rect(.1 * width, .25 * height, .8 * width, .5 * height);
        textAlign(CENTER);
        textSize(25);
        fill(0);
        text("Nope...", .5 * width, .5 * height);
      }
      if(mouseX >= .4 * width && mouseX<= .4 * width + boxSide && mouseY >= .85 * height && mouseY <= .9 * height + boxSide)
      {
        fill(255);
        rect(.1 * width, .25 * height, .8 * width, .5 * height);
        textAlign(CENTER);
        textSize(25);
        fill(0);
        text("Nope...", .5 * width, .5 * height);
      }
      if(mouseX >= .5 * width && mouseX<= .5 * width + boxSide && mouseY >= .85 * height && mouseY <= .9 * height + boxSide)
      {
        fill(255);
        rect(.1 * width, .25 * height, .8 * width, .5 * height);
        textAlign(CENTER);
        textSize(25);
        fill(0);
        text("Nope...", .5 * width, .5 * height);
      }
      if(mouseX >= .6 * width && mouseX<= .6 * width + boxSide && mouseY >= .85 * height && mouseY <= .9 * height + boxSide)
      {
        fill(255);
        rect(.1 * width, .25 * height, .8 * width, .5 * height);
        textAlign(CENTER);
        textSize(25);
        fill(0);
        text("Yeah!!! You got it right!!!", .5 * width, .5 * height);
      }
    }
}

void drawQ2()
{
  background(0);
  textAlign(CENTER);
  fill(255);
  text("In context, which is the best revision to the underlined ", .5 * width, .2 * height);
  text("portion of sentence 3 (reproduced below)? ", .5 * width, .25 * height);
  text("They have rarely received ", .5 * width, .35 * height);
  text("much attention during their lifetimes.", .5 * width, .45 * height);
  fill(#00CE54);
  textAlign(LEFT);
  text("(A) In fact, they had", .1 * width, .6 * height);
  text("(B) Too bad these artists have", .1 * width, .65 * height);
  text("(C) As a result, these women have", .1 * width, .7 * height);
  text("(D) In spite of this, women artists", .1 * width, .75 * height);
  text("(E) Often it is the case that the former have", .1 * width, .8 * height);
  
  fill(#B363D1);
  rect(.2*width, .85*height, boxSide, boxSide);
  rect(.3*width, .85*height, boxSide, boxSide);
  rect(.4*width, .85*height, boxSide, boxSide);
  rect(.5*width, .85*height, boxSide, boxSide);
  rect(.6*width, .85*height, boxSide, boxSide);
  
  fill(225);
  textAlign(CENTER);
  text("(A)", .23*width, .9*height);
  text("(B)", .33*width, .9*height);
  text("(C)", .43*width, .9*height);
  text("(D)", .53*width, .9*height);
  text("(E)", .63*width, .9*height);
  text("click your", .11*width, .88*height);
  text("choice ->", .11*width, .92*height);
   
  fill(#00CE5E);
  rect(.8*width, .9*height, buttonWidth,buttonHeight); 
  fill(255);
  textSize(25);
  text("Next", .8*width+buttonWidth/2, .9*height+ buttonHeight*.75);
  
  if(mousePressed)
    {
      if(mouseX >= .2 * width && mouseX<= .2 * width + boxSide && mouseY >= .85 * height && mouseY <= .9 * height + boxSide)
      {
        fill(255);
        rect(.1 * width, .25 * height, .8 * width, .5 * height);
        textAlign(CENTER);
        textSize(25);
        fill(0);
        text("Nope...", .5*width, .5*height);
      }
      if(mouseX >= .3 * width && mouseX<= .3 * width + boxSide && mouseY >= .85 * height && mouseY <= .9 * height + boxSide)
      {
        fill(255);
        rect(.1 * width, .25 * height, .8 * width, .5 * height);
        textAlign(CENTER);
        textSize(25);
        fill(0);
        text("Nope...", .5 * width, .5 * height);
      }
      if(mouseX >= .4 * width && mouseX<= .4 * width + boxSide && mouseY >= .85 * height && mouseY <= .9 * height + boxSide)
      {
        fill(255);
        rect(.1 * width, .25 * height, .8 * width, .5 * height);
        textAlign(CENTER);
        textSize(25);
        fill(0);
        text("Yeah!!! You got it right!!!", .5 * width, .5 * height);
      }
      if(mouseX >= .5 * width && mouseX<= .5 * width + boxSide && mouseY >= .85 * height && mouseY <= .9 * height + boxSide)
      {
        fill(255);
        rect(.1 * width, .25 * height, .8 * width, .5 * height);
        textAlign(CENTER);
        textSize(25);
        fill(0);
        text("Nope...", .5 * width, .5 * height);
      }
      if(mouseX >= .6 * width && mouseX<= .6 * width + boxSide && mouseY >= .85 * height && mouseY <= .9 * height + boxSide)
      {
        fill(255);
        rect(.1 * width, .25 * height, .8 * width, .5 * height);
        textAlign(CENTER);
        textSize(25);
        fill(0);
        text("Nope...", .5 * width, .5 * height);
      }
    }
}

void drawQ3()
{
  background(0);
  textAlign(CENTER);
  fill(255);
  text("The students (A: have discovered) that (B: they)", .5 * width, .2 * height);
  text("can address issues more effectively (C: through)", .5 * width, .3 * height);
  text("letter-writing campaigns (D: and not) through", .5 * width, .4 * height);
  text("public demonstrations. (E: No error)", .5 * width, .5 * height);
  fill(#00CE54);
  textAlign(LEFT);
  text("(A)", .2 * width, .6 * height);
  text("(B)", .2 * width, .65 * height);
  text("(C)", .2 * width, .7 * height);
  text("(D)", .2 * width, .75 * height);
  text("(E)", .2 * width, .8 * height);
  
  fill(#B363D1);
  rect(.2*width, .85*height, boxSide, boxSide);
  rect(.3*width, .85*height, boxSide, boxSide);
  rect(.4*width, .85*height, boxSide, boxSide);
  rect(.5*width, .85*height, boxSide, boxSide);
  rect(.6*width, .85*height, boxSide, boxSide);
  
  fill(225);
  textAlign(CENTER);
  text("(A)", .23*width, .9*height);
  text("(B)", .33*width, .9*height);
  text("(C)", .43*width, .9*height);
  text("(D)", .53*width, .9*height);
  text("(E)", .63*width, .9*height);
  text("click your", .11*width, .88*height);
  text("choice ->", .11*width, .92*height);
   
  fill(#00CE5E);
  rect(.8*width, .9*height, buttonWidth,buttonHeight); 
  fill(255);
  textSize(25);
  text("Next", .8*width+buttonWidth/2, .9*height+ buttonHeight*.75);
  
  if(mousePressed)
    {
      if(mouseX >= .2 * width && mouseX<= .2 * width + boxSide && mouseY >= .85 * height && mouseY <= .9 * height + boxSide)
      {
        fill(255);
        rect(.1 * width, .25 * height, .8 * width, .5 * height);
        textAlign(CENTER);
        textSize(25);
        fill(0);
        text("Nope...", .5*width, .5*height);
      }
      if(mouseX >= .3 * width && mouseX<= .3 * width + boxSide && mouseY >= .85 * height && mouseY <= .9 * height + boxSide)
      {
        fill(255);
        rect(.1 * width, .25 * height, .8 * width, .5 * height);
        textAlign(CENTER);
        textSize(25);
        fill(0);
        text("Nope...", .5 * width, .5 * height);
      }
      if(mouseX >= .4 * width && mouseX<= .4 * width + boxSide && mouseY >= .85 * height && mouseY <= .9 * height + boxSide)
      {
        fill(255);
        rect(.1 * width, .25 * height, .8 * width, .5 * height);
        textAlign(CENTER);
        textSize(25);
        fill(0);
        text("Nope...", .5 * width, .5 * height);
      }
      if(mouseX >= .5 * width && mouseX<= .5 * width + boxSide && mouseY >= .85 * height && mouseY <= .9 * height + boxSide)
      {
        fill(255);
        rect(.1 * width, .25 * height, .8 * width, .5 * height);
        textAlign(CENTER);
        textSize(25);
        fill(0);
        text("Yeah!!! You got it right!!!", .5 * width, .5 * height);
      }
      if(mouseX >= .6 * width && mouseX<= .6 * width + boxSide && mouseY >= .85 * height && mouseY <= .9 * height + boxSide)
      {
        fill(255);
        rect(.1 * width, .25 * height, .8 * width, .5 * height);
        textAlign(CENTER);
        textSize(25);
        fill(0);
        text("Nope...", .5 * width, .5 * height);
      }
    }
}

void drawQ4()
{
  background(0);
  textAlign(CENTER);
  fill(255);
  text("Because King Philip's desire to make Spain", .5 * width, .2 * height);
  text("the dominant in sixteenth-century Europe", .5 * width, .3 * height);
  text("ran counter to Queen Elizabeth's insistence", .5 * width, .4 * height);
  text("on autonomy for England, ------- was -------.", .5 * width, .5 * height);
  fill(#00CE54);
  textAlign(LEFT);
  text("(A) reconciliation . . assured", .2 * width, .6 * height);
  text("(B) warfare . . avoidable", .2 * width, .65 * height);
  text("(C) ruination . . impossible", .2 * width, .7 * height);
  text("(D) conflict . . inevitable", .2 * width, .75 * height);
  text("(E) diplomacy . . simple", .2 * width, .8 * height);
  
  fill(#B363D1);
  rect(.2*width, .85*height, boxSide, boxSide);
  rect(.3*width, .85*height, boxSide, boxSide);
  rect(.4*width, .85*height, boxSide, boxSide);
  rect(.5*width, .85*height, boxSide, boxSide);
  rect(.6*width, .85*height, boxSide, boxSide);
  
  fill(225);
  textAlign(CENTER);
  text("(A)", .23*width, .9*height);
  text("(B)", .33*width, .9*height);
  text("(C)", .43*width, .9*height);
  text("(D)", .53*width, .9*height);
  text("(E)", .63*width, .9*height);
  text("click your", .11*width, .88*height);
  text("choice ->", .11*width, .92*height);
   
  fill(#00CE5E);
  rect(.8*width, .9*height, buttonWidth,buttonHeight); 
  fill(255);
  textSize(25);
  text("Next", .8*width+buttonWidth/2, .9*height+ buttonHeight*.75);
  
  if(mousePressed)
    {
      if(mouseX >= .2 * width && mouseX<= .2 * width + boxSide && mouseY >= .85 * height && mouseY <= .9 * height + boxSide)
      {
        fill(255);
        rect(.1 * width, .25 * height, .8 * width, .5 * height);
        textAlign(CENTER);
        textSize(25);
        fill(0);
        text("Nope...", .5*width, .5*height);
      }
      if(mouseX >= .3 * width && mouseX<= .3 * width + boxSide && mouseY >= .85 * height && mouseY <= .9 * height + boxSide)
      {
        fill(255);
        rect(.1 * width, .25 * height, .8 * width, .5 * height);
        textAlign(CENTER);
        textSize(25);
        fill(0);
        text("Nope...", .5 * width, .5 * height);
      }
      if(mouseX >= .4 * width && mouseX<= .4 * width + boxSide && mouseY >= .85 * height && mouseY <= .9 * height + boxSide)
      {
        fill(255);
        rect(.1 * width, .25 * height, .8 * width, .5 * height);
        textAlign(CENTER);
        textSize(25);
        fill(0);
        text("Nope...", .5 * width, .5 * height);
      }
      if(mouseX >= .5 * width && mouseX<= .5 * width + boxSide && mouseY >= .85 * height && mouseY <= .9 * height + boxSide)
      {
        fill(255);
        rect(.1 * width, .25 * height, .8 * width, .5 * height);
        textAlign(CENTER);
        textSize(25);
        fill(0);
        text("Yeah!!! You got it right!!!", .5 * width, .5 * height);
      }
      if(mouseX >= .6 * width && mouseX<= .6 * width + boxSide && mouseY >= .85 * height && mouseY <= .9 * height + boxSide)
      {
        fill(255);
        rect(.1 * width, .25 * height, .8 * width, .5 * height);
        textAlign(CENTER);
        textSize(25);
        fill(0);
        text("Nope...", .5 * width, .5 * height);
      }
    }
}

void drawQ5()
{
  background(0);
  textAlign(CENTER);
  fill(255);
  text("What is the result when  is rounded to the nearest", .5 * width, .4 * height);
  text("thousand and then expressed in scientific notation?", .5 * width, .5 * height);
  fill(#00CE54);
  textAlign(LEFT);
  text("(A) 4.369 * 10^2", .2 * width, .6 * height);
  text("(B) 4.369 * 10^4", .2 * width, .65 * height);
  text("(C) 4.37 * 10^4", .2 * width, .7 * height);
  text("(D) 4.37 * 10^5", .2 * width, .75 * height);
  text("(E) 4.4 * 10^5", .2 * width, .8 * height);
  
  fill(#B363D1);
  rect(.2*width, .85*height, boxSide, boxSide);
  rect(.3*width, .85*height, boxSide, boxSide);
  rect(.4*width, .85*height, boxSide, boxSide);
  rect(.5*width, .85*height, boxSide, boxSide);
  rect(.6*width, .85*height, boxSide, boxSide);
  
  fill(225);
  textAlign(CENTER);
  text("(A)", .23*width, .9*height);
  text("(B)", .33*width, .9*height);
  text("(C)", .43*width, .9*height);
  text("(D)", .53*width, .9*height);
  text("(E)", .63*width, .9*height);
  text("click your", .11*width, .88*height);
  text("choice ->", .11*width, .92*height);
   
  fill(#00CE5E);
  rect(.8*width, .9*height, buttonWidth,buttonHeight); 
  fill(255);
  textSize(25);
  text("Next", .8*width+buttonWidth/2, .9*height+ buttonHeight*.75);
  
  if(mousePressed)
    {
      if(mouseX >= .2 * width && mouseX<= .2 * width + boxSide && mouseY >= .85 * height && mouseY <= .9 * height + boxSide)
      {
        fill(255);
        rect(.1 * width, .25 * height, .8 * width, .5 * height);
        textAlign(CENTER);
        textSize(25);
        fill(0);
        text("Nope...", .5*width, .5*height);
      }
      if(mouseX >= .3 * width && mouseX<= .3 * width + boxSide && mouseY >= .85 * height && mouseY <= .9 * height + boxSide)
      {
        fill(255);
        rect(.1 * width, .25 * height, .8 * width, .5 * height);
        textAlign(CENTER);
        textSize(25);
        fill(0);
        text("Nope...", .5 * width, .5 * height);
      }
      if(mouseX >= .4 * width && mouseX<= .4 * width + boxSide && mouseY >= .85 * height && mouseY <= .9 * height + boxSide)
      {
        fill(255);
        rect(.1 * width, .25 * height, .8 * width, .5 * height);
        textAlign(CENTER);
        textSize(25);
        fill(0);
        text("Nope...", .5 * width, .5 * height);
      }
      if(mouseX >= .5 * width && mouseX<= .5 * width + boxSide && mouseY >= .85 * height && mouseY <= .9 * height + boxSide)
      {
        fill(255);
        rect(.1 * width, .25 * height, .8 * width, .5 * height);
        textAlign(CENTER);
        textSize(25);
        fill(0);
        text("Yeah!!! You got it right!!!", .5 * width, .5 * height);
      }
      if(mouseX >= .6 * width && mouseX<= .6 * width + boxSide && mouseY >= .85 * height && mouseY <= .9 * height + boxSide)
      {
        fill(255);
        rect(.1 * width, .25 * height, .8 * width, .5 * height);
        textAlign(CENTER);
        textSize(25);
        fill(0);
        text("Nope...", .5 * width, .5 * height);
      }
    }
}

