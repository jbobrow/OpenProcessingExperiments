
Cell[][] Board;
int Bwid = 54;
int Bhgt = 33;
float cwid = width*1.0/Bwid;
float chgt = height*1.0/Bhgt;

boolean DrawTiles = false;

void setup() {

  size(540,334);
  smooth();
  background(255,255,255);
  Board = new Cell[Bhgt][Bwid];
  
  for(int y = 0 ; y < Bhgt ; y++)
  {
    for(int x  = 0 ; x < Bwid ; x++)
    {
      Board[y][x] = new Cell();
    }
  }

  buildGrid();
  background(255,255,255);
  drawGrid();

}

void buildGrid() {

  for(int y = 0 ; y < Bhgt ; y++)
  {
    for(int x = 0 ; x < Bwid ; x++)
    {
      placeCell(x,y);
    }
  }
}

void placeCell(int x, int y)
{
  int numExits = 0;

  while(numExits < 2)
  {
    Board[y][x].t = Board[y][x].r = Board[y][x].b = Board[y][x].l = -1;

    if(x > 0)
    {
      Board[y][x].l = Board[y][x-1].r;
    }

    if(y > 0)
    {
      Board[y][x].t = Board[y-1][x].b;
    }

    if(Board[y][x].t < 0) Board[y][x].t = random(100) > 50 ? 1 : 0;
    
    if(Board[y][x].r < 0) Board[y][x].r = random(100) > 50 ? 1 : 0;

    if(Board[y][x].b < 0) Board[y][x].b = random(100) > 50 ? 1 : 0;

    if(Board[y][x].l < 0) Board[y][x].l = random(100) > 50 ? 1 : 0;

    numExits = Board[y][x].t + Board[y][x].r + Board[y][x].b + Board[y][x].l;
  }
}

void drawGrid() {


  for(int y = 0 ; y < Bhgt; y++)
  {
    for(int x = 0 ; x < Bwid; x++)
    {
      float lx = x * cwid;
      float hx = lx + cwid;
      float ly = y * chgt;
      float hy = ly + chgt;
      float mx = (lx + hx) /2;
      float my = (ly + hy) /2;

      noStroke();
      fill(hour()*10,second()*4,minute()*4);

      if(DrawTiles) {
        if(Board[y][x].t == 1) triangle(lx,ly,mx,my,hx,ly);
        if(Board[y][x].r == 1) triangle(hx,ly,mx,my,hx,hy);
        if(Board[y][x].b == 1) triangle(hx,hy,mx,my,lx,hy);
        if(Board[y][x].l == 1) triangle(lx,hy,mx,my,lx,ly);
      }


      noFill();
      stroke(hour()*10,second()*4,minute()%255);
      strokeWeight(9);

      if((Board[y][x].t == 1) && (Board[y][x].r == 1)) {
        arc(hx,ly,cwid,chgt,HALF_PI, PI);
      }
      if((Board[y][x].r ==1) && (Board[y][x].b == 1)) {
        arc(hx,hy,cwid,chgt,PI,3*HALF_PI);
      }
      if((Board[y][x].b == 1) && (Board[y][x].l == 1)) {
        arc(lx,hy,cwid,chgt,3*HALF_PI, TWO_PI);
      }

      if((Board[y][x].l == 1) && ( Board[y][x].t == 1)) {
        arc(lx,ly,cwid,chgt,0,HALF_PI);
      }
      if((Board[y][x].t == 1) && (Board[y][x].b == 1)) {
        line(mx,ly,mx,hy);
      }
      if((Board[y][x].l == 1) && (Board[y][x].r == 1)) {
        line(lx,my,hx,my);
      }
    }
  }
}

class Cell{

  int t,r,b,l;
  Cell(){
    t = r = b = l = -1;
  }
}               
