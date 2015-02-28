
int mouse_x;
int cx, cy;
int count = 0;

int state=0;
int nostates=7;

int mode=0;
int nomodes=5;

int op = 0;
int noop = 3;

int shift = 0;

int anon = 0;
int noanon = 3;

//turn
int the;
//wheel

boolean flash=false;

color g_col = color(255, 255, 255, 85);
int roff=128, goff=100, boff=200, rscale=90, gscale=90, bscale=90;
int r=roff, g=goff, b=boff, rs=1, gs=1, bs=1;

int bg = 5;

void setup() {
  
  frameRate(30);

  size(500, 500);

  cx = width/2;
  cy = width/2;

  printstates();
}

void draw() {  
  render();
}

int fn(int x1, int y1, int x2, int y2)
{
  int dx = abs(x2 - x1);
  int dy = abs(y2 - y1);
  return (dx + dy);
}

int fn_tri(int x1, int y1, int x2, int y2)
{
  int dx = abs(x2 - x1);
  int dy = abs(y2 - y1);

  return (dx - dy + cy/2);
}

int min_fn(int x1, int y1, int x2, int y2)
{
  int dx = abs(x2 - x1);
  int dy = abs(y2 - y1);
  return min(dx, dy);
}

int max_fn(int x1, int y1, int x2, int y2)
{
  int dx = abs(x2 - x1);
  int dy = abs(y2 - y1);
  return max(dx, dy);
}

int binary_fn_or(int x1, int y1, int x2, int y2) 
{
  int dx = abs(x2 - x1);
  int dy = abs(y2 - y1);
  return dx | dy;
}

int binary_fn_and(int x1, int y1, int x2, int y2) 
{
  int dx = abs(x2 - x1);
  int dy = abs(y2 - y1);
  return dx & dy;
}

int binary_fn_xor(int x1, int y1, int x2, int y2) 
{
  int dx = abs(x2 - x1);
  int dy = abs(y2 - y1);
  return dx ^ dy;
}

int real_fn(int x1, int y1, int x2, int y2)
{  
  return (int)dist(x1, y1, x2, y2);
}


void render() {

  float anim = 1.0;
  color c;

  if (anon == 1) anim = (random(0.05,10));
  if (anon == 2) {
    shift++;
    if (shift==31) shift=0;
  }
  if (mode==2) count++;

  loadPixels();

  color colorwheel;
  colorwheel = color(cos((20*the++))*rs+r, cos((20*the++))*gs+g, cos((20*the++))*bs+b);


  for (int i = 0; i < pixels.length; i++) {

    c = color(random(bg, bg+bg)); 

    int y = i / width;
    int x = i % width;
    int d = 0;
    float pv = 0;

    if (mode==0) pv = 60;
    if (mode==1) pv = cx;
    if (mode==2) pv = count%cx;
    if (mode==3) pv = 1+count++%cx;
    if (mode==4) pv = random(1)*cx;

    if (state==0) d = fn(cx, cy, x, y)<<shift;
    if (state==1) d = min_fn(cx, cy, x, y)<<shift;
    if (state==2) d = max_fn(cx, cy, x, y)<<shift;
    if (state==3) d = real_fn(cx, cy, x, y)<<shift;
    if (state==4) d = fn_tri(cx, cy, x, y)<<shift;
    if (state==5) 
    {      
      if (op==0) d = binary_fn_or(cx, cy, x, y)<<shift;
      if (op==1) d = binary_fn_and(cx, cy, x, y)<<shift;
      if (op==2) d = binary_fn_xor(cx, cy, x, y)<<shift;
    }
    if (state==6)
    {
      c = #000000;

      d = binary_fn_or(cx, cy, x, y)<<shift;
      if (d < pv)
      {
        c+=color((g_col >> 16) & 0xFF, 0, 0, (g_col >> 24) & 0xFF);
      }

      d = binary_fn_and(cx, cy, x, y)<<shift;
      if (d < pv)
      {
        c+=color(0, (g_col >> 8) & 0xFF, 0, (g_col >> 24) & 0xFF);
      }
      d = binary_fn_xor(cx, cy, x, y)<<shift;
      if (d < pv)
      {
        c+=color(0, 0, g_col & 0xFF, (g_col >> 24) & 0xFF);
      }
    }
    else if ( anim*d < pv)
    { 
      c = colorwheel;
    }

    pixels[i]=c;
  }

  updatePixels();
}

void keyReleased( )
{
  //cycle distance functions
  if (key== ' ') { 
    state++; 
    if (state==nostates) state = 0;
  }
  //cycle comparsion value function
  if (key== 'b') { 
    mode++; 
    if (mode==nomodes) mode = 0;
  }
  //cycle animations
  if (key== 'v') { 
    anon++;
    shift=0;
    if (anon==noanon) anon=0;
  }
  //cycle bitwise behaviour
  if (key== 'n') {
    op++;
    if (op==noop) op=0;
  }
  //bitshift distance behaviour
  if (key== '+') shift++;
  if (key== '-') shift--;
  //colorflash
  if (key== 'g')
  { 
    flash=!flash;
    if (!flash)
    {
      rscale=rs;
      gscale=gs;
      bscale=bs;
      rs=1;
      gs=1;
      bs=1;
    }
    else
    {
      rs=rscale;
      gs=gscale;
      bs=bscale;
    }
  }

  if (key== 'e') r+=5;
  if (key== 'r') g+=5;
  if (key== 't') b+=5;
  if (key== 's') r-=5;
  if (key== 'd') g-=5;
  if (key== 'f') b-=5;
  if (key== 'z') rs+=5;
  if (key== 'u') gs+=5;
  if (key== 'i') bs+=5;
  if (key== 'h') rs-=5;
  if (key== 'j') gs-=5;
  if (key== 'k') bs-=5;

  printstates();
}

void printstates() {
  println( "#space# state: " +state+" #b# mode: "+mode+" #n# opnumber: "+op+" #+#-# shift: "+shift+" #v# anim: "+anon+" #g# flash :"+flash+" offset: "+r+" "+g+" "+b+" scale: "+rs+" "+gs+" "+bs);
}


