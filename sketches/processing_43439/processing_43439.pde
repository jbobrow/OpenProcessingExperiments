
boolean[][] cur, next;
boolean[][] rules;

final int zoom = 10;
final int BUTTON_RADIUS = 5;
final int NUM_BUTTONS = 9;

boolean drawButtons, paused;

int W;
int H;

void setup()
{
  drawButtons = true;
  paused = false;
  textFont(loadFont("AgencyFB-Reg-48.vlw"));
  size(900, 900);
  smooth();
  
  W = width / zoom;
  H = height / zoom;
  
  stroke(255);
  
  cur = new boolean[W][H];
  next = new boolean[W][H];
  
  //place random cells:
  for(int x = 0; x < W; x++)
    for(int y = 0; y < H; y++)
      cur[x][y] = random(1) < .2;
      
  colorMode(HSB, 360);
  
  //set rules:
  rules = new boolean[2][9];
  rules[0][3] = true;
  rules[1][2] = true;
  rules[1][3] = true;
}

void draw()
{
  //draw the board:
  scale(width/W, height/H);
  background(0);//, 100);
  for(int x = 0; x < W; x++)
    for(int y = 0; y < H; y++)
      if(cur[x][y])
        point(x, y);
  
  //draw the buttons:
  if(drawButtons)
    drawButtons();
    
  //calculate next board:
  if(!paused)
  {
    boolean[][] next = new boolean[W][H];
    for(int x = 0; x < W; x++)
      for(int y = 0; y < H; y++)
        if(!cur[x][y])
          next[x][y] = rules[0][numNeighbors(x, y)];
        else
          next[x][y] = rules[1][numNeighbors(x, y)];//35%chance for 2 looks cool
          
    cur = next;
  }
}

void drawButtons()
{
  for(int x = 0; x < 2; x++)
    for(int y = 0; y < 9; y++)
    {
      PVector pos = buttonLocation(x, y);
      
      if(rules[x][y])
        fill(360, 360);
      else
        fill(0, 100);
        
      ellipse(pos.x, pos.y, BUTTON_RADIUS, BUTTON_RADIUS);
      
      fill(255);
      textAlign(CENTER, CENTER);
      textSize(4);
      text(y, pos.x, pos.y - .51);
    }
}

void mousePressed()
{
  PVector mouse = new PVector(mouseX, mouseY);
  mouse.div(zoom);
  
  for(int x = 0; x < 2; x++)
    for(int y = 0; y < 9; y++)
    {
      PVector button = buttonLocation(x, y);
      
      if(mouse.dist(button) < BUTTON_RADIUS)
      {
        rules[x][y] = !rules[x][y];
        return;
      }
    }
    
  if(paused)
  {
    int x = (int)mouse.x;
    int y = (int)mouse.y;
    cur[x][y] = !cur[x][y];
  }
}

PVector buttonLocation(int x, int y)
{
  int xPos = 4 + x * 7;  
  int yPos = 5 + y * (height - 10)/(NUM_BUTTONS * zoom);
  return new PVector(xPos, yPos);
}

void keyPressed()
{
  if(key == ' ')
    cur = new boolean[W][H];
  else if(key == 's')
    for(int dx = -3; dx <= 3; dx++)
      for(int dy = -3; dy <= 3; dy++)
          cur[W/2 + dx][H/2 + dy] = true;
  else if(key == 'p')
    paused = !paused;
}

public int numNeighbors(int centerX, int centerY)
{
  int count = 0;
  for(int x = centerX - 1; x <= centerX + 1; x++)
    for(int y = centerY - 1; y <= centerY + 1; y++)
      if(x >= 0 && x < W && y >= 0 && y < H)
        if(cur[x][y])
          count++;
    
  if(cur[centerX][centerY])
    count--;
  
  return count;
}

