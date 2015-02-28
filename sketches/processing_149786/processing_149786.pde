
/*
    CA
 Geometry: square grid
 Definitions of neighbours:
 Moore or Von Neumann
 World Geometry
 Number of *species*
 Variable/updates: continuous or discrete?
 Temporary variables for storage of future states
 */

int x_start_low = 60;
int x_start_high = 110;
int y_start_low = 70;
int y_start_high = 90;

int stable_level = 2;
int settle_level = 6;

int small_map = 1;
int pressed  = 0;
int mode = 0;
static int STOP = 0;
static int GO = 1;
static int SET = 2;
static int DONE = 3;

PImage img;


Cell [][] cells;
//for a n x n array
int n=200;

void setup()
{
  size(900, 800);
  cells= new Cell[n][n];

  img=loadImage("Help.jpg");

  setButtons();


  int cellSize= width/n;

  PImage map;
  if (small_map == 1) {
    map = loadImage("Thames2.png");
  } 
  else if (small_map == 2) {
    map = loadImage("Thames3.png");
  } 
  else {
    map = loadImage("Thames2.png");
  }

  float x_center_point = (x_start_high+x_start_low)/2.0;
  float y_center_point = (y_start_high+y_start_low)/2.0;
  float x_width = x_start_high-x_start_low;
  float y_width = y_start_high-y_start_low;
  float len = 0;
  float elip = 0;

  for (int i=0;i<n;i++)
  {
    for (int j=0;j<n;j++)
    {
      len = sqrt(sq(i-x_center_point) + sq(j-y_center_point));
      elip = sqrt(sq(0.5*y_width*sin(atan((j-y_center_point)/(i-x_center_point)))) + sq(0.5*x_width*cos(atan(-(j-y_center_point)/(i-x_center_point)))));
      cells[i][j]=new Cell(i*cellSize, j*cellSize, cellSize);
      if (len < elip)
      {
        if (random(1)<0.2) { 
          cells[i][j].state=1;
        }
        else {
          cells[i][j].state=0;
        }
      }
      int b= map.get(i*4+2, j*4+2) & 0x000000ff; //SIZE CHANGE IF GRID CHANGE

      if (b>200)
      {
        cells[i][j].state=0;
        cells[i][j].river=1;
        cells[i][j].city=0;
      }
      else {
        cells[i][j].river=0;
        cells[i][j].city=0;
      }
    }
  }
  frameRate(20);
}

void draw()
{

 // setButtons();
  if (mode == GO) {

    update();
    for (int i=0;i<n;i++)
    {
      for (int j=0;j<n;j++)
      {
        cells[i][j].display();
      }
    }
  }
  else if (mode == STOP) 
  {
    for (int i=0;i<n;i++)
    {
      for (int j=0;j<n;j++)
      {
        cells[i][j].display();
      }
    }
  }
  else if (mode == SET || mode == DONE) 
  {
    for (int i=0;i<n;i++)
    {
      for (int j=0;j<n;j++)
      {
        cells[i][j].display();
      }
    }
    if (mode == SET) {
      ellipseMode(CORNERS);
      fill(128, 100);
      if (x_start_low > (mouseX/4) && y_start_low > (mouseY/4))
      {
        ellipse(1.0*mouseX, 1.0*mouseY, 4.0*x_start_high, 4.0*y_start_high);
      }
      else if (x_start_low > (mouseX/4) && y_start_high < (mouseY/4))
      {
        ellipse(1.0*mouseX, 4.0*y_start_low, 4.0*x_start_high, 1.0*mouseY);
      }
      else if (x_start_high < (mouseX/4) && y_start_low > (mouseY/4))
      {
        ellipse(4.0*x_start_low, 1.0*mouseY, 1.0*mouseX, 4.0*y_start_high);
      }
      else if (x_start_high < (mouseX/4) && y_start_high < (mouseY/4))
      {
        ellipse(4.0*x_start_low, 4.0*y_start_low, 1.0*mouseX, 1.0*mouseY);
      }
      ellipseMode(CENTER);
    }
  }
  if (pressed == 1) image(img, 200, 200, 400, 400);
   

    
    setButtons();
          textSize(30);
  fill(255);
  rect(835, 330, 30, 30);
  rect(835, 460, 30, 30);
  fill(0);
  text(stable_level, 840, 357);
  text(settle_level, 840, 487);
}

