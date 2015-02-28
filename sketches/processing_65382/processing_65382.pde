
int speed = 5;
int numbranches = 120;
int fgcolor = 0;
int bgcolor = 255;
Branch[] branches;

void setup() 
{
  size(800, 800, JAVA2D);
  smooth();
  background(bgcolor);
  
  branches = new Branch[numbranches];
  for (int i = 0; i < numbranches; i++) 
  {
    float base_angle = map(i, 0, numbranches, 0, TWO_PI);
    branches[i] = new Branch(base_angle);
  }
}

void draw() 
{
  fill(bgcolor);
  noStroke();
  rect(4, 0, 50, 40);
  fill(fgcolor);
  text("restart", 5, 16);
  text("invert", 5, 40);
  
  translate(width/2, height/2);
  for (int i = 0; i < numbranches; i++)
    branches[i].draw();
}


class Branch 
{  
  PVector prev, pos;
  float angle, rad;
  float strokeW, alph;
  
  float xmargin, ymargin, noisex, noisey;
  float max_xmargin, max_ymargin, max_strokewidth, max_radius;

  float t;
  int numgenerations, n;
  
  Branch(float angle) 
  {
    this.angle = angle;
    numgenerations = (int) random(3200, 7800);    
    
    max_xmargin = random(120, 240);
    max_ymargin = random(120, 240);
    max_radius = random(350, 400);
    max_strokewidth = random(4, 8);
    
    noisex = random(10);
    noisey = random(10);
    
    pos = new PVector();
    prev = new PVector();
  }
  
  void draw() 
  {
    for (int i = 0; i < speed; i++) 
    {
      t = map(n, 0, numgenerations, 0, 1);
      if (t < 1.0) 
      {
        rad = lerp(0, max_radius, t);
        alph = lerp(20, 0, t);
        strokeW = lerp(max_strokewidth, 0, t);
        xmargin = lerp(0, max_xmargin, t);  
        ymargin = lerp(0, max_ymargin, t);        
        pos.x = rad * cos(angle) + xmargin * (noise(noisex) - 0.5);
        pos.y = rad * sin(angle) + ymargin * (noise(noisey) - 0.5);
    
        stroke(fgcolor, alph);
        strokeWeight(strokeW);
        line(prev.x, prev.y, pos.x, pos.y);

        noisex += 0.001;
        noisey += 0.001;
        prev = pos;
        n++;
      }
    }
  } 
}

void mousePressed() {
  if (mouseX < 50 && mouseY < 16) setup();
  if (mouseX < 50 && mouseY > 16 && mouseY < 40) {
    fgcolor = 255 - fgcolor;
    bgcolor = 255 - bgcolor;
    setup();  
  }
}

