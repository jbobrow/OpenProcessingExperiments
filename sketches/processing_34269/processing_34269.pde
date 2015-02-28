
/*
MorpHoH v0.8
MorpHoH (more-foe) is an interactive visualization that is controlled by the mouse and keyboard.  The program makes it very simple to get complex and unique visuals, but it has enough depth and customization that a VJ could find it really useful.  It works by making a sphere out of a series of squares.  This can then be morphed, randomized, colored, shaken, and modified in many ways.  The result is a mathematically-sculpted structure that can be crumbled, modulated and destroyed.

Quick overview of controls:
Click and drag mouse for morph and rotation
Space to reset
Arrow keys rotate and morph
Press 1-4 for different colors
Q, W, E, R for various mods
A,S,D,...,J,K for size changes
Z,X,C,V for randomness

Full list of options:
Click and drag mouse for morph and rotation
  Click and drag left mouse - morphing and rotation on x-axis
  Right mouse - rotation on z-axis
Space to reset
Arrow keys rotate and morph
  left/right - morph
  up/down - rotation on x-axis
Press 1-4 for different colors
  1 - ice/jungle
  2 - ghost
  3 - random tint
  4 - algae/redish
Q, W, E, R for various mods
  Q - strobe
  W - alt morph mode
  E - makes random keys rapid fire or single shot
  R - adds outline to 3d panels
A,S,D,...,J,K for size changes
  A,S - increase/decrease latitude and longitude lines
  D,F - increase/decrease latitude lines
  G,H - increase/decrease longitude lines
  J,K - increase/decrease size of
Z,X,C,V for randomness
  Z - randomize individual panel size
  X - randomize morphing amount
  C - randomize single panel
  V - rumble panels


keyboard-
[1-4]colormain
  [1]ice/jungle
  [2]ghost
  [3]random tint
  [4]algae/redish


mods-
[q]strobe | [w]alt.fold | [e]rapid random | [r]stroke

[a-h]horiz and vert verticies
[j,k]radius multipliers

[z]random all | [x]random global size percent | 
[c]random single size percent | [v]crumble

todo-
make better defaults
create modular shapes
change color scheming
[5-8]colortint
  [1]
  [2]
  [3]
  [4]
[9,0]color mod
  [9]invert
*/
int latLines, longLines;
SurfaceSquare[][] squareArr;
float rotYAmount = 0, rotXAmount, rotZAmount = 0;
int colorType = 1;

boolean[] modify = new boolean[8];//0b/w flashes 1alt fold 2
boolean[] keys = new boolean[8];//0-3(arrows)  4-7(z-v)
boolean[] keyDown = new boolean[2];//0-1(z-x)
boolean[] sizeKeys = new boolean[8];//0-7(a-k)
int[] sizeKDown = new int[8];//a-k
//-1 if not down, 0 if triggered, positive if counting down

int mousePx, mousePy;
float pSizeP;

//for draw()
float randomSp;
color randomColor;
//for colorizeSquares()
color rColor = color(random(255), random(255), random(255));

UVSphere ggen = new UVSphere();

void setup()
{
  for(int i = 0; i < modify.length; i++)
   modify[i] = false;
  for(int i = 0; i < keys.length; i++)
   keys[i] = false;
  for(int i = 0; i < keyDown.length; i++)
   keys[i] = false;
  for(int i = 0; i < sizeKDown.length; i++)
    sizeKDown[i] = -1;
  //max lat and long
  squareArr = new SurfaceSquare[64][64];
  size(640,640, P3D);
  lights();
  fill(255);
  for(int x = 0; x < squareArr.length; x++)
    for(int y = 0; y < squareArr[0].length; y++)
      squareArr[x][y] = new SurfaceSquare();
}

