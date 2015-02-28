

int numPaths = 0;

ArrayList paths;

int[] isHovering = {
  0, 0
};

void setup() {
  size(500, 500);
  paths = new ArrayList();
  for (int i=0;i<numPaths;i++) {
    paths.add(new ToolPath(random(width), random(height), random(width), random(height), 5));
  }
}

void draw() {
  background(0);
  for (int i = paths.size()-1;i>=0; i--) {
    ToolPath path = (ToolPath) paths.get(i);
    path.display(); 
  }
  if (editing ==true) {
    strokeWeight(5);
    stroke(50);
    line(pt1X, pt1Y, mouseX, mouseY);
  }
  highlightPt();
}
void highlightPt() {
  if (isHovering[1]>0) {
    ToolPath path = (ToolPath) paths.get(isHovering[0]);
    ellipse(path.coords(isHovering[1])[0], path.coords(isHovering[1])[1], 10, 10);
  }
}
class ToolPath {
  float x1, y1, x2, y2;
  float thick;
  ToolPath(float inX1, float inY1, float inX2, float inY2, float inThick) {
    x1 = inX1;
    y1 = inY1;
    x2 = inX2;
    y2 = inY2;
    thick = inThick;
  }
  void display() {
    fill(127);
    stroke(200);
    strokeWeight(thick);
    line(x1, y1, x2, y2);
    noStroke();
    ellipse(x1, y1, thick, thick);
    ellipse(x2, y2, thick, thick);
  }
  float[] coords(int end) {
    float[] arr= {
      0.0, 0.0
    };

    if (end==1) {
      arr[0] = x1;
      arr[1] = y1;
    }
    else
    {
      arr[0] = x2;
      arr[1] = y2;
    } 
    return arr;
  }
  int hovering(float inX, float inY) {
    float dist1 = sqrt(pow(abs(inX-x1), 2)+pow(abs(inY-y1), 2));
    float dist2 = sqrt(pow(abs(inX-x2), 2)+pow(abs(inY-y2), 2));
    if (dist1 <= thick/2.0)
      return 1;
    else if (dist2 <= thick/2.0)
      return 2;
    else
      return 0;
  }
}
boolean editing = false;
float pt1X, pt1Y, pt2X, pt2Y;
void mousePressed() {
  if (editing ==false) {
    editing = !editing;
    pt1X=mouseX;
    pt1Y=mouseY;
  }
  else
  {
    editing = !editing;
    pt2X=mouseX;
    pt2Y=mouseY;
    paths.add(new ToolPath(pt1X, pt1Y, pt2X, pt2Y, 5));
    pt1X=0;
    pt1Y=0;
    pt2X=0;
    pt2Y=0;
  }
}
boolean hoverPt;
void mouseMoved() {
  isHovering[0]=0;
  isHovering[1]=0;
  for (int i = paths.size()-1;i>=0; i--) {
    ToolPath path = (ToolPath) paths.get(i);
    if (path.hovering(mouseX, mouseY) > 0) {
      isHovering[0] = i; 
      isHovering[1] = path.hovering(mouseX, mouseY);
    }
  }
//  println(isHovering);
}



