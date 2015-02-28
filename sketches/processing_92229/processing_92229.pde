
final int SCREEN_WIDTH = 800;
final int SCREEN_HEIGHT = 600;
final color BACKGROUND_COL = #000000;
final int JUMP = 10;
final int FRAME_LIMIT = 1;
final int DIAM = 10;

int[] x;
int[] y;
int direction = 0;
int frame = 1;

void setup() {
  background(BACKGROUND_COL);
  size(SCREEN_WIDTH, SCREEN_HEIGHT);
  strokeWeight(DIAM);
  frameRate(1000);
  x = new int[FRAME_LIMIT];
  y = new int[FRAME_LIMIT];
  x[0] = SCREEN_WIDTH/2;
  y[0] = SCREEN_HEIGHT/2;
}

void draw() {
  if(frame == FRAME_LIMIT) {
    frame = 0;
    for(int i = 0; i < FRAME_LIMIT; i++) {
      stroke(getRandomColor());
      point(x[i],y[i]);
    }
  }
  
  int rand = (int)random(3);
  direction = (direction + 7 + rand) % 8;
  
  if(direction != 2 && direction != 6) {
    if(direction >= 3 && direction < 6)
      x[frame] = (x[(frame+FRAME_LIMIT-1)%FRAME_LIMIT]-JUMP + SCREEN_WIDTH) % SCREEN_WIDTH;
    else
      x[frame] = (x[(frame+FRAME_LIMIT-1)%FRAME_LIMIT]+JUMP) % SCREEN_WIDTH;
  }
  else x[frame] = x[(frame+FRAME_LIMIT-1)%FRAME_LIMIT];
  
  if(direction != 0 && direction != 4) {
    if(direction < 4)
      y[frame] = (y[(frame+FRAME_LIMIT-1)%FRAME_LIMIT]-JUMP + SCREEN_HEIGHT) % SCREEN_HEIGHT;
    else
      y[frame] = (y[(frame+FRAME_LIMIT-1)%FRAME_LIMIT]+JUMP) % SCREEN_HEIGHT;
  }
  else y[frame] = y[(frame+FRAME_LIMIT-1)%FRAME_LIMIT];
  
  frame++;
}

color getRandomColor() {
  int rand = (int) random(6);
  
  int r = 0;
  int g = 0;
  int b = 0;
  
  int z = 0;
  int f = 255;
  int c = (int) random(256);
  
  switch(rand) {
    case 0:
      r = f;
      g = z;
      b = c;
      break;
    case 1:
      r = c;
      g = z;
      b = f;
      break;
    case 2:
      r = z;
      g = c;
      b = f;
      break;
    case 3:
      r = z;
      g = f;
      b = c;
      break;
    case 4:
      r = c;
      g = f;
      b = z;
      break;
    case 5:
      r = f;
      g = c;
      b = z;
  }
  
  return color(r,g,b);
}
