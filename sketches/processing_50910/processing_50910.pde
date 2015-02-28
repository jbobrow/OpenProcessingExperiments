
// 48-257, bumyeolk_HW5
// Bumyeol Kim, Copyright 2012

float x, y, wd, ht;
color a, b, c, d, e, f, g;

void setup( )
{
  size (600, 600);
  smooth ( );
    x = 200;
    y = 200;  
    wd = 200;
    ht = 200;
    a = #FFA112;
    b = #1FFF7A;
    c = #4A92F5;
    d = #A2C2FF;
    e = #FF4400;
    f = #4B4B4B;
    g = #BF8D28;
}

// move around the mouse to change the form and location
void draw( )
{
  background(d);
  initials (400-mouseX, 400-mouseY, 400-mouseX, 400-mouseY);
}

// change the stroke color
void mouseClicked()
{   
  // change the stroke color
  if (mouseButton == LEFT)
  {
    a = color (random(255), random(255), random(255));
    b = color (random(255), random(255), random(255));
    c = color (random(255), random(255), random(255));
    e = color (random(255), random(255), random(255));
    g = color (random(255), random(255), random(255));
  }
  // show only initial background by coloring everything same
  if (mouseButton == RIGHT)
  {
    a = #A2C2FF;
    b = #A2C2FF;
    c = #A2C2FF;
    d = #A2C2FF;
    e = #A2C2FF;
    f = #A2C2FF;
    g = #A2C2FF;
  }
}

// change the background color
void keyPressed( )
{
  if (keyPressed == true)
  {
    d = color (random(255), random(255), random(255));
    f = color (random(255), random(255), random(255));
  }
}
    
// initials
void initials (float x, float y, float wd, float ht)
{
  strokeWeight(15);
  stroke(e);
  fill(f);
  ellipse(x, y, 2*wd-15, 2*ht-15);

  strokeWeight(10);
  stroke(g);
  line(x-(wd/2)-30, y-(ht/2)-30, x-(wd/2)-30, y+(ht/2)+30);
  line(x-(wd/2)-30, y+(ht/2)+30, x+(wd/2)+30, y+(ht/2)+30);
  line(x+(wd/2)+30, y-(ht/2)-30, x+(wd/2)+30, y+(ht/2)+30);
  line(x-(wd/2)-30, y-(ht/2)-30, x+(wd/2)+30, y-(ht/2)-30);

// first
  beginShape( );
  strokeWeight(15);
  stroke(a);
  vertex(x-(wd/2), y-(ht/2));
  vertex(x-(wd/2), y+(ht/2));
  vertex(x+(wd/4), y+(ht/2));
  vertex(x-(wd/2)+5, y);
  vertex(x+(wd/4), (y-(ht/2)));
  vertex(x-(wd/2), y-(ht/2));
  endShape( );

// second
  strokeWeight(15);
  stroke(b);
  line((x-(wd/2)) + 20, (y-(ht/2)), (x-(wd/2)) + 20, (y-(ht/2)) + ht);
  line((x-(wd/2)) + 25, (y-(ht/2)) + (ht/2), x+(wd/4) + 20, (y-(ht/2)));

// third
  strokeWeight(15);
  stroke(c);
  line((x-(wd/2)) + 40, (y-(ht/2)), (x-(wd/2)) + 40, (y-(ht/2)) + ht);
  line((x-(wd/2)) + 45, (y-(ht/2)) + (ht/2), x+(wd/4) + 40, (y-(ht/2)));
  line((x-(wd/2)) + 45, (y-(ht/2)) + (ht/2), x+(wd/4) + 40, (y-(ht/2)) + ht);
}

