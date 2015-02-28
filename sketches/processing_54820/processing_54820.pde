
walk w1;
int r,g,b,l,random2,random3,random4;

PImage elect;
boolean yes;
float si;
int count,frame;
int[][] store = new int[12][7];

void setup()
{
  size(900,500);
  si = 0;
  count = 0;
  yes = true;
  smooth();
  elect = loadImage("elect.png");
  
  w1 = new walk(0);
}

void draw()
{

  int row;
  background(70);
         
  for (int i = 0; i < 800; i = i + 200)
  {
    for (int k = 0; k < 3; k++)
    {
      
      if(k == 0)
       row = 0;
       else if (k ==1)
       row = 77;
       else
       row = 210;
       

       
       if(yes)
       {
           
        r = int(random(80,255));
        store[count][0] = r;
        g = int(random(80,255));
        store[count][1] = g;
        b = int(random(80,255));
        store[count][2] = b;
        l = round(random(0,1));
        store[count][3] = l;
        random2 = round(random(2,3));
        store[count][4] = random2;
        random3 = round(random(4,5));
        store[count][5] = random3;
        random4 = round(random(6,7));
        store[count][6] = random4;
        
        
       }
       else
       {
         
         r = store[count][0];
         g = store[count][1];
         b = store[count][2];
         l = store[count][3];
         random2 = store[count][4];
         random3 = store[count][5];
         random4 = store[count][6];
         

       }
        si += 0.5; 
        count++;   
        w1.bot(i+w1.botX,row,r,g,b,si,l,random2,random3,random4,frame); 
   
    }
    si = 0;
  }
    count = 0;
  yes = false;
}



void mousePressed()
{
  yes = true;
}

