
/**
 * Author: Jason Lo <br /><br />
 * Physics Sweeper - AP Comp Sci mods 6,7 <br /> <br />
 * Mine Sweeper is a complex game. Google the rules, or if you are running Windows, <br/> 
 * Goto Start -> Programs -> Games -> Minesweeper -> Help -> Contents<br/>
 * Left Click chooses <br />
 * Right Click marks a mine <br />
 * Pressing UP ARROW crashes the game and does something cool, maybe
 * Url: <a href="jasoncompsci.webs.com/Phys.html">jasoncompsci.webs.com/Phys.html</a>
 */

private Panel [][] panels;

public final static int ROWS = 11;
public final static int COLS = 11;
public final static int BUTTON_SIZE = 30;
public final static int MINE_COUNT = 10;

public final int REG_COLOR = color (255);
public final int OVER_COLOR = color (200);
public final int MARK_COLOR = color (155);
public final int MINE_COLOR = color (255, 0, 0);
public final int BACK_COLOR = color (0);
public final int TEXT_COLOR = color (255);

private PFont font;
private int gameState;

void setup () {
  //size (380, 460);
  size(380, 460, P2D);
  
  buttonSetup();
  setMines();
  
  font = createFont ("Verdana", 14);
  textFont (font);
  textMode (SCREEN);
  textAlign(CENTER);
    
  gameState = 0;
}

void buttonSetup () {
  panels = new Panel[ROWS][COLS];  
  
  for(int r = 0; r < ROWS; r++)
  {
    for(int c = 0; c < COLS; c++)
    {
      int x = c * BUTTON_SIZE + 40; //cols at x=40,70,100,130,150,190,220,250,280,310
      int y = r * BUTTON_SIZE + 60; //rows at y=60,90,120,150,180,210,240,270,300,330
      panels[r][c] = new Panel (x, y, BUTTON_SIZE, r, c);      
      
    }
  }  
}

void setMines () {
  for (int i = 0; i < MINE_COUNT; i++) {
    while (true) {
      int selRow = (int)(Math.random()*ROWS);
      int selCol = (int)(Math.random()*COLS);

      if (panels[selRow][selCol].getMine() == false) {
        panels[selRow][selCol].setMine(true);
        break;    
      }    
    }
  }
}

void draw () {
  if (gameState <= 2) {
    background (0x404040);
  
    for(int r = 0; r < ROWS; r++)
    {
      for(int c = 0; c < COLS; c++)
      {
        fill (TEXT_COLOR);
        if (getNeighbors (r, c) != 0)
        text ("" + getNeighbors (r, c), c * BUTTON_SIZE + 40, r * BUTTON_SIZE + 60);
        
        panels[r][c].update();
        panels[r][c].show();
      }
    }
    
    int aliveCount = 0;
    int markedCount = 0;
    
    for(int r = 0; r < ROWS; r++)
    {
      for(int c = 0; c < COLS; c++)
      {
        if (panels[r][c].getState() == true)
          panels[r][c].show();
        
        if (panels[r][c].getState () == true) {
          aliveCount ++; 
        }
        
        if (panels[r][c].getMarked()) {
          markedCount ++;
        }        
      }
    }
    
    if (aliveCount == ((ROWS*COLS) - MINE_COUNT) && markedCount == MINE_COUNT) {
      gameState = 2;
    }
    
    if (gameState == 1) gameState = 3;
    if (gameState == 2) gameState = 4;
    
    
  }
  
  
  if (gameState == 3) {
    fill (0x202020, 200);
    rectMode (CORNER);
    rect (0, 0, width, height);
    textFont (font, 48);
    fill (255);
    text ("YOU LOSE", width/2, height/2);
    redraw();
    //noLoop(); 
  }
  
  if (gameState == 4) {
    fill (0x202020, 200);
    rectMode (CORNER);
    rect (0, 0, width, height);
    textFont (font, 48);
    fill (255);
    text ("CONGRATS", width/2, height/2);
    redraw();
    //noLoop(); 
  }
  
  

}

void mousePressed () {
  for(int r = 0; r < ROWS; r++)
  {
    for(int c = 0; c < COLS; c++)
    {
      if (panels[r][c].inBounds (mouseX, mouseY)) {
         if (mouseButton == LEFT) {
            if (panels[r][c].getMine()) {
              panels[r][c].setColor (MINE_COLOR);
              gameState = 1;
            }
            else {
              callHit (r, c, 0);
            
            }
         }
         else if (mouseButton == RIGHT) {
           if (panels[r][c].getMarked()) {
             panels[r][c].setMarked (false);
           }
           else {
             panels[r][c].setMarked (true);
             panels[r][c].setColor (MARK_COLOR);  
           }
         }
      }
    }
  }
}

