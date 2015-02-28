

/*
 * DLAparticle class
 *
 * Difussion-Limited Aggregation particle
 */

public class DLAparticle{
  public int x;               // x position
  public int y;               // y position
  public int w;               // region's width
  public int h;               // region's height
  public int xPrev;           // previous x position
  public int yPrev;           // previous y position
  public boolean aggregated;  // controls if it's already aggregated


  //
  // Constructor
  //

  public DLAparticle(int tempX, int tempY, int tempW, int tempH){
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    xPrev = x;
    yPrev = y;
    aggregated = false;
  }


  //
  // Class Methods 
  //

  // update
  public void update(){
    switch(int(random(8))){
      case 0: 
        if(x + 1 < w){
          xPrev = x;
          x++;
        }
        break;
      case 1: 
        if(x + 1 < w && y + 1 < h){
          xPrev = x;
          yPrev = y;
          x++;
          y++;
        }
        break;
      case 2:  
        if(y + 1 < h){
          yPrev = y;
          y++;
        }
        break;
      case 3:
        if(x - 1 >= 0 && y + 1 < h){
          xPrev = x;
          yPrev = y;
          x--;
          y++;
        }
        break;
      case 4:  
        if(x - 1 >= 0){
          xPrev = x;
          x--;
        }
        break;
      case 5: 
        if(x - 1 >= 0 && y - 1 >= 0){
          xPrev = x;
          yPrev = y;
          x--;
          y--;
        }
        break;
      case 6:  
        if(y - 1 >= 0){
          yPrev = y;
          y--;
        }
        break;
      case 7: 
        if(x + 1 < w && y - 1 >= 0){
          xPrev = x;
          yPrev = y;
          x++;
          y--;
        }
        break;
    }
  }

  
  // checkForAggregation
  public int[] checkForAggregation(boolean[] m, boolean val){
    int[] aggregationPos = {-1,-1};
    if(!aggregated && m[x + y*w] == val){
      aggregated = true;
      aggregationPos[0] = xPrev;
      aggregationPos[1] = yPrev;
    }
    return aggregationPos;
  }

}


