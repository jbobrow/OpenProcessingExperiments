
Branch[] branches;
int numb;


void setup()
{
  size(500, 700);
  smooth(8);

  makeBranches();
}


void draw()
{
  for (int i = 0; i < numb; i++)
  {
    branches[i].display();
  }
}

void makeBranches()
{
  background(30, 30, random(8, 32));
  numb = (int)random(4, 23);
  branches = new Branch[numb];
  
  float fatness = random(1, 2);
  for (int i = 0; i < numb; i++)
  {
    branches[i] = new Branch(new PVector(random(20, width - 20), height - random(20)));
    branches[i].leafFatness = fatness;
  }
}

void mouseClicked()
{
  makeBranches();
}

void keyPressed()
{
  saveFrame("####.jpg");
}

class Branch
{
  PVector pos;

  int nodes;
  float[] x, y;
  color[] nodeColours;
  float internode; //vertical dist between nodes
  float wiggle; // wonkiness

  int leaves;
  color[] leafColours;
  float[] leafRotations;
  float[] leafScales;
  float leafFatness;


  Branch(PVector pos)
  {
    this.pos = pos;
    init();
  }

  void init()
  {
    nodes = (int)random(21, 35);
    internode = (height - 100) / nodes - random(nodes/5);
    wiggle = random(0.03, 0.07);    
    x = new float[nodes];
    y = new float[nodes];
    nodeColours = new color[nodes];

    x[0] = 0;
    y[0] = 0;

    for (int i = 1; i < nodes; i++)
    {
      x[i] = x[i - 1] + i * wiggle * random(-10, 10);
      y[i] = -internode * i;
      nodeColours[i] = color(random(32), random(140, 200), 0);
    }

    leaves = int(random(9, 21));

    leafColours = new color[leaves];
    leafRotations = new float[leaves];
    leafScales = new float[leaves];
    for (int i = 0; i < leaves; i++)
    {
      leafColours[i] = color(random(196), random(140, 200), 0);
      leafRotations[i] = random(PI, TWO_PI);
      leafScales[i] = random(0.025, 0.030) * (leaves + i);
    }
  }

  void display()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    for (int i = 1; i < nodes; i++)
    {
      drawStem(i);
    }
    for (int i = 0; i < leaves; i++)
    {
      drawLeaf(i);
    }
    popMatrix();
  }

  void drawStem(int i)
  {
    stroke(nodeColours[i]);
    line(x[i], y[i], x[i - 1], y[i - 1]);
  }  

  void drawLeaf(int i)
  {
    noStroke();
    fill(leafColours[i]);

    pushMatrix();
    translate(x[nodes - i - 1], y[nodes - i - 1]);
    rotate(leafRotations[i]);
    scale(leafScales[i]/leafFatness, leafScales[i]*leafFatness);
    curve(-50, 50, 0, 0, 100, 0, 150, 50);
    curve(-50, -50, 0, 0, 100, 0, 150, -50);
    popMatrix();
  }
}



