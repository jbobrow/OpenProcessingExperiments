
// persian carpet
// by cameyo 2010
// processing 1.2.1

float a = 1.0;
int left = 0;
int right = 340;
int top = 0;
int bot = 340;
int r,g,b;
color firstColor;
color backC;
//color backC = color(35,95,28);

void setup()
{
  //size(700, 700);
  size(341, 341);
  r = floor(random(1,255));
  g = floor(random(1,255));
  b = floor(random(1,255));
  firstColor = color(g);     
  backC = color(r,g,b);
  background(backC);
  stroke(firstColor);  
  line(left,top,right,top);
  line(left,bot,right,bot);
  line(left,top,left,bot);
  line(right,top,right,bot);
  a = random(1,6);
  chooseColor(left, right, top, bot, a); 
}

void draw()
{}

void chooseColor(int left, int right, int top, int bot, float a)
{
  int midcol, midrow;
  color col;
  
  if (left < (right-1))
     {
       col = floor((get(left,top) + get(right,top) + get(left,bot) + get(right,bot))/a);
       midcol = (left + right) / 2;
       midrow = (top + bot) / 2;
       stroke(col);
       line(left+1, midrow, right-1, midrow);
       line(midcol, top+1, midcol, bot-1);
       chooseColor(left, midcol, top, midrow, a);
       chooseColor(midcol, right, top, midrow, a);
       chooseColor(left, midcol, midrow, bot, a);
       chooseColor(midcol, right, midrow, bot, a);
     }
}

void keyPressed()
{
     setup();
}  