void mouseMoved () {
  for(int r = 0; r < ROWS; r++)
  {
    for(int c = 0; c < COLS; c++)
    {
      if (panels[r][c].inBounds (mouseX, mouseY)) {
        panels[r][c].setColor (OVER_COLOR); 

      }
      else {
        panels[r][c].setColor (REG_COLOR);
        if (panels[r][c].getMarked()) {
          panels[r][c].setColor (MARK_COLOR);
        } 
            
      }  
    }
  }
}

void keyPressed () {
  if (key == CODED) {
    if (keyCode == UP) {
    for(int r = 0; r < ROWS; r++)
  {
    for(int c = 0; c < COLS; c++)
    {
      panels [r][c].revert();
    }
  }
    }
  } 
}

int getNeighbors (int r, int c) {
  int count = 0;
  
  for (int i = r-1; i <= r+1; i++) {
    for (int j = c-1; j <= c+1; j++) {
      if (isValid(i,j) && panels[i][j].getMine()) {
        count ++;
      }
    }
  }
  
  return count;
}

boolean isValid (int r, int c) {
  
  if (r >= 0 && r < panels.length) {
    if (c >= 0 && c < panels[r].length) {
     
      return true;
      
    } 
  }
  
  return false;
}

void callHit (int r, int c, int w) {
  if (isValid (r, c) && panels[r][c].getMine() == false) {
    panels[r][c].setTrigger (w);
    panels[r][c].setMarked (false);
    
    if (getNeighbors (r, c) == 0) {
      for (int i = r - 1; i <= r + 1; i++) {
        for (int j = c - 1; j <= c + 1; j++) {
          if (isValid (i, j) && (i != r || j != c) && panels[i][j].getTrigger() < 0 && panels[i][j].getMarked() == false) {
            callHit (i, j, w + 3);
          }
        } 
      }
    }
  } 
}

class Panel
{
  private boolean alive;

  private float ySpeed;
  private float rotSpeed;
  private int rotation;

  private float x;
  private float y;
  private float sideLength;

  private int row;
  private int col;
  private boolean hasMine;
  private boolean marked;  
  
  private float[] xCorn;
  private float[] yCorn;

  private int clr;
  
  private int wait;
  
  private boolean reverting;
  private float yDist;
  private float startY;
  private float rotDist;
  
  
  
  Panel (int x, int y, int s, int r, int c) {
    row = r;
    col = c;

    this.x = x;
    this.y = y;
    startY = y;
    
    reverting = false;
    yDist = -1;
    rotDist = -1;
    
    sideLength = s;

    ySpeed = 5;
    rotation = 0;
    rotSpeed = (float)Math.random() * 10 - 5;
    alive = false;

    float[] xCorn2 = {
      -sideLength/2, sideLength/2, sideLength/2, -sideLength/2            };
    float[] yCorn2 = {
      -sideLength/2, -sideLength/2, sideLength/2, sideLength/2            };

    xCorn = xCorn2;
    yCorn = yCorn2;

    clr = color (REG_COLOR);
    fill (clr);
    
    hasMine = false;
    marked = false;
    wait = -1;
  }

  void update () {
    if (reverting == false) {
    if (alive) {
      y += ySpeed;
      ySpeed *= 1.05;
      rotation += rotSpeed;

      
    }
    if (wait == 0) {
      alive = true; 
    }
    wait --;    
    }
    else {
      yDist = startY - y;
      y += yDist/3; 
      
      rotDist = 0 - rotation;
      rotation += rotDist/7;
      
      if (y == startY && rotation == 0) {
        ySpeed = 5;
          rotation = 0;
        rotSpeed = (float)Math.random() * 10 - 5;
        alive = false;
        hasMine = false;
        marked = false;
        wait = -1;
        reverting = false;
      }
    }
  }

  void show () {
    double rad = rotation * (Math.PI / 180);

    double xRot, yRot;

    fill (clr);

    beginShape ();

    for (int i = 0; i < xCorn.length; i++) {
      xRot = ((xCorn[i] * Math.cos (rad)) - (yCorn[i] * Math.sin(rad)) + x);
      yRot = ((xCorn[i] * Math.sin (rad)) + (yCorn[i] * Math.cos(rad)) + y);
      vertex ((float)xRot, (float)yRot);
    }

    endShape (CLOSE);
    
   
  }

  void setState (boolean state) {
    alive = state; 
  }
  
  void setTrigger (int w) {
    wait = w;
  }

  void setColor (int c) {
    clr = c;
  }

  boolean inBounds (int posX, int posY) {
    if (alive) {
      return false; 
    }

    if (posX >= x - sideLength/2 && posX <= x + sideLength/2) {
      if (posY >= y - sideLength/2 && posY <= y + sideLength/2) {
        return true;       
      }
    }

    return false;
  }
  
  void revert () {
    reverting = true; 
  }
  
  boolean getMarked () { return marked; }
  boolean getMine () { return hasMine; }
  
  void setMarked (boolean m) { marked = m; }
  void setMine (boolean m) { hasMine = m; }
  
  boolean getState () { return alive; }
  
  int getTrigger () { return wait; }
  
}







