

public class BoundedBox extends Box
{
  int topX, topY, bottomX, bottomY; //Boundaries.
  boolean drawBoundary = false;
  
  public BoundedBox(int startX, int startY, int startS, int nTopX, int nTopY, int nBottomX, int nBottomY){
    super(startX,startY,0,startS);    
    topX = nTopX;
    topY = nTopY;  
    bottomX = nBottomX;
    bottomY = nBottomY;
    
    
  }
  
  public void act(){
    //Bounded Boxes implement slow, random, bounded, elastic movement.
    super.act();
    
    if (drawBoundary){
      fill(boxColor,10);
      rect(topX,topY,bottomX-topX,bottomY-topY);
      drawBoundary = false;
    }
    
    if(x<topX)
      vX++;
    if(x>bottomX)
      vX--;
    if(y<topY)
      vY++;
    if(y>bottomY)
      vY--;
  }
  
  public void drawBoundary(){
    if (drawBoundary)
      drawBoundary = false;
    else
      drawBoundary = true;
  }
  
}
  

