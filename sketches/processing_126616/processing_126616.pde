
PFont myFont = createFont("BradleyHandITC-48.vlw", 22);

void setup()
{
  size(300,400);
  smooth(); 
  noStroke();
  background(0);  
}

void draw()
{   
  sep();
  drw();
}

void sep()
{

  int l = (int)random(8,15);
  int x1 = (int)random(0,width);
  int r = 100;
  int s = 0;
  
   for(int i = 0; i<l; i++)
   {
     char b = (char)((int)random(47,126));
     fill(0,r,0);
     if(i==(l-1))
        fill(255);
     textFont(myFont); 
     text(b, x1, s);
     s+=20;
     r+=15;
   }
}

void drw()
{   
 for(int x = 0;x<=width;x++)
 {
   for(int y = height; y>=0; y--)
   {
     color loc = get(x,y);
     fill(loc);
     rect(x,y+30,1,1);
     fill(0);
     rect(x,y,1,1);
    }
 }
}

