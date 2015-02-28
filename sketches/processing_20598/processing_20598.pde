
float xpos, ypos;
float xspeed,yspeed;
int r =50;

  void setup()
  {
  size (400,400);
  background (0);
  smooth();
  xspeed = 1.2;
  yspeed = 1.3;
  xpos = width/2;
  ypos = height/2;
  }
  void draw()
  {

    int d = day();
    int m = month();
    int y = year();
    if (d == 6 && m == 1)
    {
      PImage cake;
       cake= loadImage ("cake.jpg");
       image(cake, 80,80);

    }
    else 
    {
            background (0);
      xpos +=xspeed;
      ypos +=yspeed;
      String t =  "Today is :  " + nf(m,2) + "/" + nf(d,2) + "/" + nf(y,2) + "   Not your B-Day!";
      text (t, xpos, ypos);

      
      if( (ypos > height-r) || (ypos < r))
  {
    yspeed *= -1;
  }
  if( (xpos > width-r) || (xpos < r))
  {
    xspeed *= -1;
  }

    }
    
  }

