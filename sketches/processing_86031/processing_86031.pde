
float x1;
float x2;
float answer;
boolean click;
boolean add;
boolean sub;
boolean div;
boolean mult;
boolean operator;
boolean thirdclick;
boolean firstclick;
void setup()
{
  background(255);
  textAlign(CENTER);
  size(600, 600);
  strokeWeight(3);
  //horizontal lines
  line(0, .2*height, width, .2*height);
  line(0, .4*height, width, .4*height);
  line(0, .6*height, width, .6*height);
  line(0, .8*height, .8*width, .8*height);
  //verticle lines
  line(.2*width, 0, .2*width, height);
  line(.4*width, .2*height, .4*width, height);
  line(.6*width, .2*height, .6*width, height);
  line(.8*width, 0, .8*width, height);
  //numbers and operator symbols
  fill(0);
  textSize(35);
  text('1', .1*width, .3*height);
  text('2', .3*width, .3*height);
  text('3', .5*width, .3*height);
  text('4', .1*width, .5*height);
  text('5', .3*width, .5*height);
  text('6', .5*width, .5*height);
  text('7', .1*width, .7*height);
  text('8', .3*width, .7*height);
  text('9', .5*width, .7*height);
  text('0', .1*width, .9*height);
  text('.', .3*width, .9*height);
  text("(-)", .5*width, .9*height);
  text("Clr", .1*width, .1*height);
  text("Mem", .9*width, .1*height);
  text("*", .7*width, .3*height);
  text("/", .7*width, .5*height);
  text("-", .7*width, .7*height);
  text("+", .7*width, .9*height);
  text("=", .9*width, .8*height);
  text("Pi", .9*width, .5*height);
  text("?", .9*width, .3*height);
  //default settings
  click = true;
  add = false;
  sub = false;
  div = false;
  mult = false;
  operator = false;
  thirdclick = false;
  firstclick = false;
  x2 = 1;
}