void update()
{
  for (int i=0;i<n;i++)
  {
    for (int j=0;j<n;j++)
    {
      int a=(j-1);  //works out edge cases- if j=0 (0-1+10)%10 ==9 (puts neighbour in 9
      int b=(j+1);
      int c=(i-1);
      int d=(i+1);

      /*Normal Neighbours
       cells[i][j-1]=> cells[i][a]
       cells[i][j+1]=> cells[i][b]
       cells[i-1][j]=> cells[c][j]
       cells[i+1][j]=> cells[d][j]
       
       Diagonals
       cells[i-1][ji1]=> cells[c][a]
       cells[i+1][j-1]=> cells[d][a]
       cells[i-1][j+1]=> cells[c][b]
       cells[i+1][j+1]=> cells[d][b]
       */
      if (cells[i][j].river ==0) {
        float neighbourscore=0;
        if (a >= 0) neighbourscore+= cells[i][a].state;
        if (b < n) neighbourscore+= cells[i][b].state;
        if (c >= 0) neighbourscore+= cells[c][j].state;
        if (d < n) neighbourscore+= cells[d][j].state;
        if (a >= 0 && c >= 0) neighbourscore+= cells[c][a].state;
        if (a >= 0 && d < n) neighbourscore+= cells[d][a].state;
        if (b < n && c >= 0) neighbourscore+= cells[c][b].state;
        if (b < n && d < n) neighbourscore+= cells[d][b].state;


        float riverscore=0;
        if (a >= 0) riverscore+= cells[i][a].river;
        if (b < n) riverscore+= cells[i][b].river;
        if (c >= 0) riverscore+= cells[c][j].river;
        if (d < n) riverscore+= cells[d][j].river;
        if (a >= 0 && c >= 0) riverscore+= cells[c][a].river;
        if (a >= 0 && d < n) riverscore+= cells[d][a].river;
        if (b < n && c >= 0) riverscore+= cells[c][b].river;
        if (b < n && d < n) riverscore+= cells[d][b].river;

        if (a >= 0) riverscore+= cells[i][a].city;
        if (b < n) riverscore+= cells[i][b].city;
        if (c >= 0) riverscore+= cells[c][j].city;
        if (d < n) riverscore+= cells[d][j].city;
        if (a >= 0 && c >= 0) riverscore+= cells[c][a].city;
        if (a >= 0 && d < n) riverscore+= cells[d][a].city;
        if (b < n && c >= 0) riverscore+= cells[c][b].city;
        if (b < n && d < n) riverscore+= cells[d][b].city;

        //Conways game of life rules
        if (riverscore<stable_level && neighbourscore<stable_level )  cells[i][j].nextState= 0; //neighbour and river/city <2 DIES
        if (riverscore==stable_level || neighbourscore==stable_level)cells[i][j].nextState= cells[i][j].state; //river/city 2 and neighbour 2- stays the same
        if (riverscore>stable_level && riverscore <settle_level && cells[i][j].state==1) cells[i][j].city=1; //river city 3,4,5 and state=1, builds a city. Settles if room to settle, if 6 river/city already, it is too overcrowded to settle
        if (neighbourscore==(stable_level+1)) cells[i][j].nextState= 1; //neighbour 3, next state = 1- NEW BORN
        if (neighbourscore>(stable_level+1) && riverscore<(stable_level+2))  cells[i][j].nextState= 0; //neighbour > 3 and river/city <3 DIES- Overcrowding outside city dies. If Low numbers dies if lots of city, high number . Overcrowding near a city can stay alive (live of city per sey). 4 looks most city like
      }
    }
  }

  for (int i=0;i<n;i++)
  {
    for (int j=0;j<n;j++)
    {
      cells[i][j].state=cells[i][j].nextState;
    }
  }
}



class Cell
{
  float state, nextState, river, city;
  int x, y;
  int csize;

  Cell(int xin, int yin, int sizein)
  {
    x=xin;
    y=yin;
    csize=sizein;
  }


  void display()
  {
    stroke(150);
    if (state==0) {
      noStroke();
      fill(255);//255*state
    }
    if (state==1) {
      fill(0);//255*state
    }
    if (city==1) {
      stroke(142, 16, 16);
      fill(173, 63, 63);
    }     
    if (river==1) {
      noStroke();
      fill(0, 0, 255);
    }
    rect(x, y, csize, csize);
  }
}