void draw()
{
  translate(width / 2, height / 2);
  rotateX(rotXAmount);
  rotateY(rotYAmount);
  rotateZ(rotZAmount);
  if(mouseX > width / 2)
    rotYAmount += .000003*pow((mouseX - width / 2), 2);
  else
    rotYAmount -= .000003*pow((mouseX - width / 2), 2);
    
  
  float randomSp = random(-3, 3);
  color randomColor = color(random(255), random(255), random(255));
    
  //key/mouse functions that don't pass through squareArr
  if(keys[1])
    rotXAmount += .01;
  if(keys[3])
    rotXAmount -= .01;
  if(keys[6])//random single
  {
    squareArr[(int)random(latLines - 1)][(int)random(longLines - 1)].sizePercent = randomSp;
  }
  if(mousePressed && (mouseButton == RIGHT))
  {
    rotZAmount += .0003*(mouseX - mousePx);
  }
  if(mousePressed && (mouseButton == LEFT))
  {
    rotXAmount += .0003*(mouseX - mousePx);
  }  
  
  //main cycle through whole squareArr
  for(int x = 0; x < squareArr.length; x++)
    for(int y = 0; y < squareArr[0].length; y++) {
      if(mousePressed && (mouseButton == LEFT))
      {
        squareArr[x][y].sizePercent = pSizeP + (mouseY - mousePy)*.01;
      }
      
      if(keys[0])
        squareArr[x][y].sizePercent -= .01;
      if(keys[2])
        squareArr[x][y].sizePercent += .01;
      if(keys[4] && (keyDown[0] == false || modify[2]))//random all
      {
        squareArr[x][y].randomize();
        if(x == squareArr.length - 1 && y == squareArr[0].length - 1)
          keyDown[0] = true;
      }
      if(keys[5] && (keyDown[1] == false || modify[2]))//random folding
      {
        squareArr[x][y].c = randomColor;
        squareArr[x][y].sizePercent = randomSp;
        if(x == squareArr.length - 1 && y == squareArr[0].length - 1)
          keyDown[1] = true;
      }
      if(keys[7] && random(1) > .9)//nudge
      {
        if(0 + random(randomSp)*randomSp/.74 > squareArr[x][y].sizePercent)
          squareArr[x][y].sizePercent += .051;
        else
          squareArr[x][y].sizePercent -= .051;
        if(random(1) > .99995)
          squareArr[x][y].sizePercent *= 3;
      }
    }
  for(int i = 0; i < sizeKDown.length; i++)
  {
    if(sizeKDown[i] > 0)
    {
      sizeKDown[i]--;
    }
    else if(sizeKDown[i] == 0)
    {
      sizeKDown[i] = 4;
      switch(i)
      {
        case 0:
          if(latLines > 2)
            latLines--;
          if(longLines > 3)
            longLines--;
          break;
        case 1:
          if(latLines < 48)
            latLines++;
          if(longLines < 48)
            longLines++;
          break;
        case 2:
          if(latLines > 2)
            latLines--;
          break;
        case 3:
          if(latLines < 48)
            latLines++;
          break;
        case 4:
          if(longLines > 3)
            longLines--;
          break;
        case 5:
          if(longLines < 48)
            longLines++;
          break;
        case 6:
          ggen.radius--;
          break;
        case 7:
          ggen.radius++;
          break;
      }
    }
  }
      
  background(0);
  colorizeSquares();
  runModify();
  
  ggen.step();
}

void colorizeSquares()
{
  
  if(random(1) > .95)
    rColor = color(random(255), random(255), random(255));
  
  for(int x = 0; x < squareArr.length; x++)
    for(int y = 0; y < squareArr[0].length; y++)
      switch(colorType)
      {
        case 1://ice/jungle
          squareArr[x][y].c = color( ((float)x / (float)latLines)*255, ((float)y / (float)longLines)*255, ( (float)mouseY / height*.875)*255);
          break;
          
        case 2://ghost
          squareArr[x][y].c = color(255, 16+((float)mouseY/height)*240);
          break;
          
        case 3://random tinter
          squareArr[x][y].c = lerpColor(squareArr[x][y].c, rColor, .1);
          break;
          
        case 4://rand gb with mouse controlled r
          squareArr[x][y].c = color( ((float)mouseX / width)*255, green(squareArr[x][y].c), blue(squareArr[x][y].c));
          break;
          
        case 0:
          break;
      }
}

