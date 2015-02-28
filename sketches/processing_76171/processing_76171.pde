


//GLOBALS
int numPoints=10;
vpoint[] vpoints=new vpoint[numPoints];
void setup() {

  size(320, 240);

  //create initial points
  for (int f=0;f<numPoints;f++)
    vpoints[f]=new vpoint(10+int(random(width-20)), 10+int(random(height-20)), int(random(-10,10)), int(random(-20,20)));
}


void draw() {

  float tempDist, tempDist2;
  color tempPink;

  background(0);
  
  //for all window points get nearest dist and colour
  for (int wx=0; wx<width; wx++) 
    for (int wy=0; wy<height; wy++) {
      //set impossible value
      tempDist=width;
      for (int n=0; n<numPoints; n++)
      {
        tempDist2 = dist(wx, wy, vpoints[n].x, vpoints[n].y);
        if (tempDist2 <= tempDist) {
          tempDist=tempDist2;
          //set color according to distance
          tempPink=int(map(tempDist, 0, 255, 140, 0));
          set(wx, wy, color(tempPink, tempPink>>1, tempPink>>1));
        }
      }
    }

  //move points
  for (int n=0; n<numPoints; n++) 
    vpoints[n].update();
}



class vpoint {
  int x, y;       //position
  int dx, dy;     //movement deltas
  vpoint(int xx, int yy, int ddx, int ddy) {
    x=xx;
    y=yy;
    dx=ddx;
    dy=ddy;
  }
  void update(){

    x+=dx;
    y+=dy;
    if ((x<10) || (x>width-10)) dx=-dx;
    if ((y<10) || (y>height-10)) dy=-dy;
  }
}

