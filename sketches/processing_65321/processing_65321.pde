
int[] sqclr = {200, 200, 200};
int    seph = 10;
int    sepv = 10;
int[]     x = new int[5];
int[]     y = new int[8];
char[]  chr = new char[67];

int w = 250;
int h = 400;

boolean[][] coeff = new boolean[5][8];


void setup()
{
  size(w,h);
  rectMode(CENTER);
  background(0,0,100);
  
  for(int i = 0; i<5; i++)
  {
    for(int j = 0; j<8; j++)
    {
      coeff[i][j] = false;
    }
  }  
  frameRate(60);
}

void draw()
{ 
for(int i = 0; i<8; i++)
{
  y[i] = (h/8)*(i)+h/16;
}

for(int i = 0; i<5; i++)
{
  x[i] = (w/5)*(i)+w/10;
}

for (int i = 0; i<5; i++)
{
  for (int j = 0; j<8; j++)
  {
    fill(sqclr[0], sqclr[1], sqclr[2], 255*int(coeff[i][j]));
    rect(x[i],y[j],w/5-seph/2,h/8-sepv/2);
  }
}
}

void mousePressed()
{
  int posx = (mouseX*5)/w;
  int posy = (mouseY*8)/h;
  
  coeff[posx][posy] = !(coeff[posx][posy]);
  background(0,0,100);
}

void keyPressed()
{
  if(keyCode == ( ENTER))
  {
    int k = 0;
    chr[k] = '{';
    k++;
    chr[k] = '\n';
    k++;
    for(int i = 0; i<8; i++)
    {
       chr[k] = 'B';
       k++;
       for(int j = 0; j<5; j++)
       {
         if(coeff[j][i] == true)
         {
           chr[k] = '1';
           k++;
         }
         else
         {
          chr[k] = '0';
          k++;
         } 
      }
      chr[k] = ',';
      k++;
      chr[k] = '\n';
      k++;
    }
    chr[k] = '}';
    String chrs = new String(chr);
    String[] list = split(chrs, '\n');
    saveStrings("char.txt", list);
    exit();
  }
}
             

