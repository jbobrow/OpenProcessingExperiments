

// int[] regola = { 0, 0, 0, 1, 1, 1, 1, 0 };  // 30
// int[] regola = { 0, 0, 1, 0, 1, 1, 0, 1 };  // 45
// int[] regola = { 0, 1, 1, 0, 1, 0, 0, 1 };  // 105
 int[] regola = { 0, 1, 1, 0, 1, 0, 1, 0 };  // 106 
// int[] regola = { 0, 1, 1, 0, 1, 1, 1, 0 };  // 110
// int[] regola = { 1, 0, 1, 1, 1, 0, 0, 0 };  // 184
boolean inizioRandom = true;
 
boolean[] celle = new boolean[600];
boolean[] nuoveCelle = new boolean[celle.length];

void setup()
{
  size(celle.length,600);
  
  if (inizioRandom) {
    for (int x = 0; x<celle.length; ++x) 
      celle[x] = (random(1)<.5);
  } else {
    celle[celle.length/2] = true;
  }

  frameRate(120);
}
 
void draw()
{
  int y = (frameCount-1) % height;
  
  for (int x = 0; x<celle.length; ++x) {
    
    if (celle[x]) 
      set( x, y, color(0) );
    else  
      set( x, y, color(255) );

    int xSucc = (x+width+1) % width;
    int xPrec = (x+width-1) % width;
    
    int regolaPos = 0;
    if (celle[xPrec]) {
      regolaPos += 4;
    }
    if (celle[x]) {
      regolaPos += 2;
    }
    if (celle[xSucc]) {
      regolaPos += 1;
    }
    
    nuoveCelle[x] = (regola[7-regolaPos] == 1);
  } 
  arrayCopy( nuoveCelle, celle );
}
