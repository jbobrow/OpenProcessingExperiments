
//Ayako Matsuda
//DESMA 28 Winter 2012


void setup()
{
  background(200); // set gray background
  size (500, 500); // dimensions of the display window
  smooth(); // anti-alias lines
  strokeWeight(2); // set width of line strokes
}

void draw()
{

  float erx;
  float elx;
  float by= 130;// y-coordinate for pupil both 
  float ed = 30; //diameter for ellipse
  float erd = ed+20;
  float rx = 160; // x-coordinate for pupil right
  float lx= 340;// x-coordinate for pupil left
  float ey; //y-coordinate for moving pupil both
  float rs; // rescale for eyes (pupil)
  float rs2; // rescale for eyes (white)

  //permanent parts
  background (255);
  fill(100, 300, 0, 20);
  rect (0, 0, width, 350);
  fill (300, 200, 0, 75);
  rect (0, 350, width, 150); 

  float darken = map (mouseX, 125, 200, 0, 100);
  darken = constrain (darken, 0, 100);

  //quad (410, 460, 
  //400 - xradius*cos(angle), 450 + yradius*sin(angle))

  noStroke();
  fill(200, 50 + darken/25);
  quad (400, 50, width + 50, 350, width + 50, 350, 400, 450);


  stroke(0);

  //body
  fill(255); // set color used to fill shapes
  rect (100, by-80, 300, 400);

  //middle line
  line (100, by+80, 400, by+80);

  fill (150);
  rect (125, by+100, 20, 60);

  //inside
  fill (255);
  rect (100, by +80, 300, 240);


  //mouth
  float m = map(mouseX, 50, 250, 30, 70);
  m = constrain (m, 30, 70);
  fill(150);
  quad (220, by+60-m, 280, by + 60-m, 300, by+ m, 200, by + m);

  //eyes
  float v = map(mouseX, 50, 250, 0, 10);
  v = constrain (v, 0, 10);
  ey = by+ v;

  float p = map(mouseX, 50, 150, 160, 153);
  p = constrain (p, 153, 160);

  float t = map(mouseX, 150, 250, 153, 160);
  t = constrain (t, 153, 160);

  //eyes-white part
  float s = map (mouseX, 150, 250, 1, 1.75);
  s = constrain (s, 1, 1.75);
  float s2 = map (mouseX, 150, 250, 1, 1.5);
  s2 = constrain (s2, 1, 1.5);
  rs2 = erd * s2;
  fill(255);
  ellipse (160, by, rs2, rs2);
  ellipse (340, by, rs2, rs2);


  //eyes-pupil
  rs = ed * s;
  if (mouseX>150) 
  {
    p = t;
  }
  fill (0);
  ellipse (p, ey, rs, rs);
  ellipse (p+180, ey, rs, rs);


  //inside
  float inside = map (mouseX, 50, 200, 0, 260);
  inside = constrain (inside, 0, 260);
  float lighten = map (mouseX, 50, 200, 255, 0);
  lighten = constrain (lighten, 0, 255);
  float inside2 = constrain (inside, 0, 255);
  float inside3 = constrain (inside, 0, 150);
  fill (inside);
  rect (120, by +100, 260, 200);
  line (120, by + 225, 120 + 260, by + 225);

  //tomato/shape
  float stretch = map (mouseX, 260, 320, 0, 50);
  stretch = constrain (stretch, 0, 50);
  float stretch2 = map (mouseX, 320, 380, 0, 50);
  stretch2 = constrain (stretch2, 0, 50);
  float stretch3 = map (mouseX, 380, 440, 0, 50);
  stretch3 = constrain (stretch3, 0, 50);
  float stretch4 = map (mouseX, 440, 500, 0, 50);
  stretch4 = constrain (stretch4, 0, 50);

  //head
  noStroke();
  fill(inside2, 0, 0);
  ellipse (150, by+ 205- stretch/2, 40, 35+ stretch);
  ellipse (210, by+ 205- stretch2/2, 40, 35+ stretch2);
  ellipse (270, by+ 205- stretch3/2, 40, 35+ stretch3);
  ellipse (330, by+ 205- stretch4/2, 40, 35+ stretch4);

  //tomato mouth
  fill(0);
  ellipse (150, by+ 210- stretch/2, 15, stretch);
  ellipse (210, by+ 210- stretch2/2, 15, stretch2);
  ellipse (270, by+ 210- stretch3/2, 15, stretch3);
  ellipse (330, by+ 210- stretch4/2, 15, stretch4);

  //tomato eyes
  noStroke();
  fill(255);
  ellipse (150 - 10, by+ 205- stretch, 5, 5);
  ellipse (150 + 10, by+ 205- stretch, 5, 5);
  ellipse (210 - 10, by+ 205- stretch2, 5, 5);
  ellipse (210 + 10, by+ 205- stretch2, 5, 5);
  ellipse (270 - 10, by+ 205- stretch3, 5, 5);
  ellipse (270 + 10, by+ 205- stretch3, 5, 5);
  ellipse (330 - 10, by+ 205- stretch4, 5, 5);
  ellipse (330 + 10, by+ 205- stretch4, 5, 5);

  fill (0);
  ellipse (150 - 10, by+ 205- stretch, 3, 3);
  ellipse (150 + 10, by+ 205- stretch, 3, 3);
  ellipse (210 - 10, by+ 205- stretch2, 3, 3);
  ellipse (210 + 10, by+ 205- stretch2, 3, 3);
  ellipse (270 - 10, by+ 205- stretch3, 3, 3);
  ellipse (270 + 10, by+ 205- stretch3, 3, 3);
  ellipse (330 - 10, by+ 205- stretch4, 3, 3);
  ellipse (330 + 10, by+ 205- stretch4, 3, 3);

  //tomato head
  fill(0, inside3, 0);
  ellipse (150, by+ 190- stretch, 10, 2);
  ellipse (210, by+ 190- stretch2, 10, 2);
  ellipse (270, by+ 190- stretch3, 10, 2);
  ellipse (330, by+ 190- stretch4, 10, 2);

  stroke(0);

  //eyebrows FIX
  float ebscale = map (mouseX, 150, 250, 0, 30);
  ebscale = constrain (ebscale, 0, 30);
  if (mouseX<250)
  {
    noFill();
    arc (160, by, erd+30 +ebscale, erd+30+ebscale, PI*5/4, PI*7/4 );
    arc (340, by, erd+30+ebscale, erd+30+ebscale, PI*5/4, PI*7/4);
  }
  else
  {
    line ( 140, 65, 200, 95);
    line ( 360, 65, 300, 95);
  }

  //door open 
  float xradius = 300;
  float yradius = 30;
  float zradius = 30;
  float angle = map(mouseX, 50, 200, 0, PI/2);
  angle = constrain (angle, 0, PI/2);
  float angle2 = map (mouseX, 70, 200, 0, PI/2);
  angle2 = constrain (angle2, 0, PI/2);

  //light 
  float aradius = 350;
  float bradius = 100;
  float pmove = map (mouseX, 80, 120, 0, PI/2);
  pmove = constrain (pmove, 0, PI/2);

  if ((mouseX<120) && (mouseX>80))
  {
    noStroke();
    fill (255, 90+ ebscale*2);
    triangle (170 - (bradius/2)*sin(pmove), by + 300, 140+ 230*sin(angle2), by + 300, 
    bradius*sin(angle2), 450 + bradius*sin(angle2));
  }

  else if (mouseX>=120)
  {
    noStroke();
    fill (255, 90+ ebscale*3);
    quad (120, by + 300, 140 + 230*sin(pmove), by + 300, 
    400 - aradius*cos(angle2) - zradius*sin(angle2), 500, 50, 500);
  }

  //door open
  stroke (0);
  fill (lighten);
  quad (400 - xradius*cos(angle), by+80 - yradius*sin(angle), 
  400, by+80, 
  400, 450, 
  400 - xradius*cos(angle), 450 + yradius*sin(angle) );

  fill(200);
  quad(400 - xradius*cos(angle) - zradius*sin(angle), by+80 - yradius*sin(angle2), 
  400 - xradius*cos(angle), by+80 - yradius*sin(angle), 
  400 - xradius*cos(angle), 450 + yradius*sin(angle), 
  400 - xradius*cos(angle) - zradius*sin(angle), 450 + yradius*sin(angle2) );

  //handle
  fill(120);
  noStroke();
  float rotation = map(mouseX, 25, 50, 0, PI/2);
  rotation = constrain (rotation, 0, PI/2);
  float rotx= map (mouseX, 25, 50, 0, 30);
  rotx = constrain (rotx, 0, 30);

  if (mouseX<=25)
  {
    ellipse (130, 245, 35, 35);
    ellipse (160, 245, 80, 20);
  }
  else if ((mouseX>25) && (mouseX<50))
  {
    ellipse (130, 245, 35, 35);
    translate (160-rotx, 245+rotx);
    rotate (rotation);
    ellipse (0, 0, 80, 20);
  }
  else if (mouseX>50) 
  {
    ellipse (410 - 280*cos(angle), 245, 35*cos(angle), 35);
    ellipse ( 410 - 280*cos(angle), 245 + rotx, 20, 80);
  }
}


