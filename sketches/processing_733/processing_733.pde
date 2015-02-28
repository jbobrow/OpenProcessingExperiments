
int i, j, tgx, tgy, cng;

int[] blx, bly;

Grid grid;
Target target;
Block block;
Ai ai;

void setup() {
  size(200, 200);
  background(0);
  
  grid = new Grid();
  target = new Target();
  block = new Block();
  blx = new int[20];
  bly = new int[20];
  ai = new Ai();
  
  tgx = int(random(1, 10));
  tgy = int(random(1, 10));
  
  ai.gridx =int(random(1, 10));
  ai.gridy =int(random(1, 10));
  ai.tx = tgx;
  ai.ty = tgy;
  
  for(i=0; i<20; i++)
  {
    blx[i] = int(random(1, 10));
    bly[i] = int(random(1, 10));
    if(blx[i] == tgx && bly[i] == tgy)
    {
      cng = blx[i];
      blx[i] = bly[i];
      bly[i] = blx[i];
    }
    if(blx[i] == ai.gridx && bly[i] == ai.gridy)
    {
      cng = blx[i];
      blx[i] = bly[i];
      bly[i] = blx[i];
    }
  }
  
  frameRate(2);
}

void draw() {
  background(0);
  grid.drawGrid(10, 10);
  target.drawTarget(tgx, tgy);
  for(i=0; i<20; i++)
  {
    block.drawBlock(blx[i], bly[i]);
    ai.bx[i] = blx[i];
    ai.by[i] = bly[i];
  }
  //ai.drawAi();
  ai.pathFind();
}

//mattonella
class Tile {
  int x, y, d;
  Tile() {
    d = 20;
  }
  void drawTile(int posx, int posy){
    stroke(0);
    fill(255);
    x = posx;
    y = posy;
    rect(x, y, d, d);
  }
}
//grid
class Grid {
  Tile tile;
  int h, v;
  void drawGrid(int x, int y){
    tile = new Tile();
    for (h=0; h<x; h++)
    {
      for (v=0; v<y; v++)
      {
        tile.drawTile(h*tile.d, v*tile.d);
      }
    }
  }
}
//target
class Target {
  int d, gridx, gridy;
  Target(){
    d = 20;
  }
  void drawTarget(int posx, int posy){
    stroke(255);
    fill(255, 0, 0);
    gridx = posx;
    gridy = posy;
    rect(posx*d-d, posy*d-d, d, d);
  }
}
//block
class Block{
  int d;
  Block(){
    d=20;
  }
  void drawBlock(int posx, int posy){
    stroke(255);
    fill(0);
    rect(posx*d-d, posy*d-d, d, d);
  }
}
//ai
class Ai{
  int d, gridx, gridy, tx, ty, i, j, go, cnt, memx, memy;
  int[] bx, by, adj, adx, ady;
  Ai(){
    d=20;
    bx=new int[20];
    by=new int[20];
    adj = new int[8];
    adx = new int[8];
    ady = new int[8];
  }
  void drawAi(){
    stroke(255);
    fill(0, 255, 0);
    ellipse(gridx*d-d+d/2, gridy*d-d+d/2, d, d);
  }
  void mvUp(){
    gridy-=1;
  }
  void mvDown(){
    gridy+=1;
  }
  void mvRt(){
    gridx+=1;
  }
  void mvLt(){
    gridx-=1;
  }
  
  void initAdj(){
    //di base tutto vale 1
    for(i=0; i<8; i++)
    {
      adj[i]=1;
    }
  }
  
  void setAdj(){
    adx[0] = gridx;     ady[0] = gridy - 1;
    adx[1] = gridx + 1; ady[1] = gridy - 1;
    adx[2] = gridx + 1; ady[2] = gridy;
    adx[3] = gridx + 1; ady[3] = gridy + 1;
    adx[4] = gridx;     ady[4] = gridy + 1;
    adx[5] = gridx - 1; ady[5] = gridy + 1;
    adx[6] = gridx - 1; ady[6] = gridy;
    adx[7] = gridx - 1; ady[7] = gridy - 1;
  }
  
  void checkBlocks(){
    /**
    * 7 0 1
    * 6 o 2
    * 5 4 3
    */
    
    
    //se c'è un blocco, la casella si piglia 0
    for(i=0; i<8; i++)
    {
      for(j=0; j<20; j++)
      {
        if(bx[j] == adx[i] && by[j] == ady[i])
        {
          adj[i] = 0;
        }
      }
      if(adx[i] > 10 || ady[i] > 10 || adx[i] < 1 || ady[i] < 1)
      {
        println("bang");
        adj[i] = 0;
      }
    }
  }
  
  void checkTg(){
    
    if(gridx>tx)
    {
      //mvLt();
      adj[7]+=1;
      adj[6]+=1;
      adj[5]+=1;
    }
    if(gridx<tx)
    {
      //mvRt();
      adj[1]+=1;
      adj[2]+=1;
      adj[3]+=1;
    }
    if(gridy>ty)
    {
      //mvUp();
      adj[7]+=1;
      adj[0]+=1;
      adj[1]+=1;
    }
    if(gridy<ty)
    {
      //mvDown();
      adj[5]+=1;
      adj[4]+=1;
      adj[3]+=1;
    }
  }
  
  void checkArrive(){
    for(i=0; i<8; i++)
    {
      if(adx[i] == tx && ady[i] == ty)
      {
        adj[i] = 100;
      }
    }
  }
  
  void checkMem(){
    for(i=0; i<8; i++)
    {
      if(adx[i] == memx && ady[i] == memy)
      {
        adj[i]-=1;
      }
    }
  }
  
  void goThere(){
    go = 0;
    cnt = 0;
    if(gridx == tgx && gridy == ty)
    {
      frameRate(0);
      
    }
    else
    {
      
        for(i=0; i<8; i++)
        {
          if(adj[i]>cnt)
          {
            cnt = adj[i];
            go = i;
          }
        }
      
      gridx = adx[go];
      gridy = ady[go];
    }
  }
  
  void pathFind(){
    
    drawAi();
    memx = gridx;
    memy = gridy;
    
    
    initAdj();
    setAdj();
    checkTg();
    checkArrive();
    checkBlocks();
    checkMem();
    
    goThere();
    
    /**
    if(gridx>tx)
    {
      mvLt();
    }
    if(gridx<tx)
    {
      mvRt();
    }
    if(gridy>ty)
    {
      mvUp();
    }
    if(gridy<ty)
    {
      mvDown();
    }
    */
    
  }
}