void runModify()
{
  if(modify[0])
  {
    for(int x = 0; x < squareArr.length; x += random(5))
      for(int y = 0; y < squareArr[0].length; y += random(5))
        squareArr[x][y].c = color(0);
    for(int x = 0; x < squareArr.length; x += random(10))
      for(int y = 0; y < squareArr[0].length; y += random(10))
        squareArr[x][y].c = color(255);
  }
}

void colorizeSquares(int type)
{
  colorType = type;
  colorizeSquares();
}

void keyPressed()
{
  if(key == ' ')
  {
    for(int x = 0; x < squareArr.length; x++)
      for(int y = 0; y < squareArr[0].length; y++)
        squareArr[x][y] = new SurfaceSquare();
    rotXAmount = 0;
    rotYAmount = 0;
    rotZAmount = 0;
  }
  if(keyCode == LEFT)
    keys[2] = true;
        
  if(keyCode == RIGHT)
    keys[0] = true;
  if(keyCode == UP)
    keys[1] = true;
  if(keyCode == DOWN)
    keys[3] = true;
  if(key == 'z')
    keys[4] = true;
  if(key == 'x')
    keys[5] = true;
  if(key == 'c')
    keys[6] = true;
  if(key == 'v')
    keys[7] = true;
  
  if(key == '1')
    colorType = 1;
  if(key == '2')
    colorType = 2;
  if(key == '3')
    colorType = 3;
  if(key == '4')
    colorType = 4;
  if(key == '0')
    colorType = 0;
  if(key == 'q')
    modify[0] = !modify[0];
  if(key == 'w')
    modify[1] = !modify[1];
  if(key == 'e')
    modify[2] = !modify[2];
  if(key == 'r')
  {
    stroke(0);
    modify[3] = !modify[3];
    
  }
  if(key == 'a' && sizeKDown[0] == -1)
  {
    sizeKDown[0] = 0;
  }
  if(key == 's' && sizeKDown[1] == -1)
  {
    sizeKDown[1] = 0;
  }
  if(key == 'd' && sizeKDown[2] == -1)
  {
    sizeKDown[2] = 0;
  }
  if(key == 'f' && sizeKDown[3] == -1)
  {
    sizeKDown[3] = 0;
  }
  
  if(key == 'g' && sizeKDown[4] == -1)
  {
    sizeKDown[4] = 0;
  }
  if(key == 'h' && sizeKDown[5] == -1)
  {
    sizeKDown[5] = 0;
  } 
  if(key == 'j' && sizeKDown[6] == -1)
  {
    sizeKDown[6] = 0;
  }
  if(key == 'k' && sizeKDown[6] == -1)
  {
    sizeKDown[6] = 0;
  }
}

void keyReleased()
{
  if(keyCode == LEFT)
    keys[2] = false;
  if(keyCode == RIGHT)
    keys[0] = false;
  if(keyCode == UP)
    keys[1] = false;
  if(keyCode == DOWN)
    keys[3] = false;
  if(key == 'z')
  {
    keyDown[0] = false;
    keys[4] = false;
  }
  if(key == 'x')
  {
    keyDown[1] = false;
    keys[5] = false;
  }
  if(key == 'c')
    keys[6] = false;
  if(key == 'v')
    keys[7] = false;
    
  if(key == 'a')
    sizeKDown[0] = -1;
  if(key == 's')
    sizeKDown[1] = -1;  
  if(key == 'd')
    sizeKDown[2] = -1;
  if(key == 'f')
    sizeKDown[3] = -1;  
  if(key == 'g')
    sizeKDown[4] = -1;
  if(key == 'h')
    sizeKDown[5] = -1;  
  if(key == 'j')
    sizeKDown[6] = -1;
  if(key == 'k')
    sizeKDown[7] = -1;
}

void mousePressed()
{
  mousePx = mouseX;
  mousePy = mouseY;
  pSizeP = squareArr[0][0].sizePercent;
}

class SurfaceSquare
{
  color c;
  float sizePercent = 1;
  
  void randomize()
  {
    c = color(random(255), random(255), random(255));
    sizePercent = random(-2, 2);
  }
}

