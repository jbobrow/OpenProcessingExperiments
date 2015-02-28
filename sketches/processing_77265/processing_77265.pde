
void setup() {
  size(450, 450);
  background(0);
  frameRate(60);
}
float[][] world = {
  {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  }
  , {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  }
  , {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  }
  , {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  }
  , {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  }
  , {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  }
  , {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  }
  , {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  }
  , {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  }
  , {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  }
};
int x = 9;
int y = 9;
void draw() {
  float[][] new_world = {
    {
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    }
    , {
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    }
    , {
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    }
    , {
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    }
    , {
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    }
    , {
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    }
    , {
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    }
    , {
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    }
    , {
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    }
    , {
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    }
  };
  for (int X = 0; X < x; X+=1) {
    for (int Y = 0; Y < y; Y+=1) {
      if (X == 0 && Y == 0) {
        new_world[X][Y]= ((0.99*world[X][Y])+(0.0012*world[X][Y+1])+(0.0016*world[X+1][Y+1])+(0.0020*world[X+1][Y]));
      } 
      else if (X == 0 && Y == y) {
        new_world[X][Y]= ((0.99*world[X][Y])+(0.0020*world[X+1][Y])+(0.0016*world[X+1][Y-1])+(0.0012*world[X][Y-1]));
      } 
      else if (X == x && Y == y) {
        new_world[X][Y]= ((0.99*world[X][Y])+(0.0012*world[X][Y-1])+(0.0008*world[X-1][Y-1])+(0.0008*world[X-1][Y]));
      } 
      else if (X == x && Y == 0) {
        new_world[X][Y]= ((0.99*world[X][Y])+(0.0008*world[X-1][Y])+(0.0008*world[X-1][Y+1])+(0.0012*world[X][Y+1]));
      } 
      else if (X == 0) {
        new_world[X][Y]= ((0.99*world[X][Y])+(0.0012*world[X][Y+1])+(0.0016*world[X+1][Y+1])+(0.0020*world[X+1][Y])+(0.0016*world[X+1][Y-1])+(0.0012*world[X][Y-1]));
      } 
      else if (Y == y) {
        new_world[X][Y]= ((0.99*world[X][Y])+(0.0020*world[X+1][Y])+(0.0016*world[X+1][Y-1])+(0.0012*world[X][Y-1])+(0.0008*world[X-1][Y-1])+(0.0008*world[X-1][Y]));
      } 
      else if (X == x) {
        new_world[X][Y]= ((0.99*world[X][Y])+(0.0012*world[X][Y-1])+(0.0008*world[X-1][Y-1])+(0.0008*world[X-1][Y])+(0.0008*world[X-1][Y+1])+(0.0012*world[X][Y+1]));
      } 
      else if (Y == 0) {
        new_world[X][Y]= ((0.99*world[X][Y])+(0.0008*world[X-1][Y])+(0.0008*world[X-1][Y+1])+(0.0012*world[X][Y+1])+(0.0016*world[X+1][Y+1])+(0.0020*world[X+1][Y]));
      } 
      else {
        new_world[X][Y]= ((0.99*world[X][Y])+(0.0008*world[X-1][Y])+(0.0008*world[X-1][Y+1])+(0.0012*world[X][Y+1])+(0.0016*world[X+1][Y+1])+(0.0020*world[X+1][Y])+(0.0016*world[X+1][Y-1])+(0.0012*world[X][Y-1])+(0.0008*world[X-1][Y-1]));
      }
    }
  }

  background(0);
  world = new_world;
  world[8][4]= world[8][4]+16;
  for (int X = 0; X < x; X+=1) {
    for (int Y = 0; Y < y; Y+=1) {
      if (int(world[Y][X])<50) 
      {
        fill(0);
        rect(50*X, 50*Y, 49, 49);
      } 
      else if (int(world[Y][X])<150) 
      {
        fill((int(256/100)*(world[Y][X]-50)), 0, 0);
        rect(50*X, 50*Y, 49, 49);
      } 
      else if (int(world[Y][X])<350) 
      {
        fill(255, (int(256/200)*(world[Y][X]-150)), 0);
        rect(50*X, 50*Y, 49, 49);
      } 
      else if (int(world[Y][X])<950) 
      {
        fill(256-(int(256/150)*(world[Y][X]-350)), 256-(int(256/150)*(world[Y][X]-350)), 0);
        rect(50*X, 50*Y, 49, 49);
      }     else if (int(world[Y][X])<3750) 
      {
        fill(0, 0, (int(256/250)*(world[Y][X]-950)));
        rect(50*X, 50*Y, 49, 49);
      }
      //fill(0);
      //text(str(world[Y][X]), 50*X, 50*Y, 40, 40);
    }
  }
} 


