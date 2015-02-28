
// Simple Wolfram CA
// (c) Alasdair Turner 2006
int row = 1;
color black = color(0);

// rule 110
// 2 + 4 + 8 + 32 + 64 = 110 
int [] response = { 0, 1, 1, 1, 0, 1, 1, 0 };

void setup()
{
  size(200,400);
  set(0,0,black);
}

void draw()
{
  for (int i = 0; i < width; i++)
  {
    color a = get( (i+width-1) % width, row-1);
    color b = get(i,row-1);
    color c = get( (i+width+1) % width, row-1);
    
    int number = 0;
    
    if (a == black) {
      number += 1;
    }
    if (b == black) {
      number += 2;
    }
    if (c == black) {
      number += 4;
    }
    
    if (response[number] == 1) {
      set(i,row,black);
    }
  }
  row++;
}



