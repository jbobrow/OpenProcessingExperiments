
//Variables used to initialize the tilebased map
int TileWidthMax = 20;
int TileHeightMax = 20;
int TileSize = 30;
int NumTiles = 0;

int UpDownValue = 20;

int[] Tile = new int[TileWidthMax*TileHeightMax+1];
int[] TileX = new int[TileWidthMax*TileHeightMax+1];
int[] TileY = new int[TileWidthMax*TileHeightMax+1];

//Objects
Unit[] units;

void setup() {
    frameRate(100);
  //Initialize window
  size(TileWidthMax*TileSize, TileHeightMax*TileSize);
  stroke(100);


  //Initialize custom objects units
  units = new Unit[1];


  //Load map

  int NumRows = 0;
  for (int y = 0; y < TileHeightMax*TileSize; y+= TileSize) {
    NumRows++;
    int NumCols = 0;
    for (int x = 0; x < TileWidthMax*TileSize; x+= TileSize) {
      NumCols++;
      NumTiles += 1;

      if (NumCols == 1 || NumCols == TileWidthMax || NumRows == 1 || NumRows == TileHeightMax) {
        Tile[NumTiles] = 1;
      }
      else {
        Tile[NumTiles] = 0;
      }

      TileX[NumTiles] = x;
      TileY[NumTiles] = y;
    }
  }

  //Test unit
  units[0] = new Unit(42, 48, 0, 0);
  units[0].SetPosition(42);
  units[0].SetDestination(22);
}

void draw() {
  frameRate(30);
  DrawMap();
  SetTile(35, 1);
  SetTile(45, 1);
  SetTile(55, 1);
  MakeUnitsWalk();

  //println("1:"+units[0].info(1)+" 2:"+units[0].info(2)+" 3:"+units[0].info(3));
}



void MakeUnitsWalk() {
  for (int i = 0; i < units.length; ++i) {
    int UnitTilePosition = units[i].info(1);
    int UnitTileDesitination = units[i].info(2);


    //Show posible ways + their dist() to final goal
    float SolutionTileDistance = 9999; // Beat that easy plz
    int SolutionTile = 0;

    //Check for next goto-tile if still walking
    //If NOT still walking
    if (units[i].info(1) != units[i].info(2)) { //

      for (int x = UnitTilePosition-UpDownValue-1; x != UnitTilePosition-UpDownValue-1+3; x++) {
        for (int y  = 0; y != 20*3; y+= 20) {

          float DistanceFromTileToFinal;
          if (x+y >= 1 && x+y < 400 && Tile[x+y] == 0 && units[i].info(1) != x+y && units[i].info(4) != x+y) {
            DistanceFromTileToFinal = dist(TileX[x+y]+TileSize/2, TileY[x+y]+TileSize/2, TileX[units[i].info(2)]+TileSize/2, TileY[units[i].info(2)]+TileSize/2);
          }
          else {
            DistanceFromTileToFinal = 9999;
          }





          if (DistanceFromTileToFinal < SolutionTileDistance) {
            units[i].SetBadRoute(units[i].info(1));
            SolutionTileDistance = DistanceFromTileToFinal;
            units[i].SetNextTile(x+y);
            //since we already know the next tile, we can make deny the current/going-to-be-previous pos
            fill(100, 100, 100);
            ellipse(TileX[x+y]+TileSize/2, TileY[x+y]+TileSize/2, TileSize, TileSize);
          }
          else {
            fill(100, 100, 0);
            ellipse(TileX[x+y]+TileSize/2, TileY[x+y]+TileSize/2, TileSize, TileSize);
          }
        }
      }

      units[i].SetPosition(units[i].info(3));
      //println(units[i].info(1)+" - bad roude ="+units[i].info(4));
    }
    else {
    }

    //correct pos
    fill(0, 255, 0);
    rect(TileX[units[i].info(3)], TileY[units[i].info(3)], TileSize, TileSize);

    //players pos
    fill(0, 0, 255);
    ellipse(TileX[UnitTilePosition]+TileSize/2, TileY[UnitTilePosition]+TileSize/2, TileSize/2, TileSize/2);
  }
}

class Unit {
  int TilePos, TileDestination, NextTile, BadTile;
  Unit(int p, int d, int nt, int bt) {
    TilePos = p;
    TileDestination = d;
    NextTile = nt;
    BadTile = bt;
  }
  void SetBadRoute(int id) {
    BadTile = id;
  }
  void SetDestination(int id) {
    TileDestination = id;
  }
  void SetPosition(int id) {
    TilePos = id;
  }
  void SetNextTile(int id) {
    NextTile = id;
  }



  int info(int type) {
    if (type == 1) {
      return TilePos;
    }
    else if (type == 2) {
      return TileDestination;
    }
    else if (type == 3) {
      return NextTile;
    }
    else {
      return BadTile;
    }
  }
}

void SetTile(int id, int value) {
  Tile[id] = value;
}

void DrawMap() {
  for (int i = 1; i <= NumTiles; i+= 1) {
    int TX = TileX[i];
    int TY = TileY[i];

    //Determine if the tile is blocked or not

    if (Tile[i] == 1) {
      fill(255, 0, 0);
    }
    else if (mouseX > TileX[i] && mouseX < TileX[i]+TileSize && mouseY > TileY[i] && mouseY < TileY[i]+TileSize) {
      fill(0, 255, 0);
      if (key == 'w') {
        units[0].SetDestination(i);
      }
      else if (key == 'e') {
        Tile[i] = 1;
      }
    }
    else {
      fill(255);
    }
    rect(TX, TY, TileSize, TileSize);
    fill(0);
    text(i, TX+6, TY+14);
  }
}

void keyPressed() {
  if (key == 'w') {
    units[0].SetPosition(units[0].info(1)-20);
  }
  if (key == 's') {
    units[0].SetPosition(units[0].info(1)+20);
  }
  if (key == 'a') {
    units[0].SetPosition(units[0].info(1)-1);
  }
  if (key == 'd') {
    units[0].SetPosition(units[0].info(1)+1);
  }
}

