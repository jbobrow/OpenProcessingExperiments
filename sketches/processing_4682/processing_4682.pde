
// UPC bar code clock.

// Minimal setup. 
// 1. Initialize screen
// 2. Initialize code table
// 3. Initialize font
void setup() 
{
  size(95, 45);
  init_upc_table();
  PFont font = loadFont("CourierNewPSMT-12.vlw");
  textFont(font);
  fill(0);
}

// The table is left pattern. For right pattern, invert the bits.
int[] upc_table = new int[10];
void init_upc_table()
{
  upc_table[0] = unbinary("0001101");
  upc_table[1] = unbinary("0011001");
  upc_table[2] = unbinary("0010011");
  upc_table[3] = unbinary("0111101");
  upc_table[4] = unbinary("0100011");
  upc_table[5] = unbinary("0110001");
  upc_table[6] = unbinary("0101111");
  upc_table[7] = unbinary("0111011");
  upc_table[8] = unbinary("0110111");
  upc_table[9] = unbinary("0001011");
} 	

// Minimal draw.
// 1. Clear
// 2. Draw date and time as UPC bar code
void draw() 
{
  background(255);
  upc_time(0, 0);
}

// Draws date and time as barcode at (x, y).
int upc_time(int x, int y)
{
  String txt = datestr();
  return upc(txt, x, y);
}

// Returns date and time in 'yymmddhhmmss' format.
String datestr()
{
  return nf(year(),2).substring(2) + nf(month(), 2) + nf(day(), 2) + nf(hour(),2) + nf(minute(), 2) + nf(second(), 2);
}

// Draws barcode for string of 12 numbers at (x, y).
int upc(String str, int x, int y)
{
  int l = str.length();
  upc_left();
  x = upc_b(x, y);
  for (int i = 0; i < l; ++i)
  {
    int c = str.charAt(i) - '0';
    x = upc(c, x, y);
    if (i == 5)
    {
      upc_right();
      x = upc_m(x, y);
    }
  }
  x = upc_b(x, y);
  return x;
}


// UPC left/right mode. 
int upc_mode = 1;

// Switch to left mode.
void upc_left()
{
  upc_mode = 1;
}

// Switch to right mode.
void upc_right()
{
  upc_mode = 0;
}

// Draw boundary bars at (x, y).
int upc_b(int x, int y)
{
  for(int i = 0; i < 3; ++i)
  {
    stroke(i%2==0?0:255);
    int ix = x + i;
    line(ix, y, ix, y + 29+6);
  }
  return 3 + x;
}

// Draw middle bars at (x, y).
int upc_m(int x, int y)
{
  for(int i = 0; i < 5; ++i)
  {
    stroke(i%2==0?255:0);
    int ix = x + i;
    line(ix, y, ix, y + 29+6);
  }
  return 5 + x;
}

// Draw bars for single digit (0-9) at (x, y).
int upc(int nr, int x, int y)
{  
  if (nr >= 0 && nr <= 9)
  {
    int upc_code = upc_table[nr];
    for(int i = 0; i < 7; ++i)
    {
      boolean val = ((upc_code >> i) & 1) == upc_mode;
      stroke(val ? 0 : 255);
      int ix = 6-i+x;
      line(ix, y, ix, y+29);
    }
    text(nr, x, y + 30+12);
  }
  return 7 + x;
}

