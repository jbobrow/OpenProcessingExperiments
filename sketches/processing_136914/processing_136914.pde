
//  "City life"
//  Lines approach and depart
//  Empty space is segmented
//  Central hubs and freeways emerge
//  Colors chosen for their proven worth

color[] palette = {
  #9B4F19, #D81E05, #FCD116, #007A3D,
  #FCA311, #F6A5BE, #919693, #8E0554,
  #0019A8, #00A3DD, #7AD1B5, #00B2AA,
  #5BBF21, #E87511
};

int cnt;

float x;
float y;
boolean goDown;  //  tells if primary direction is down (or right if false)
boolean goLR;    //  tells if line inclines to lower right (to LL/UR if false)

void setup()
{
  size(1280,720);
  
  setupCanvas();
}

void draw()
{
  //  do a few segments
  for (int ii = 0; ii < 32; ii ++)
  { 
    float x1 = x, y1 = x;
    
    boolean r = random(0,1) < 0.75;  //  go in dominant direction?
    
    int blockx = int(random(32,48));
    int blocky = int(random(32,48));
    
    if (goDown && r )           { x1 = x;          y1 = y + blocky;  }
    if (goDown && !r && goLR)   { x1 = x + blockx; y1 = y;           }
    if (goDown && !r && !goLR)  { x1 = x - blockx; y1 = y;           }
    if (!goDown && r )          { x1 = x + blockx; y1 = y;           }
    if (!goDown && !r && goLR)  { x1 = x;          y1 = y + blocky;  }
    if (!goDown && !r && !goLR) { x1 = x;          y1 = y - blocky;  }
    
    line(x, y, x1, y1);
    x = x1; y = y1;
    
    // if we have gone outside the canvas setup a new line
    if (x >= width || y >= height)
      setupNewLine();
  }
}

void setupCanvas()
{
  background(#ffffff);
  cnt = 0;
  setupNewLine();
}

void setupNewLine()
{
  if (cnt > 100)
    noLoop();
  
  //  setup line parameters
  goDown = random(0,1) < 0.66 ? true : false;
  goLR = random(0,1) < 0.33 ? true : false;
  x = goDown ? random(width) : 0;
  y = ! goDown ? random(height) : 0;
  
  //  chose random color from palette
  stroke(palette[int(random(palette.length))]);
  strokeWeight(random(2,5));

  cnt ++;
}

void mouseClicked()
{
  setupCanvas();  

  loop();
}



