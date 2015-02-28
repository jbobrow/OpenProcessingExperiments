
//How individual balls behave



class Ball {
  float inX = 0; // x location of individual circle
  float inY = 0; // y location of individual circle
  float tX = random (0, 1); // x time
  float tY = random (0, 1); // y time
  float theta;
  float incrementX = 0.01;
  float incrementY = 0.03;

   
  Ball () {
 
  }

  void circle(float inx, float iny, float rad, float r, float g, float b) {
    
    //theta += 0.02; // speed of oscillation
    theta = noise(tX);
    float osc = (sin(theta)+1)*25; // changes transparency
    
    inx = inx + noise (tX)*width; // creates variation of x location
    iny = iny + noise (tY)*height; // creates variation of y locaiton
    
    tX += incrementX;
    tY += incrementY;
    
//////Draws circles
    //stroke (r,g,b, osc+25);
    noStroke();
    fill (r,g,b, osc);
    ellipse (inx, iny, rad, rad);
  }
}


