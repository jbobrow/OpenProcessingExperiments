
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/5671*@* */

Ocean ocean;
//var oceanSound = new Audio("ocean.wav");

class Ocean
{
  int OCEAN_SIZE = 12;
  int tile_width = 96;
  int tile_height = 48;
  WaterTile[][] tiles;
  float x;
  float y;
  float tx = 0;
  float tz = 0;
  float tspeed = 0.0;
  PlayerShip player;
  WaterTile mouseTile = null;
  int lastMouseX;
  int lastMouseY;
  
  Ocean(float xx, float yy)
  {
    x = xx;
    y = yy;
    tiles = new WaterTile[OCEAN_SIZE][OCEAN_SIZE];
    for (int i = 0; i < tiles.length; i++)
    {
      for (int j = tiles[i].length-1; j >= 0; j--)
      {
        int x = (j * tile_width / 2) + (i * tile_width / 2);
        int y = (i * tile_height / 2) - (j * tile_height / 2);
        tiles[i][j] = new WaterTile(x, y, i, j);
        tiles[i][j].rockiness = noise(float(i) * 0.3, float(j) * 0.3) * 4 - 1.5;
        
        // Make sure player start isn't dangerous.
        if (i > tiles.length - 3 && j > tiles[i].length - 3)
          tiles[i][j].rockiness = -0.8;
        //println(tiles[i][j].rockiness);
      }
    }
    player = new PlayerShip(tiles.length-1, tiles[0].length-1);
    player.tile = tiles[tiles.length-1][tiles[0].length-1];
  }
  
  void draw()
  {
    float left = x - (tile_width * OCEAN_SIZE / 2) - 6;
    float top = y - tile_height;
    
    tspeed += 0.001;
    //println(noise(0,tspeed));
    float xspeed = noise(tspeed, 0);
    tx += 0.15 * xspeed;
    if (tx >= 12.6)
      tx = 0;
      
    float zspeed = noise(0, tspeed);  
    tz += 0.15 * zspeed;
    if (tz >= 12.6)
      tz = 0;

    for (int i = 0; i < tiles.length; i++)
    {
      for (int j = 0; j < tiles[i].length; j++)
      {
        tiles[i][j].update(left, top, tx, tz, xspeed, zspeed);
      }
    }
    
    background(0);
   
    int stickyMouseOffset = 10;
    if (abs(mouseX - lastMouseX) > stickyMouseOffset || abs(mouseY - lastMouseY) > stickyMouseOffset)
    {
      mouseTile = null;
      for (int i = 0; i < tiles.length; i++)
      {
        for (int j = 0; j < tiles[i].length; j++)
        {
          if (tiles[i][j].isMouseOverlapping())
          {
            mouseTile = tiles[i][j];
            lastMouseX = mouseX;
            lastMouseY = mouseY;
          }
        }
      }
    }
    
    if (mousePressed && mouseTile != null)
    {
      player.setEndTarget(mouseTile);
 
    }
    

    background(0);
    for (int i = 0; i < tiles.length; i++)
    {
      for (int j = 0; j < tiles[i].length; j++)
      {
        tiles[i][j].draw();
        
        if (tiles[i][j] == player.tile)
          player.draw();
      }
    }
    
    if (mouseTile != null)
      mouseTile.drawHighlight();
  }
}

class WaterTile
{
  float x;
  float y;
  int row;
  int col;
  float startY;
  float w = 32;
  float h = 16;
  color waterColor;
  
  int isox1;
  int isoy1;
  int isox2;
  int isoy2;
  int isox3;
  int isoy3;
  int isox4;
  int isoy4;
  
  int rockisox1;
  int rockisoy1;
  int rockisox2;
  int rockisoy2;
  int rockisox3;
  int rockisoy3;
  int rockisox4;
  int rockisoy4;
  
  float rockiness;
  float rockY;
  color rockColor;
  
  boolean doOnce = true;
  
  WaterTile(float xx, float yy, int i, int j)
  {
    x = xx;
    y = yy;
    startY = y;
    row = i;
    col = j;
  }  
  
