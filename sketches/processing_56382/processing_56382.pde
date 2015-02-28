
class Arc
{
  float sa, fa; // start angle, finish angle
  float r; // radius
  float cx, cy;
  Segment[] thisarc; // an array of Segments will make up our arc!
  int numSegments = 50; // the arc will be split into 50 segments
  float angleinc; // angle increments, based on how many segments

  Arc(float cx, float cy, float sa, float fa, float r)
  {
    this.cx = cx;
    this.cy = cy;
    this.sa = sa; 
    this.fa = fa; 
    this.r = r; 
    thisarc = new Segment[numSegments];
    angleinc = (fa-sa) / numSegments;
    initializeArc();
  }

  void render()
  {
    pushMatrix();
    //translate(cx, cy);
    initializeArc();
    for (int i = 0; i < numSegments; i++)
    {
      thisarc[i].render(); // render every Segment object in the array, thus creating the arc

      float _sx = thisarc[i].sx;
      float _sy = thisarc[i].sy;
      float _fx = thisarc[i].fx;
      float _fy = thisarc[i].fy;

      if ( thisarc[i].check(_sx, _sy, _fx, _fy, ball.location.x, ball.location.y, ball.tempr) == true)
      {
        doLineCollision(ball, thisarc[i]);
      }
    }
    popMatrix();
  }

  //Fill the array with Segment objects, based on the start and end angle.
  void initializeArc() 
  {
    float i = sa;
    float thisx=0, thisy=0, nextx=0, nexty=0;

    for (int index = 0; index < numSegments; index ++)
    { 
      thisx = cx + (r * cos(i));
      thisy = cy + (r * sin(i));
      nextx = cx + (r * cos(i+angleinc));
      nexty = cy + (r * sin(i+angleinc));
      thisarc[index] = new Segment(thisx, thisy, nextx, nexty);
      i+=angleinc;
    }
  }
}


