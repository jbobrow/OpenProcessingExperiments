
class SpiroCircle {

  int center_x = 0;
  int center_y = 0;
  float r1 = 1;
  float r2 = 0;
  float h = 0;
  float x, y, prev_x, prev_y;
  int iter;
  boolean first;

  // constructor
  public void SpiroCirle() {
  }

  public void init(int x, int y, float radius_1, float radius_2, float point_distance) {
    center_x = x;
    center_y = y;
    r1 = radius_1;
    r2 = radius_2;
    h = point_distance;
    first = true;
  }

  public void drawIterations(int iter, float incr) {
    float rads = 0.0;

    for(int i=0; i < iter * 1; ++i) {
      stroke((sin(PI*i/iter)*255)-5 );
      drawPoint(rads);
      rads+=incr;
    }
  }

  private void drawPoint(float rads) {
    float x, y;

    x = center_x + (r1-r2)*cos(rads)+h*cos((r1-r2)/r2*rads);
    y = center_y + (r1-r2)*sin(rads)+h*sin((r1-r2)/r2*rads);

    if(first) {
      first = false;
    } else {
      strokeWeight (3);
      stroke(255);
      point (prev_x,prev_y);

      strokeWeight(random(2));
      stroke(random(255),random(255),random(150,255));
      line (prev_x,prev_y,x,y);
    }
   

    prev_x = x;
    prev_y = y;
  }
}


