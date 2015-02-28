
/*
  ************************************
  *  StickyBall                      *
  *  sticky_pack    Sanford Gifford  *
  *  09.24.10        Sarah Lawrence  *
  *                                  *
  ************************************
*/

class StickyBall
{
  float x = 0; // location
  float y = 0;
  
  float vx = 0; // velocity
  float vy = 0;
  
  float r = 0; // radius
  
  float popy = 0; // score popup location (relative)
  float popa = 0; // score popup alpha
  int pops = 0; // popped score
  
  boolean popping = false; // are we doing that score popup thing?
  
  
  // all color data held in one array.  Pulse colors aren't used, another feature gone un-realized
  float[] colors = {
              /* fill colors: R -  0; G -  1; B -  2 */  50, 50,  50, // 0  1  2
            /* stroke colors: R -  3; G -  4; B -  5 */  0,  150, 0,  // 3  4  5
        /* pulse fill colors: R -  6; G -  7; B -  8 */  0,  0,   0,  // 6  7  8
      /* pulse stroke colors: R -  9; G - 10; B - 11 */  255,  0, 0   // 9  10 11
  };
  
  StickyBall(float nr, float nx, float ny, float nvx, float nvy)
  {
    r = nr;
    x = nx;
    y = ny;
    vx = nvx;
    vy = nvy;
  }
  
  /*
    score popup starter
  */
  
  void pop(int iScore)
  {
    pops = iScore;
    popy = 0;
    popa = 255;
    popping = true;
  }
  
  void display()
  {
    if(popping)
    {
      if(popa <= 0) // if alpha is already zero
      {
        popping = false; // then we don't really need to keep messing with this
      }else{ // otherwise
        fill(255, 255, 255, popa);
        textFont(OCRA, 32);
        textAlign(CENTER);
        text("+" + pops, x, y + popy);
        
        popy--; // up is negative
        popa -= 5; // controls how fast the number fades out
      }
    }
    stroke(colors[3], colors[4], colors[5]);
    strokeWeight(3);
    fill(colors[0], colors[1], colors[2]);
    
    ellipse(x, y, 2 * r, 2 * r); // finally, drawing the circle itself
  }
}

