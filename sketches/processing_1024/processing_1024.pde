
class cella
{
  int X,Y,W,H;
  int[][] colori = new int[5][5];
  int[][] pX = new int[5][5];
  int[][] pY = new int[5][5];
  cella()
  {
    rect (10,10,50,50);
  }
    
   void drawing(int x, int y, int w, int h,int i, int j)
   {
    fill(100);
    rect (x,y,w,h);      
   } 
  
   void redrawing(int x, int y, int w, int h,int i, int j)
   {
    fill(colori[i][j]);
    rect (x,y,w,h);    
   } 
   
   void redrawingcolor(int x, int y, int w, int h,int i, int j)
   {
    fill(colori[i][j],round(random(colori[i][j])-i),round(random(colori[i][j]))+j);
    rect (x,y,w,h);    
   } 
  
  void colore(int colore, int i, int j)
  {
    colori[i][j]=colore;
   // println("colore "+colore);
  }
   
}