void mousePressed()
{
  if (mouseX > 825 && mouseX < 875 && mouseY > 40 && mouseY <90)
  {
    mode = GO;
  } 
  else if (mouseX > 825 && mouseX < 875 && mouseY > 120 && mouseY <170)
  {
    mode = STOP;
  }
  else if (mouseX > 825 && mouseX < 875 && mouseY > 200 && mouseY < 250)
  {
    mode = DONE;
    x_start_low = 75;
    x_start_high = 125;
    y_start_low = 75;
    y_start_high = 125;
  }
  else if ((mode == SET || mode == DONE) && mouseX > 0 && mouseX < 800 && mouseY > 0 && mouseY < 800)
  {
    mode = SET;
    x_start_low = (mouseX/4);
    x_start_high = (mouseX/4);
    y_start_low = (mouseY/4);
    y_start_high = (mouseY/4);
  }
  else if (mouseX > 840 && mouseX < 880 && mouseY > 300 && mouseY < 320)
  {
    if (stable_level < 7) stable_level++;
  }
  else if (mouseX > 840 && mouseX < 880 && mouseY > 370 && mouseY < 390)
  {
    if (stable_level > 1) stable_level--;
  }
  else if (mouseX > 840 && mouseX < 880 && mouseY > 430 && mouseY < 450)
  {
    if (settle_level < 9) settle_level++;
  }
  else if (mouseX > 840 && mouseX < 880 && mouseY > 500 && mouseY < 520)
  {
    if (settle_level > 3) settle_level--;
  }
}


void mouseReleased()
{
  if (mouseX > 825 && mouseX < 875 && mouseY > 550 && mouseY <600)
  {
    if (small_map == 2) { 
      small_map = 1;
    }
    else if (small_map == 1) {
      small_map = 2;
    }
    fill(21, 93, 149);
    rect(825, 550, 50, 50);
    fill(255);
    textSize(16);
    text("MAP", 836, 570);
    text("  "+small_map, 836, 590);
  }
  else if ((mode == SET) && mouseX > 0 && mouseX < 800 && mouseY > 0 && mouseY < 800)
  {
    if (x_start_low > (mouseX/4))
    {
      x_start_low = (mouseX/4);
    }

    if (x_start_high < (mouseX/4))
    {
      x_start_high = (mouseX/4);
    }

    if (y_start_low > (mouseY/4))
    {
      y_start_low = (mouseY/4);
    }

    if (y_start_high < (mouseY/4))
    {
      y_start_high = (mouseY/4);
    }
    mode = DONE;
    setup();
  }
}
void keyPressed() {
  if (key==' ') {
    pressed = 1;
  }
}

void keyReleased() {
  pressed = 0;
}

void setButtons()
{
  fill(24, 201, 78);
  rect(825, 40, 50, 50);
  fill(206, 44, 44);
  rect(825, 120, 50, 50);
  fill(21, 93, 149);
  rect(825, 200, 50, 50);

  fill(255);
  textSize(16);
  text("GO", 838, 70);
  text("STOP", 830, 150);
  text("SET", 836, 230);

  fill(0);
  textSize(16);
  text("Clustering", 810, 290);
  fill(255);
  rect(840, 300, 20, 20);
  rect(835, 330, 30, 30);
  rect(840, 370, 20, 20);
  fill(206, 44, 44);
  triangle(842, 318, 858, 318, 850, 302);
  triangle(842, 372, 858, 372, 850, 388);

  fill(0);
  text("Settling", 810, 420);
  fill(255);
  rect(840, 430, 20, 20);
  rect(835, 460, 30, 30);
  rect(840, 500, 20, 20);
  fill(206, 44, 44);
  triangle(842, 448, 858, 448, 850, 432);
  triangle(842, 502, 858, 502, 850, 518);

  fill(21, 93, 149);
  rect(825, 550, 50, 50);
  fill(255);
  textSize(16);
  text("MAP", 836, 570);
  text("  "+small_map, 836, 590);

  fill(0);
  text("For Help", 815, 650);
  text("press SPACE", 801, 680);
}


