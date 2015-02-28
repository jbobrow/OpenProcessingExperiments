
//Ayako Matsuda
//DESMA 28 Winter 2012

float erx;
float elx;
float by= 130;// y-coordinate for pupil both 
float ed = 30; //diameter for ellipse
float erd = ed+20;
float rx = 160; // x-coordinate for pupil right
float lx= 340;// x-coordinate for pupil left
float ey; //y-coordinate for moving pupil both

void setup()
{
  background(200);
  size (500, 500);
  smooth();
  strokeWeight(2);
}

void draw ()
{ 
  float v = map(mouseX, 50, 250, 0, 10);
  float p= map(mouseX, 50, 150, 160, 153);
  float t = map(mouseX, 150, 250, 153, 160);
  float m = map(mouseX, 50, 250, 30, 70);

  if (mouseX< 50)
  {
    //permanent parts 
    //body
    fill(255);
    rect (100, by-80, 300, 400);

    //middle line
    line (100, by+80, 400, by+80);

    fill (150);
    rect (125, by+100, 20, 60);

    //mouth
    quad (220, by+30, 280, by + 30, 300, by+ 30, 200, by + 30);

    //eyes
    fill (0);
    ellipse (160, by, ed, ed);
    ellipse (340, by, ed, ed);

    noFill();
    ellipse (160, by, erd, erd);
    ellipse (340, by, erd, erd);

    //eyebrows
    arc (160, by, erd+30, erd+30, PI*5/4, PI*7/4 );
    arc (340, by, erd+30, erd+30, PI*5/4, PI*7/4);
  }

  else if ((v>=0) && (v<=10))
  {
    //permanent parts 
    //body
    fill(255);
    rect (100, by-80, 300, 400);

    //middle line
    line (100, by+80, 400, by+80);

    fill (150);
    rect (125, by+100, 20, 60);

    //mouth
    quad (220, by+60-m, 280, by + 60-m, 300, by+ m, 200, by + m);
    ey = by+ v;

    //eyebrows
    noFill();
    arc (160, by, erd+30, erd+30, PI*5/4, PI*7/4 );
    arc (340, by, erd+30, erd+30, PI*5/4, PI*7/4);

    //eyes
    fill(255);
    ellipse (160, by, erd, erd);
    ellipse (340, by, erd, erd);

    if ((v>=0) && (v<=5))
    {
      fill (0);
      ellipse (p, ey, ed, ed);
      ellipse (p+180, ey, ed, ed);
    }

    if ((v>=5) && (v<=10))
    {
      fill (0);
      ellipse (t, ey, ed, ed);
      ellipse (t+180, ey, ed, ed);
    }
  }

  if (mouseX> 250)
  {
    background (200);
    //permanent parts 
    //body
    fill(255);
    rect (100, by-80, 300, 400);

    //middle line
    line (100, by+80, 400, by+80);

    fill (150);
    rect (125, by+100, 20, 60);

    //mouth
    quad (220, by-10, 280, by -10, 300, by+ 70, 200, by + 70);

    //eyes
    fill(255);
    ellipse (160, by, erd*1.5, erd*1.5);
    ellipse (340, by, erd*1.5, erd*1.5);

    fill (0);
    ellipse (160, 140, ed*1.75, ed*1.75);
    ellipse (340, 140, ed*1.75, ed*1.75);
    
    line ( 140, 65, 200, 95);
    line ( 360, 65, 300, 95);
  }
}


