
int sx, sy, zoom;
int[][][] world;
boolean running;
int lowThresh=0, highThresh=250;
int top=255, bottom=0;
float decay=5;
int decayTop=10, decayBottom=5;
boolean decaySign=true;
float lastDecayTime=0, decayInterval=2000;
int randomDecay=4;

void setup()
{
  zoom = 6;
  sx = int(1280/zoom);
  sy = int(1024/zoom);
  world = new int[sx][sy][2];
  running = true;
  size(1280,1024, P2D);
  frameRate(33);
  background(0);
  noStroke();
  fill(200);
}

void draw()
{
  decayTimer();
  scale(zoom);
  drawing();
  life();
}

void life() {
  if ( running ) {
    for (int x = 0; x < sx; x=x+1) {
      for (int y = 0; y < sy; y=y+1) {
        int count = neighbors(x, y);
        if (world[x][y][0] < 100) {
          if (count == 3) {
            world[x][y][1] = top;
          }
        }
        else if (count < 2 || count > 3) {
          world[x][y][1] -= decay;
        }
      }
    }
  }
}

void drawing() {
  for (int x = 0; x < sx; x++) {
    for (int y = 0; y < sy; y++) {
      if (world[x][y][1] > lowThresh) {
        world[x][y][0] = top;
        fill(world[x][y][1]);
        rect(x, y, 1, 1);
        if(random(10)>randomDecay) world[x][y][0] -=6;
      }
      else {
        if (world[x][y][0]>=0) world[x][y][0] -=3;
      }
    }
  }
}

void decayTimer() {
  if (millis() - lastDecayTime > decayInterval) {
    if (decaySign) decay++; 
    else decay--;
    if (decay<decayBottom || decay>decayTop) decaySign =  !decaySign;
    lastDecayTime=millis();
    println(decay);
  }
}

int neighbors(int x, int y)
{
  int total=0;
  if (world[(x + 1) % sx][y][0] > highThresh) total++; 
  if (world[x][(y + 1) % sy][0] > highThresh) total++;
  if (world[(x + sx - 1) % sx][y][0] > highThresh) total++;
  if (world[x][(y + sy - 1) % sy][0] > highThresh) total++;
  if (world[(x + 1) % sx][(y + 1) % sy][0] > highThresh) total++;
  if (world[(x + sx - 1) % sx][(y + 1) % sy][0] > highThresh) total++;
  if (world[(x + sx - 1) % sx][(y + sy - 1) % sy][0] > highThresh) total++;
  if (world[(x + 1) % sx][(y + sy - 1) % sy][0] > highThresh) total++;
  return total;
}
void keyPressed() {
  if ( key == 'c' ) {

    world = new int[sx][sy][2];
    running = false;
  }
  else {

    running = !running;
  }

  if ( running ) { 
    fill(top);
  } 
  else { 
    fill(200);
  }
}

int[][] pattern = {
  {
    0, 255, 255
  }
  , 
  {
    255, 255, 0
  }
  , 
  {
    0, 255, 0
  }
};


void mouseDragged() {
  if (mouseX>40 && mouseX < width-40 && mouseY > 40 && mouseY < height-40) {
  for ( int x = 0; x < pattern[0].length; x++ ) {
    for ( int y = 0; y < pattern.length; y++ ) {
      world[int(mouseX/zoom+x)][int(mouseY/zoom+y)][1] = pattern[y][x];
    }
  }
  }
}



