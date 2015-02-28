

void ledstrip(int a, int b, String bits)
{
  int size = 20;
  int inset = 2;
  for (int i=0 ; i<bits.length() ; i++)
  {
    fill(255);
    rect(a+i*size, b, size, size);
    if (bits.charAt(i)=='0')
      fill(#200000);
    else
      fill(#ff0000);
    rect(a+i*size+inset, b+inset, size-2*inset, size-2*inset);
    text(bits.charAt(i), a+i*size+inset, b+size);
  }
}

PFont f;

void setup()
{
  size(200, 100);
  f = loadFont("Consolas.vlw");
  textAlign(LEFT, TOP);
  frameRate(4);
}

int value=0;
int n=0;

void draw()
{
  textSize(20);
  background(204);
  ledstrip(10, 10, binary(value, 8));
  textFont(f);
  fill(0);
  text(hex(value, 2), 10, 50);
  text(nf(value, 3), 10, 70);
  text(char(value), 130, 50);

  textSize(10);
  text("hex", 40, 58);
  text("decimal", 50, 78);
  text("ascii", 150, 58);
}

void mouseClicked()
{
  if ( (10<mouseY) && (mouseY<30) && (10<mouseX) )
  {
    int mouse = (mouseX-10)/20;
    if ( mouse<8 )
    {
      int mask = 1<<(7-mouse) ;
      value ^= mask;
    }
  }
}


