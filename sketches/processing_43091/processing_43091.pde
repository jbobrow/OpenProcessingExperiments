
int Lbox;
int boxnum = 100 ;
int x[][] = new int[boxnum] [boxnum];
int y [][]= new int [boxnum][boxnum];
color c[][] = new color[boxnum][boxnum];
int next =0 ;

void mousePressed() {
  for (int xx = 0; xx < boxnum; xx++)
  {

    for (int yy = 0; yy < boxnum;yy++)
    {

      if (next==0) {

        c[xx][yy] = color(random(256), random(256), random(256));
      }
      else {
        
        c[xx][yy] = color(random(256));
      }
    }
  }
  if (next==0)
  {
    next=1;
  }
  else {
    next=0; 
   
  }
}
  void setup()
  {
    for (int xx = 0; xx < boxnum; xx++)
    {

      for (int yy = 0; yy < boxnum;yy++)
      {
        x[xx][yy]=yy*10;

        y[xx][yy]=xx*10;
        c[xx][yy] = color(random(256));
      }
    }
    size(560, 760);
  }

  void draw() {

    for (int xx = 0; xx < boxnum; xx++)
    {


      for (int yy = 0; yy < boxnum;yy++)
      {
        fill (c[xx][yy]);
        rect (x[xx][yy], y[xx][yy], 10, 10);
      }
    }
  }


