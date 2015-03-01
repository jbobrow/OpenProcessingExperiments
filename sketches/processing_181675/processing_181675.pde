
Circle c1;
String pi = "3.1.4.1.5.9.2.6.5.3.5.8.9.7.9.3.2.3.8.4.6.2.6.4.3.3.8.3.2.7.9.5.0.2.8.8.4.1.9.7.1.6.9.3.9.9.3.7.5.1.0.5.8.2.0.9.7.4.9.4.4.5.9.2.3.0.7.8.1.6.4.0.6.2.8.6.2.0.8.9.9.8.6.2.8.0.3.4.8.2.5.3.4.2.1.1.7.0.6.7.9.8.2.1.4.8.0.8.6.5.1.3.2.8.2.3.0.6.6.4.7.0.9.3.8.4.4.6.0.9.5.5.0.5.8.2.2.3.1.7.2.5.3.5.9.4.0.8.1.2.8.4.8.1.1.1.7.4.5.0.2.8.4.1.0.2.7.0.1.9.3.8.5.2.1.1.0.5.5.5.9";
int [] term = int(split(pi, '.')); 
int n = 0; // this is later used as a counter to cycle int term through the 180 digits of pi.

void setup()
{
  size(950, 950); 
  background(0); 
  c1 = new Circle();
}


void draw()
{
  c1.drawCircles();
}


class Circle
{
  float xpos;
  float ypos;
  float yheight;
  float xwidth;


  Circle()
  {
    xwidth = 1;
    yheight = 1;
    xpos = 450;
    ypos = 450;
  }
  Circle (float x, float y, float w, float h)
  {
    xwidth = w;
    yheight = h;
    xpos = x;
    ypos = y;
  }


  void drawCircles()
  {
    noFill();

    while (n < 181) 
    {
      calculateColor();
      rectMode(CENTER);                
      //rect(475,475,xwidth,yheight);   //this is an alternate setting which displays the digits of pi as a square instead of a circle.
      ellipse(475, 475, xwidth, yheight);
      xwidth += 5;
      yheight += 5;
      n+=1; // the next time this loops, the next digit of Pi will be used.
    }
  }
}





void calculateColor() // this is where the color is determined for the next circle / rectangle.

{
  if (term[n]== 0)  // " if the nth term of pi is a zero"
  {
    stroke(51, 2, 245); //Dark Blue
  }

  if (term[n]== 1)   // " if the nth term of pi is 1"
  {
    stroke(255);   // draw in White
  }

  if (term[n]== 2)   // " if the nth term of pi is  2"
  {
    stroke(0, 196, 16); // draw in Green
  }

  if (term[n]== 3)   // " if the nth term of pi is 3"
  {
    stroke(173, 115, 5); // draw in Brown
  }

  if (term[n]== 4)  // " if the nth term of pi is 5"
  {
    stroke(255, 132, 0); // draw in Orange
  }

  if (term[n]== 5) // " if the nth term of pi is 6"
  {
    stroke(0); // draw in Black
  }

  if (term[n]== 6) // " if the nth term of pi is 7"
  {
    stroke(255, 0, 0); // draw in Red
  }

  if (term[n]== 7) // " if the nth term of pi is 8"
  {
    stroke(250, 242, 2); // draw in Yellow
  }

  if (term[n]== 8) // " if the nth term of pi is 9"
  {
    stroke(148, 2, 245); // draw in Purple
  }

  if (term[n]== 9) // " if the nth term of pi is 0"
  {
    stroke(1, 227, 252); // draw in Light Blue
  }
}