void draw()
{
  if (mult==true)
  {
    answer = x1 * x2;
  }
  if (div==true)
  {
    answer = x1 / x2;
  }
  if (sub==true)
  {
    answer = x1 - x2;
  }
  if (add == true)
  {
    answer = x1 + x2;
  }
  if (firstclick==true)
  {
    if (mousePressed)
    {
      textSize(8);
      text(x1, .25*width, .1*height);
    }
  }
  if (thirdclick==true)
  {
    if (mousePressed)
    {
      textSize(8);
      text(x2, .35*width, .1*height);
    }
  }
}
void mousePressed()
{
  {
    if (mouseY >= .6*height)
    {
      if (mouseY <= height)
      {
        if (mouseX >= .8*width)
        {
          if (mouseX <= width)
          {
            if (mousePressed)
            {
              firstclick=false;
              textSize(35);
              fill(255);
              rect(.2*width, 0, .6*width, .2*height);
              fill(0);
              text(answer, .6*width, .1*height);
              click = true;
              add = false;
              sub = false;
              div = false;
              mult = false;
              thirdclick = false;
            }
          }
        }
      }
    }
    if (click==true)
    {
      if (mouseX <=.2*width)
      {
        if (mouseX >=0)
        {
          if (mouseY <=.8*height)
          {
            if (mouseY >=.6*height)
            {
              if (mousePressed)
              {
                x1 = 7;
              }
            }
          }
        }
      }
    }
    if (click==true)
    {
      if (mouseX <=.6*width)
      {
        if (mouseX >=.4* width)
        {
          if (mouseY <=.8*height)
          {
            if (mouseY >=.6*height)
            {
              if (mousePressed)
              {
                x1 = 9;
                operator = true;
                firstclick = true;
              }
            }
          }
        }
      }
    }
    if (click==true)
    {
      if (mouseX <=.4*width)
      {
        if (mouseX >=.2*width)
        {
          if (mouseY <=.8*height)
          {
            if (mouseY >=.6*height)
            {
              if (mousePressed)
              {
                x1 = 8;
                operator = true;
                firstclick = true;
              }
            }
          }
        }
      }
    }
    if (click==true)
    {
      if (mouseX <=.6*width)
      {
        if (mouseX >=.4*width)
        {
          if (mouseY <=.6*height)
          {
            if (mouseY >=.4*height)
            {
              if (mousePressed)
              {
                x1 = 6;
                operator = true;
                firstclick = true;
              }
            }
          }
        }
      }
    }
    if (click==true)
    {
      if (mouseX <=.4*width)
      {
        if (mouseX >=.2*width)
        {
          if (mouseY <=.6*height)
          {
            if (mouseY >=.4*height)
            {
              if (mousePressed)
              {
                x1 = 5;
                operator = true;
                firstclick = true;
              }
            }
          }
        }
      }
    }
    if (click==true)
    {
      if (mouseX <=.2*width)
      {
        if (mouseX >=0)
        {
          if (mouseY <=.6*height)
          {
            if (mouseY >=.4*height)
            {
              if (mousePressed)
              {
                x1 = 4;
                operator = true;
                firstclick = true;
              }
            }
          }
        }
      }
    }
    if (click==true)
    {
      if (mouseX <=.6*width)
      {
        if (mouseX >=.4*width)
        {
          if (mouseY <=.4*height)
          {
            if (mouseY >=.2*height)
            {
              if (mousePressed)
              {
                x1 = 3;
                operator = true;
                firstclick = true;
              }
            }
          }
        }
      }
    }
    if (click==true)
    {
      if (mouseX <=.4*width)
      {
        if (mouseX >=.2*width)
        {
          if (mouseY <=.4*height)
          {
            if (mouseY >=.2*height)
            {
              if (mousePressed)
              {
                x1 = 2;
                operator = true;
                firstclick = true;
              }
            }
          }
        }
      }
    }
    if ( click == true)
    {
      if (mouseX <=.2*width)
      {
        if (mouseX >=0)
        {
          if (mouseY <=.4*height)
          {
            if (mouseY >=.2*height)
            {
              if (mousePressed)
              {
                x1 = 1;
                operator = true;
                firstclick = true;
              }
            }
          }
        }
      }
    }
  }
  if (click==false)
  {
    if (mouseX <=.6*width)
    {
      if (mouseX >=.4*height)
      {
        if (mouseY <=.8*height)
        {
          if (mouseY >=.6*height)
          {
            if (mousePressed)
            {
              x2 = 9;
              thirdclick = true;
            }
          }
        }
      }
    }
  }
  if (click==false)
  {
    if (mouseX <=.4*width)
    {
      if (mouseX >=.2*height)
      {
        if (mouseY <=.8*height)
        {
          if (mouseY >=.6*height)
          {
            if (mousePressed)
            {
              x2 = 8;
              thirdclick = true;
            }
          }
        }
      }
    }
  }
  if (click==false)
  {
    if (mouseX <=.2*width)
    {
      if (mouseX >=0)
      {
        if (mouseY <=.8*height)
        {
          if (mouseY >=.6*height)
          {
            if (mousePressed)
            {
              x2 = 7;
              thirdclick = true;
            }
          }
        }
      }
    }
  }
  if (click==false)
  {
    if (mouseX <=.6*width)
    {
      if (mouseX >=.4*width)
      {
        if (mouseY <=.6*height)
        {
          if (mouseY >=.4*height)
          {
            if (mousePressed)
            {
              x2 = 6;
              thirdclick = true;
            }
          }
        }
      }
    }
  }
  if (click==false)
  {
    if (mouseX <=.4*width)
    {
      if (mouseX >=.2*width)
      {
        if (mouseY <=.6*height)
        {
          if (mouseY >=.4*height)
          {
            if (mousePressed)
            {
              x2 = 5;
              thirdclick = true;
            }
          }
        }
      }
    }
  }
  if (click==false)
  {
    if (mouseX <=.2*width)
    {
      if (mouseX >=0)
      {
        if (mouseY <=.6*height)
        {
          if (mouseY >=.4*height)
          {
            if (mousePressed)
            {
              x2 = 4;
              thirdclick = true;
            }
          }
        }
      }
    }
  }
  if (click==false)
  {
    if (mouseX <=.6*width)
    {
      if (mouseX >=.4*width)
      {
        if (mouseY <=.4*height)
        {
          if (mouseY >=.2*height)
          {
            if (mousePressed)
            {
              x2 = 3;
              thirdclick = true;
            }
          }
        }
      }
    }
  }
  if (click==false)
  {
    if (mouseX <=.4*width)
    {
      if (mouseX >=.2*width)
      {
        if (mouseY <=.4*height)
        {
          if (mouseY >=.2*height)
          {
            if (mousePressed)
            {
              x2 = 2;
              thirdclick = true;
            }
          }
        }
      }
    }
  }
  if (click == false)
  { 
    if (mouseX <=.2*width)
    {
      if (mouseX >=0)
      {
        if (mouseY <=.4*height)
        {
          if (mouseY >=.2*height)
          {
            if (mousePressed)
            {
              x2 = 1;
              thirdclick = true;
            }
          }
        }
      }
    }
  }
  if (operator == true)
  {
    if (mouseY >= .6*height)
    {
      if (mouseY <= .8*height)
      {
        if (mouseX >= .6*width)
        {
          if (mouseX <= .8*width)
          {
            if (mousePressed)
            {
              sub = true;
              click = false;
              text("-", .3*width, .1*height);
              operator = false;
              add = false;
              mult = false;
              div = false;
            }
          }
        }
      }
    }
  }
  if ( operator == true)
  {
    if (mouseY >= .4*height)
    {
      if (mouseY <= .6*height)
      {
        if (mouseX >= .6*width)
        {
          if (mouseX <= .8*width)
          {
            if (mousePressed)
            {
              div = true;
              click = false;
              text("/", .3*width, .1*height);
              operator = false;
              add = false;
              sub = false;
              mult = false;
            }
          }
        }
      }
    }
  }
  if (operator == true)
  {
    if (mouseY >= .2*height)
    {
      if (mouseY <= .4*height)
      {
        if (mouseX >= .6*width)
        {
          if (mouseX <= .8*width)
          {
            if (mousePressed)
            {
              mult = true;
              click = false;
              text("*", .3*width, .1*height);
              operator = false;
              add = false;
              sub = false;
              div = false;
            }
          }
        }
      }
    }
  }
  if (operator == true)
  {
    if (mouseY >= .8*height)
    {
      if (mouseY <= height)
      {
        if (mouseX >= .6*width)
        {
          if (mouseX <= .8*width)
          {
            if (mousePressed)
            {
              add = true;
              click = false;
              text("+", .3*width, .1*height);
              operator = false;
              sub = false;
              div = false;
              mult = false;
            }
          }
        }
      }
    }
  }
  if (mouseX <= .2*width)
  {
    if (mouseX >= 0)
    {
      if (mouseY<= .2*height)
      {
        if (mouseY>= 0)
        {
          if (mousePressed)
          {
            click = true;
            add = false;
            sub = false;
            div = false;
            mult = false;
            operator = false;
            thirdclick = false;
            x2 = 1;
            x1 = 0;
            fill(255);
            rect(.2*width, 0, .6*width, .2*height);
          }
        }
      }
    }
  }
  if (click==true)
  {
    if (mouseX>=.8*width)
    {
      if (mouseX<=width)
      {
        if (mouseY>=0)
        {
          if (mouseY<=.2*height)
          {
            if (mousePressed)
            {
              x1 = answer;
              operator = true;
              firstclick = true;
            }
          }
        }
      }
    }
  }
  if (click==true)
  {
    if (mouseX<=.2*width)
    {
      if (mouseX>=0)
      {
        if (mouseY<=height)
        {
          if (mouseY>=.8*height)
          {
            x1=0;
            operator = true;
          }
        }
      }
    }
  }
  if (click==false)
  {
    if (mouseX<=.2*width)
    {
      if (mouseX>=0)
      {
        if (mouseY<=height)
        {
          if (mouseY>=.8*height)
          {
            x2=0;
          }
        }
      }
    }
  }
  if (mouseX>=.4*width)
  {
    if (mouseX<=.6*width)
    {
      if (mouseY>=.8*width)
      {
        if (mouseY<= height)
        {
          if (mousePressed)
          {
            answer = answer * -1;
            textSize(35);
            fill(255);
            rect(.2*width, 0, .6*width, .2*height);
            fill(0);
            text(answer, .6*width, .1*height);
          }
        }
      }
    }
  }
  if (click==true)
  {
    if (mouseX <=width)
    {
      if (mouseX >=.8*width)
      {
        if (mouseY <=.6*height)
        {
          if (mouseY >=.4*height)
          {
            if (mousePressed)
            {
              x1 = PI;
              operator = true;
              firstclick = true;
            }
          }
        }
      }
    }
  }
  if (click==false)
  {
    if (mouseX <=width)
    {
      if (mouseX >=.8*width)
      {
        if (mouseY <=.6*height)
        {
          if (mouseY >=.4*height)
          {
            if (mousePressed)
            {
              x2 = PI;
              thirdclick = true;
            }
          }
        }
      }
    }
  }
}
