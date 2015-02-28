
// Simulate of bees randomly building a nest based on a set of rules
// Copyright 2010 - Ryan Janzen

// total number of bees
final int NUM_BEES = 20;

// rules that will be flipped horizontally
// and vertically to form the full set of rules
int [][][] baseBuildPatterns = new int[][][] {
  new int [][] {
    // rule definition, bee is located in the middle
    new int [] {
      0, 0, 0,
      0, 0, 1,
      0, 0, 0
    }
    // material type to build
    , new int [] { 
      1     }
  }
  ,
  new int [][] {
    new int [] {
      0, 0, 0,
      0, 0, 0,
      0, 1, 1
    }
    , new int [] { 
      1     }
  }
  ,
  new int [][] {
    new int [] {
      0, 0, 0,
      0, 0, 0,
      1, 1, 0
    }
    , new int [] { 
      1     }
  }
  ,
  new int [][] {
    new int [] {
      0, 0, 0,
      0, 0, 0,
      0, 1, 0
    }
    , new int [] { 
      1     }
  }
  ,
  new int [][] {
    new int [] {
      0, 0, 0,
      1, 0, 0,
      0, 0, 0
    }
    , new int [] { 
      1     }
  }
  ,
  new int [][] {
    new int [] {
      1, 0, 0,
      1, 0, 0,
      0, 0, 0
    }
    , new int [] { 
      1     }
  }
  ,
  new int [][] {
    new int [] {
      1, 1, 1,
      0, 0, 0,
      1, 1, 1
    }
    , new int [] { 
      2     }
  }
  ,
  new int [][] {
    new int [] {
      1, 1, 1,
      0, 0, 0,
      0, 1, 0
    }
    , new int [] { 
      2     }
  }
};

final int worldSize = 50;

int world[][];
PVector [] bees;
int [][][] buildPatterns;

int worldScale;

void setup()
{
  size(600, 600, P2D);
  world = new int[worldSize][worldSize];
  worldScale = width / world.length;

  bees = new PVector[NUM_BEES];
  for(int i = 0; i < bees.length; i++)
  {
    bees[i] = new PVector(world[0].length / 2, world.length / 2);
  }

  // flip the rules vertically and horizontally
  buildPatterns = new int [baseBuildPatterns.length * 4][9][1];
  for(int i = 0; i < baseBuildPatterns.length; i++)
  {
    int [] pattern = baseBuildPatterns[i][0];
    int [] c = baseBuildPatterns[i][1];

    buildPatterns[i * 4] = new int [][] { 
      pattern , c     };
    buildPatterns[i * 4 + 1] = new int [][] {
      new int [] {
        pattern[2], pattern[1], pattern[0],
        pattern[5], pattern[4], pattern[3],
        pattern[8], pattern[7], pattern[6]
      }
      ,
      c
    };
    buildPatterns[i * 4 + 2] = new int [][] {
      new int [] {
        pattern[6], pattern[7], pattern[8],
        pattern[3], pattern[4], pattern[5],
        pattern[0], pattern[1], pattern[2]
      }
      ,
      c
    };
    buildPatterns[i * 4 + 3] = new int [][] {
      new int [] {
        pattern[8], pattern[7], pattern[6],
        pattern[5], pattern[4], pattern[3],
        pattern[2], pattern[1], pattern[0]
      }
      ,
      c
    };
  }

  randomSeed(271);
  rectMode(CORNER);
  noStroke();
  frameRate(30);

  // seed the world
  world[world.length / 2][world[0].length / 2] = 1;
}

void draw()
{
  updateWorld();
  drawWorld();
}

void updateWorld()
{
  for(int i = 0; i < bees.length; i++)
  {
    PVector bee = bees[i];
    int x = int(bee.x);
    int y = int(bee.y);

    // ensure the area checked will be inside the world bounds
    if (x - 1 > 0 && x + 1 < world[0].length
      && y - 1 > 0 && y + 1 < world.length) {
      int [] pattern = new int[9];
      pattern[0] = world[y - 1][x - 1];
      pattern[1] = world[y - 1][x];
      pattern[2] = world[y - 1][x + 1];

      pattern[3] = world[y][x - 1];
      pattern[4] = world[y][x];
      pattern[5] = world[y][x + 1];

      pattern[6] = world[y + 1][x - 1];
      pattern[7] = world[y + 1][x];
      pattern[8] = world[y + 1][x + 1];

      // find first matching rule, and build appropriate material if one matches
      for(int bi = 0; bi < buildPatterns.length; bi++)
      {
        int [] buildPattern = buildPatterns[bi][0];

        boolean same = true;
        for(int bpi = 0; bpi < buildPattern.length; bpi++)
        {
          if (bpi == 4)
            continue;

          if (buildPattern[bpi] != pattern[bpi])
          {
            same = false;
            break;
          }
        }

        // build material
        if (same)
        {
          world[y][x] = buildPatterns[bi][1][0];
          break;
        }
      }
    } 
    else
    {
      // bee about to be out of bounds, move to a random position
      bees[i].x = random(0, world[0].length);
      bees[i].y = random(0, world.length);
    }

    // move bee randomly a bit
    int dx = int(random(-2, 2));
    int dy = int(random(-2, 2));
    bee.x += dx;
    bee.y += dy;
  }
}

void drawWorld()
{
  // draw green background
  background(85, 257, 57);

  // draw the materials
  for(int y = 0; y < world.length; y++)
  {
    int [] row = world[y];
    for(int x = 0; x < row.length; x++)
    {
      if (row[x] == 0)
      {
        continue;
      } 
      else if(row[x] == 1)
      {
        fill(100, 73, 39);
      } 
      else if (row[x] == 2)
      {
        fill(255, 255, 0);
      }

      rect(x * worldScale, y * worldScale, worldScale, worldScale);
    }
  }

  // draw the bees
  fill(255, 166, 0);
  for(int i = 0; i < bees.length; i++)
  {
    int x = int(bees[i].x);
    int y = int(bees[i].y);
    rect(x * worldScale, y * worldScale, worldScale, worldScale);
  }
}

void mouseClicked()
{
  for(int y = 0; y < world.length; y++)
  {
    Arrays.fill(world[y], 0);
  }

  // seed the world
  world[world.length / 2][world[0].length / 2] = 1;

  // reset the bees so that we get some good initial activity
  for(int i = 0; i < bees.length; i++)
  {
    bees[i].x = world[0].length / 2;
    bees[i].y = world.length / 2;
  }
}