  void update(float parentX, float parentY, float tx, float tz, float xspeed, float zspeed)
  {
    float waveSpeed = 0.5;
    float waveHeight = 32;
    
    y = (sin((tx + row) * waveSpeed) * waveHeight * xspeed) + (sin((tz + col) * waveSpeed) * waveHeight * zspeed);// * noise(t * 0.08);// + noise(t * 0.1);
    waterColor = color(0, 2 + y * 0.05, 4 + y * 0.05);
    //println(y);
    rockY = waveHeight * rockiness * 1.5 - 48;
    rockColor = color(4 + rockY * 0.05, 3.5 + rockY * 0.05, 3 + rockY * 0.05);


    //y = startY;
    
    float xm = row*w -h;
    float xt = row*w +h;
    float zm = col*w -h;
    float zt = col*w +h;
    
    int halfw = (int)width/2;
    int halfh = (int)height/2- 100;
    
    isox1 = int(xm - zm + halfw);
    isoy1 = int((xm + zm) * 0.5 + halfh) - (int)y;
    isox2 = int(xm - zt + halfw);
    isoy2 = int((xm + zt) * 0.5 + halfh) - (int)y;
    isox3 = int(xt - zt + halfw);
    isoy3 = int((xt + zt) * 0.5 + halfh) - (int)y;
    isox4 = int(xt - zm + halfw);
    isoy4 = int((xt + zm) * 0.5 + halfh) - (int)y;
    
    rockisox1 = int(xm - zm + halfw);
    rockisoy1 = int((xm + zm) * 0.5 + halfh) - (int)rockY;
    rockisox2 = int(xm - zt + halfw);
    rockisoy2 = int((xm + zt) * 0.5 + halfh) - (int)rockY;
    rockisox3 = int(xt - zt + halfw);
    rockisoy3 = int((xt + zt) * 0.5 + halfh) - (int)rockY;
    rockisox4 = int(xt - zm + halfw);
    rockisoy4 = int((xt + zm) * 0.5 + halfh) - (int)rockY;

    y = isoy4;
    rockY = rockisoy4 ;

    if (doOnce)
    {
      startY = y;
      doOnce = false;
    }
    x = isox3;

    
    /*pushMatrix();
    translate(parentX + x, parentY + y);
    image(img, 0, 0);
    popMatrix();*/
  }
  
  void draw()
  {
          noStroke();
    
    float offset = 32 * rockiness * 1.5 - 48 + 128;

    if (y < rockY)
    {
      
    /*if (col == ocean.tiles[0].length-1)
    {
      fill(2, 1.5, 1);
      quad(isox2, rockisoy2, isox3, rockisoy3, isox3, rockisoy3+offset, isox2, rockisoy2+offset);
      
            fill(0);
      quad(rockisox1, rockisoy1, rockisox2, rockisoy2, rockisox3, rockisoy3, rockisox4, rockisoy4);
      

    }
    
    if (row == ocean.tiles.length-1)
    {fill(4, 3.5, 3);
      quad(isox3, rockisoy3, isox4, rockisoy4, isox4, rockisoy4+offset, isox3, rockisoy3+offset);
      
      fill(0);
      quad(rockisox1, rockisoy1, rockisox2, rockisoy2, rockisox3, rockisoy3, rockisox4, rockisoy4);
    }*/
    
          fill(waterColor);
      quad(isox1, isoy1, isox2, isoy2, isox3, isoy3, isox4, isoy4); 
    }
    else
    {
      noStroke();
          /* The side quads. 2 and 4 is used for the coloring of each of these quads */
    fill(2, 1.5, 1);
    quad(isox2, rockisoy2, isox3, rockisoy3, isox3, isoy3, isox2, isoy2);
    fill(4, 3.5, 3);
    quad(isox3, rockisoy3, isox4, rockisoy4, isox4, isoy4, isox3, isoy3);
    
      fill(rockColor);
      quad(rockisox1, rockisoy1, rockisox2, rockisoy2, rockisox3, rockisoy3, rockisox4, rockisoy4);

  }

  }
  
  void drawHighlight()
  {
    stroke(6);
    noFill();
    quad(isox1, isoy1, isox2, isoy2, isox3, isoy3, isox4, isoy4);  
  }
  
  boolean isMouseOverlapping()
  {
    boolean isOverlapping = false;
    if (mouseX < isox4 && mouseX > isox2 && mouseY < isoy3 && mouseY > isoy1)
    {
      noStroke();
      fill(6, 0, 0);
      rect(isox2, isoy1, w, h);
      fill(6, 6, 0);
      rect(isox1, isoy1, w, h);
      fill(0, 6, 0);
      rect(isox2, isoy2, w, h);
      fill(0, 0, 6);
      rect(isox1, isoy2, w, h);
      fill(6);
      quad(isox1, isoy1, isox2, isoy2, isox3, isoy3, isox4, isoy4); 
      
      if (get(mouseX, mouseY) == color(6))
        isOverlapping = true;
    }
    
    return isOverlapping;
  }
}

