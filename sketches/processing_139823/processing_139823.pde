
int trials;
int crosses;
int linewidth;
int needlewidth;
int boardheight;
float tauapprox;
final float tau = 6.28318530717958647692;
void setup()
{
  size(600,800);
  background(255);
  stroke(0);
  linewidth = int(width/20);
  boardheight = height - 200;
  for (int i = 0; i<=width; i+=linewidth)
  { 
    line(i,0,i,boardheight);
  }
  trials = 0;
  crosses = 0;
  needlewidth = linewidth;
  fill(50,50,0);
}

void draw()
{
  int x1 = round(random(width));
  int y1 = round(random(boardheight));
  float theta = random(tau);
  int x2 = round(needlewidth*cos(theta)+x1);
  int y2 = round(needlewidth*sin(theta)+y1);
  trials++;
  
  //check to see if the needle will be on top of one of the lines, if so color it differently
  boolean hit = false;
  for (int i = 0; i<=width; i+=linewidth)
  {
    if ((min(x1,x2) <= i) && (max(x1,x2) > i))
    {
      crosses++;
      hit = true;
    }
  }
  if (hit)
  {
    stroke(0,50,155);
  }
  else
  {
    stroke(0,155,0);
  }
  line(x1,y1,x2,y2);
  tauapprox =((4.0 * needlewidth * trials)/(linewidth * crosses));
  drawUI();
  drawPoints();
}

void drawUI()
{
  PFont f;
  f = createFont("Arial",24,true);
  textFont(f,12);
  String t = "Number of Trials:" + trials + "     ";
  String n = "Tau approximation: " + tauapprox;
  fill(255);
  stroke(255);
  rect(0,height-20,400,20);
  fill(0);
  text(t,3,height-8);
  text(n,150,height-8);
}

void drawPoints()
{
  //draw tau line
  //y pixels available are from boardheight to boardheight + 180
  int taulineH = height - 20 - round(18 * tau);
  stroke(255,0,0);
  line(0,taulineH,width,taulineH);
  
  //The higher the slowdown value, the less points are drawn on
  //the bottom graph
  int slowdown = 3;
  //If the graph is past the width, move it back on screen
  if (round(trials/slowdown) % width == 0)
  {
    fill(255);
    stroke(255);
    rect(0,boardheight,width,180);
  }
  
  //draw points sporadically
  if(trials % slowdown == 0)
  {
    int pointH = height - 20 - round(18 * tauapprox);
    int pointW = round(trials/slowdown) % width;
    stroke(0,55,55);
    point(pointW,pointH);
  }
}

  
