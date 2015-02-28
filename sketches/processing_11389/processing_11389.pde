
public class Enemy 
{
  int width;
  int height;

  int x1;
  int y1;

  Enemy(int W, int H) 
  {
    width = W;
    height = H;
  }
  

  void setPosition(int X, int Y) 
  {
    x1 = X;
    y1 = Y;
  }
  
 
 
  //
  void drawEnemy(){

   image(img, x1, y1, width, height);
   
  }
}

