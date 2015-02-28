
void fleche(PVector pos, PVector res)
{
  translate(pos.x, pos.y);
  line(0, 0, res.x, res.y);
  float ori = atan2(res.y, res.x);
  translate(+res.x, +res.y);
  line(0, 0, res.mag()/4*cos(ori+5*PI/6), res.mag()/4*sin(ori+5*PI/6+3*PI/12));
  line(0, 0, res.mag()/4*cos(ori-5*PI/6), res.mag()/4*sin(ori-5*PI/6-3*PI/12));
  translate(-res.x, -res.y);
  translate(-pos.x, -pos.y);
}

int n = 15;
float lim = 30;
void setup()
{
  size(500, 500);
  background(200);
  smooth();
  ellipseMode(CENTER);
  pause = false;
  
  aff_mass();
  aff_champ();
}

void draw()
{
  background(200);
  aff_mass();
  aff_champ();
  
  pos_masses[1] = new PVector(mouseX, mouseY);
  
}

PVector[] pos_masses = {new PVector(100, 200), new PVector(300, 100)};
float[] m_masses = {100, 300};
int K = 1000;
boolean pause;

PVector force(PVector loc)
{
  PVector forc = new PVector(0, 0);
  for (int i = 0; i < pos_masses.length; i++)
  {
    PVector ui = PVector.add(pos_masses[i], PVector.mult(loc, -1)); ui.normalize();
    float ri = sqrt(sq(pos_masses[i].x - loc.x) + sq(pos_masses[i].y - loc.y));
    PVector fi = PVector.mult(ui, +K/(sq(ri)));
    fi = PVector.mult(fi, m_masses[i]);
    forc.add(fi);
  }
  return(forc);
}

void aff_mass()
{
  for (int i = 0; i < pos_masses.length; i++)
    {ellipse(pos_masses[i].x, pos_masses[i].y, m_masses[i]/10, m_masses[i]/10);}
}

void aff_champ()
{
  for (int i = 0; i < n; i++)
  {
    for (int j = 0; j < n; j++)
    {
      PVector posij = new PVector(30 + i*(width-60)/n, 30 + j*(height-60)/n);
      PVector forcee = force(posij);
      if (forcee.mag() > lim) {forcee.normalize(); forcee = PVector.mult(forcee, lim);}
      fleche(posij, forcee);
    }
  }
}
void keyPressed()
{
  if (keyCode == ENTER)
  {
    if (pause) {loop();} else {noLoop();}
    pause = !pause;
  }
}

