
// Section :2
// Name: Reem el-Ballouli
// course: 297
// Assignment1

class Ring
{
  boolean locked;
  color c;
  int inner_rad, outer_rad, centX, centY, xd, yd;
  
  Ring(int inner_rad, int outer_rad, color c, int x, int y)
  {
    this.inner_rad = inner_rad;
    this.outer_rad = outer_rad;
    this.c = c;
    centX = x;
    centY = y;
    locked = false;
  }
  void draw()
  {
    float x1,y1,x2,y2,rad;
    fill(c);
//    fill(random(0,255),random(0,255),random(0,255));
    noStroke();
    beginShape(QUAD_STRIP);
    for(int deg = 0; deg <= 360; deg +=5)
    {
      rad = radians(deg);
      x1 = sin(rad)*inner_rad + centX;
      y1 = cos(rad)*inner_rad + centY;
      
      x2 = sin(rad)*outer_rad + centX;
      y2 = cos(rad)*outer_rad + centY;
      vertex(x1, y1);
      vertex(x2, y2);
    }
    endShape();
  }
  void mousePressed()
  {
    // when  mouse is prssed the x distance and the y distance from the center of ring to the mouse position is calculated 
    // so that upon any change in mouse position the center of ring will change respectively according to xd and xy relative to new mouse position
    // in short Xd Xy are used to update the x and y position of the center of ring
    xd = mouseX - centX;
    yd = mouseY - centY;
  }
  void move(int x, int y)
  {
    // xd will be negative if mouse is in upper and lower left quarter of ring and hence the new center must icrease by xd with relveance to mouse
    // xd will be positive if mouse is in upper and lower right quarter of ring and hence the new center must decrease by xd with relevance to mouse
    // yd will be negative if mouse is in upper left and right quarter of ring and hence the new center must icrease by yd with relveance to mouse
    // yd will be positive if mouse is in lower left and right quarter of ring and hence the new center must decrease by yd with relevance to mouse
    // in short update center of circle with relvence to mouse position
     centX = x - xd; 
     centY = y - yd;
  }
  boolean mouse_over(int x, int y)
  {
    if(dist(centX, centY, x, y) > inner_rad && dist(centX, centY, x, y) < outer_rad)
      return true;
    return false;
  }
  void lock()
  {
    locked = true;
  }
  void unLock()
  {
    locked = false;
  }
  boolean isLocked()
  {
    return locked;
  }
}

