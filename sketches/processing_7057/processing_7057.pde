
float DAMP = 16; //wave dampening
int MAXX = 250;   //amount of pixels, x
int MAXY = 250;   //amount of pixels, y
int CT = 0;      //used to represent current wavemap
int FU = 1;      //used to represent future wavemap
int temp;        //temporary variable for map switching
int brush = 1;   //brushsize
//set up wavemap. first dim is for current and future maps
int[][] WaveMap = new int[2][MAXX*MAXY];
void setup()
{
  size(MAXX,MAXY,P2D);
}

void draw()
{
  if(keyPressed)
  {
    if(key == 'w')
      brush++;
    if(key == 's' && brush>1)
      brush--;
  }  
  UpdateWaveMap();
  println(frameRate);
}

void mouseDragged()
{
  WaveMap[CT][constrain(mouseY,0,height-2)*MAXX+constrain(mouseX,0,width-1)] = -100;
}


void UpdateWaveMap()
{
  int n;
  loadPixels();
  for(int i = MAXX+1;i<MAXY*MAXX-MAXX;i++)
  {
    n = ( WaveMap[CT][i-1] +
          WaveMap[CT][i+1] +
          WaveMap[CT][i+MAXX] +
          WaveMap[CT][i-MAXX] )/2 -
          WaveMap[FU][i];
    pixels[i] = color(map(n,-100,100,0,255));
    n = n - (int)(n/DAMP);
    if(n==1)
      n=0;
    WaveMap[FU][i] = n;
  }
  updatePixels();
  for(int i = MAXX+1;i<MAXY*MAXX-MAXX;i++)
  {
    temp = WaveMap[CT][i];
    WaveMap[CT][i] = WaveMap[FU][i];
    WaveMap[FU][i] = temp;
  }
}

