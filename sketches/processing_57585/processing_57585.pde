
int [] family = new int[2];
int [] same = new int [2];
int[] proud = new int [2];

void setup ()
{
  size (600,600);
  background (255);
  smooth();
 family = int (loadStrings("familys_leaning.txt"));
 same = int (loadStrings("same.txt"));
 proud = int (loadStrings("proud.txt"));
 
}

void draw ()
{
  for (int i=0; i<family.length; i++)
  { noStroke();
    fill(0,0,255,1);
   ellipse((family[i]*200)+100, height/2, 100, 100);
  }
}