class PlayerShip
{
  float x;
  float y;
  color c;
  int row;
  int col;
  WaterTile tile = null;
  WaterTile endTargetTile = null;
  WaterTile currentTargetTile = null;
  int ySlope = 0;
  int xSlope = 0;
  float moveTimer = 0;
  PVector direction = new PVector(1, -1);
  
  PlayerShip(int startRow, int startCol)
  {
    row = startRow;
    col = startCol;
  }
  
  void draw()
  {
   
    if (endTargetTile != null && endTargetTile != tile && ySlope == 0 && xSlope == 0)
    {
      ySlope = endTargetTile.row - tile.row;
      xSlope = endTargetTile.col - tile.col;
      
      direction.y = ySlope;
     direction.x = xSlope;
      
      int greatestCommonDivisor = 1;
      
      if (abs(xSlope) >= abs(ySlope))
        greatestCommonDivisor = abs(gcd(ySlope, xSlope));
      else
        greatestCommonDivisor = abs(gcd(xSlope, ySlope));
      
      if (greatestCommonDivisor != 0)
      {
        ySlope = (int)(ySlope / (int)greatestCommonDivisor);
        xSlope = (int)(xSlope / (int)greatestCommonDivisor);
      }
      //println("ySlope: " + ySlope);
    }
    
    moveTimer -= 0.0167;
    
    if (moveTimer <= 0.0)
    {
      int prevXSlope = xSlope;

      if (xSlope != 0 && abs(xSlope) >= abs(ySlope))
      {
        if (xSlope > 0)
        {
          col++;
          xSlope--;
        }
        else
        {
          col--;
          xSlope++;
        }
      }
      if (ySlope != 0 && abs(ySlope) >= abs(xSlope))
      {
        if (ySlope > 0)
        {
          row++;
          ySlope--;
        }
        else
        {
          row--;
          ySlope++;
        }
      }
      
      //println("r: " + row + "ySlope: " + ySlope);
      tile = ocean.tiles[row][col];
      moveTimer = 0.25;
    }
    
    x = tile.x;
    y = tile.y;

    //stroke(6);
    
    noStroke();
    fill(4);
    
    pushMatrix();
    translate(x, y);

    if (direction.x > 0 && abs(direction.x) >= abs(direction.y)
      || direction.y > 0 && abs(direction.y) >= abs(direction.x))
    {
      if (direction.y  > direction.x)
        scale(-1,1);
      quad(12, -2, 12, -9, -1, 0, -1, 6); 
      fill(3);
      quad(-1, 0, -1, 6, -8, 7, -15, 4); 
      fill(2);
      triangle(-15, 4, -16, -5, 0, 0); 
      fill(2);
      quad(-16, -5, 4, -14, 12, -9,0,0 );
      fill(6);
      beginShape();
      vertex(4, -3);
      vertex(3, -12);
      vertex(5, -22);
      vertex(-13, -30);
      vertex(-15, -12);
      vertex(-3, -5);
      vertex(4, -3); 
      endShape();
    }
    else
    {
      if (direction.y  < direction.x)
        scale(-1,1);
        
      beginShape();
      vertex(-7, 4);
      vertex(-7, 9);
      vertex(12, -1);
      vertex(12, -8);
      vertex(-7, 4);
      endShape();
      
      fill(2);
      beginShape();
      vertex(12, -8);
      vertex(12, -18);
      vertex(-8, -13);
      vertex(-16, 0);
      vertex(-7, 4);
      vertex(12, -8);
      endShape();
      
      fill(3);
      beginShape();
      vertex(-16, 0);
      vertex(-7, 4);
      vertex(-7, 9);
      vertex(-16, 5);
      endShape();
      
      fill(6);
      beginShape();
      vertex(6, -3);
      vertex(8, -11);
      vertex(7, -21);
      vertex(-13, -30);
      vertex(-11, -25);
      vertex(-10, -12);
      endShape();
    }

    popMatrix();
  }
  
  void setEndTarget(WaterTile target)
  {
    if (endTargetTile != target)
    {
      endTargetTile = target;
      xSlope = 0;
      ySlope = 0;
  
      //oceanSound.load();
      //oceanSound.play();
    }
  }
  
}

int gcd(int x,int y)
{

  if(y!=0)
    gcd(y,x%y); //recursive call by using arithmetic rules

  return x; //base case,return x when y equals 0

}

void setup()
{
  size(800, 800);
  colorMode(RGB, 6);
  ocean = new Ocean(width / 2, height / 2 + 148);

}
float xoff =0.0;
void draw()
{
  ocean.draw();
}


