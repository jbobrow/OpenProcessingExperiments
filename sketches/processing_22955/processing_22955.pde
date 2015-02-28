
int space =10;
int move = 10;
int shift = 10;
int b = 10;
int c = 10;
int d = 10;

void setup()
{




  size (600,600);
  strokeWeight(3);
}

void draw()
{
  
  
  if (space>600)
    space=(0);
  if (move > 600)
    move = (0);
  if (shift >600)
    shift = (0);
  background(50);
  stroke(0,0,255);
  line(space, 0, space,600);
  space = space +6;
  stroke(0,255,0);
  line(move,0,move,600);
  move=move+2;
  stroke(255,0,0);
  line(shift,0,shift,600);
  shift=shift+4;
 
  if(b>600)
  b=(0);
  if(c>600)
  c=(0);
  if(d>600)
  d=(0);
  stroke(0,255,0);
  line(0,b,600,b);
  b=b+2;
  stroke(255,0,00);
  line(0,c,600,c);
  c=c+4;
  stroke(0,0,255);
  line(0,d,600,d);
  d=d+6;
}


