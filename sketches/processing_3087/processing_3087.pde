
Flare[] flares; // array of Flares
int numFlares = 100;
int flarePointer = 0;
color bg = 0;
int dxMin = 5;
boolean direction = true; // right = true, left = false
color currentCol = 255;
boolean darkening = true;

void setup()
{
  size(800, 600);
  flares = new Flare[numFlares];
  for (int i = 0; i < numFlares; i++)
  {
    flares[i] = new Flare();
  }
  frameRate(25);
  background(bg);
}

void draw() {
  if (frameCount % 5 == 0) {
    addFlare();
    /* Move the flare source back and forth across the screen */
    if (direction)
      dxMin--;
    else
      dxMin++;
    if (dxMin == -13)
      direction = false;
    if (dxMin == 5)
      direction = true;
    
    /* The flare gets progressively lighter and darker */
    if (darkening)
      currentCol--;
    else
      currentCol++;
    if (currentCol == 255)
      darkening = true;
    if (currentCol == 0)
      darkening = false;
  }
  
  /* set the background colour to the inverse of the flares this means
     there is a crossover point where the flares can't be seen, looks
     cool */
  //background(bg);
  background(255 - currentCol);
  
  /* render the flares! */
  for (int i = 0; i < numFlares; i++)
    flares[i].advance();
   
  /* by turning off the background command and adding a BLUR filter it's
     possible to get some really swish effects going. The trouble is,
     this doesn't render at a useful framerate on my little macbook, so
     I outputted the frames individually, then recombined them with
     FrameByFrame (http://web.mac.com/philipp.brendel/Software/FrameByFrame.html) */
  //filter(BLUR, 2);
  //saveFrame();
}

void addFlare() {
  flares[flarePointer].init(dxMin, currentCol);
  flarePointer++;
  if (flarePointer >= numFlares)
    flarePointer = 0;
}

class Flare
{
  int x;
  int y;
  int dx = 5;
  int dy = -10;
  boolean on = false;
  int weight = 2;
  color col;

  void init(int dxMin, color givenCol) {
    weight = int(random(2, 5)); // width of the line
    int dxMax = dxMin + 8;
    col = givenCol;
    dx = int(random(dxMin, dxMax));
    x = int((dxMax * 33.33) - (dxMin * 66.67));
    y = 500;
    dy = int(random(-30, -15));
    on = true;
  }

  void advance() {
    if (on) {
      stroke(col);
      strokeWeight(weight);
      int newx = x + dx;
      int newy = y + dy;
      line(x, y, newx, newy);
      x = newx;
      y = newy;
      dy++;
      y++;
      if (y > 600)
        on = false;
    }
  }
}


