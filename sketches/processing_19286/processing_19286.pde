
class Day {
  float xloc;
  float yloc;
  float speed;
  float cloudSize;
  float cloudColor;

  Day (float tempxloc, float tempyloc, float tempSpeed, float tempCloudColor) {
    speed = tempSpeed;
    yloc = tempyloc;
    xloc = tempxloc;
    cloudColor = tempCloudColor;
  }

  void display() {
    noStroke();
    fill(cloudColor);
    ellipse(xloc,yloc, 30, 30);
    ellipse((xloc-11),(yloc+4), 20, 20);
    ellipse((xloc+10),(yloc+5), 23, 23);
  }
  void move() {
    xloc=xloc+(.2*speed*(1+abs(pmouseX-mouseX)/8));
    if (xloc>width+10) {
      xloc=0;
    }
  }

  
}


