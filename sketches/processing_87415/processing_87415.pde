
/**
 * Conway's Game of Life 
 * by Mike Davis. 
 * edited by ErrorbyErrors
 * This program is a simple version of Conway's 
 * game of Life.
 */

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer player;
FFT fft;

int sx, sy; 
int[][][] world;

color col[][];

void setup() 
{ 
  size(500, 360);

  minim = new Minim(this);
  player = minim.loadFile("marcus_kellis_theme.mp3");
  player.play();

  fft = new FFT(player.bufferSize(), player.sampleRate());

  sx = width;
  sy = height;
  world = new int[sx][sy][2]; 
  col = new color[sx][sy];

  fft.linAverages(128);
  
    // Set random cells to 'on' 
  for (int i = 0; i < sx * sy; i++) { 
    world[(int)random(sx)][(int)random(sy)][1] = 1;
  }
} 

void draw() 
{ 
  background(0); 
  fft.forward(player.mix);
  
  int sum = 0;

  for (int i = 0; i < fft.avgSize(); i++) {
    sum += fft.getAvg(i);
  }
  
  if (sum > 200) reRun();
  frameRate(map(sum, 0, 200, 20, 50));

  // Drawing and update cycle 
  for (int x = 0; x < sx; x++) { 
    for (int y = 0; y < sy; y++) { 
      if (world[x][y][1] == 1) 
      { 
        world[x][y][0] = 1;
        if (sum > 100) col[x][y] = color(random(255), random(255), random(255));
        set(x, y, col[x][y]);
      } 
      else {
        world[x][y][0] = 0;
      }
    }
  } 
  // Birth and death cycle 
  for (int x = 0; x < sx; x++) { 
    for (int y = 0; y < sy; y++) { 
      int count = neighbors(x, y); 
      if ((world[x][y][1] == 1 && (count == 2 || count == 3)) || (world[x][y][1] == -1 && count == 3)) {
        world[x][y][1] = 1;
      } 
      else
      { 
        world[x][y][1] = -1;
      }
    }
  }
} 

// Count the number of adjacent cells 'on' 
int neighbors(int x, int y) 
{ 
  return world[(x + 1) % sx][y][0] + 
    world[x][(y + 1) % sy][0] + 
    world[(x + sx - 1) % sx][y][0] + 
    world[x][(y + sy - 1) % sy][0] + 
    world[(x + 1) % sx][(y + 1) % sy][0] + 
    world[(x + sx - 1) % sx][(y + 1) % sy][0] + 
    world[(x + sx - 1) % sx][(y + sy - 1) % sy][0] + 
    world[(x + 1) % sx][(y + sy - 1) % sy][0];
} 

void reRun() {
  for (int i = 0; i < sx * sy; i++) { 
    world[(int)random(sx)][(int)random(sy)][1] = 1;
  }
}


