
import controlP5.*;

ControlP5 cp5;

int numPaths = 0;

ArrayList paths;

int[] ptHovering = {
  0, 0
};
int lnHovering = 0;

boolean hoverPt;
boolean hoverLn;

float canvasX1=150; 
float canvasX2=550;
float canvasY1=50; 
float canvasY2=450;


void setup() {
   size(600, 500);
   smooth();
  cp5 = new ControlP5(this);
 
  paths = new ArrayList();
  for (int i=0;i<numPaths;i++) {
    paths.add(new ToolPath(random(width), random(height), random(width), random(height), 5));
  }
  cp5.addButton("compile")
    .setPosition(25, 410)
      .setSize(100, 40)
        .setCaptionLabel("Compile GCode");
  ;

  cp5.addButton("grow")
    .setPosition(25, 50)
      .setSize(100, 20)
        .setCaptionLabel("Grow Limbs");
  ;

  cp5.addButton("clear")
    .setPosition(25, 80)
      .setSize(100, 20)
        .setCaptionLabel("Clear All");
  ;
}
void clear() {
  println(paths.size());
  for (int i=paths.size()-1;i >= 0; i--) {

    paths.remove(i);
    //    if(lnHovering>0)
    //         lnHovering -=1;
    redraw();
  }
}


void grow() {
  float randPos;
  boolean growRand;
  float limbRatio = 0.8;
  float x1;
  float x2;
  float y1;
  float y2;
  int randPath = int(random(0, paths.size()));

  ToolPath path = (ToolPath) paths.get(randPath);
  growRand= true;
  //growRand = random(1) < 0.7; 


  if (growRand == true) {
    randPos = random(0.1, 0.9);

    x1 = path.interp(randPos)[0];
    y1 = path.interp(randPos)[1];

    x2 = random(x1-limbRatio*path.len(), x1+limbRatio*path.len());
    y2 = random(y1-limbRatio*path.len(), y1+limbRatio*path.len());

    //println(paths.size());
    if (inCanvas(x2, y2)==true) {
      //println(x1 + ","+y1+" | "+x2+","+y2);
      paths.add(new ToolPath(x1, y1, x2, y2, 5));
    }
  }
}


void compile() {
  compileGcode();
  println("");
  println("-----------------------------------------");
  println("Processing GCode writer");
  println("-----------------------------------------");
  println("");
  for (int i = 0; i < gCode.size();i++) {
    String item = gCode.get(i);
    println(item);
  }
}

void draw() {
  background(230);
  fill(255);
  stroke(200);
  strokeWeight(2);
  rect(canvasX1, canvasY1, canvasX2-canvasX1, canvasY2-canvasY1);
  for (int i = paths.size()-1;i>=0; i--) {
    ToolPath path = (ToolPath) paths.get(i);
    path.display();
  }
  if (drawingLine ==true) {
    strokeWeight(5);
    stroke(50);
    line(pt1X, pt1Y, mouseX, mouseY);
  }

  highlightPt();
  highlightLn();
}
void highlightPt() {
  if (ptHovering[1]>0) {
    ToolPath path = (ToolPath) paths.get(ptHovering[0]);
    ellipse(path.coords(ptHovering[1])[0], path.coords(ptHovering[1])[1], 10, 10);
  }
}
void highlightLn() {
  if (paths.size()>0) {
    if (hoverLn == true) {
      ToolPath path = (ToolPath) paths.get(lnHovering);
      strokeWeight(8);
      stroke(220);
      line(path.coords(0)[0], path.coords(0)[1], path.coords(1)[0], path.coords(1)[1]);
    }
  }
}
boolean inCanvas(float inX, float inY) {
  float x1 = 150; 
  float y1 = 50;
  float x2 = 550; 
  float y2 = 450;

  if (inX > x1 && inX < x2 && inY > y1 && inY < y2)
    return true;
  else
    return false;
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
  float len() {
    float calc = sqrt(pow(abs(x1-x2), 2)+pow(abs(y1-y2), 2));
    return calc;
  }

  float[] interp(float ratio) {
    float[] calc = {
      0.0, 0.0
    };
    calc[0] = map(ratio, 0, 1, x1, x2);
    calc[1] = map(ratio, 0, 1, y1, y2);
    return calc;
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
  int pointHvr(float inX, float inY) {
    float dist1 = sqrt(pow(abs(inX-x1), 2)+pow(abs(inY-y1), 2));
    float dist2 = sqrt(pow(abs(inX-x2), 2)+pow(abs(inY-y2), 2));
    if (dist1 <= thick/2.0)
      return 1;
    else if (dist2 <= thick/2.0)
      return 2;
    else
      return 0;
  }

  boolean lineHvr(float inX, float inY) {
    float p1y, p2y;
    float p1x = min(x1, x2);
    float p2x = max(x1, x2);
    float yTest;
    float tol=5.0;
    if (p1x == x1) {
      p1y = y1;
      p2y = y2;
    }
    else
    {
      p1y = y2;
      p2y = y1;
    }
    if (inX >= p1x && inX<= p2x) {
      if  (inY >= min(p1y, p2y) && inY <= max(p1y, p2y)) { 
        yTest = (inX-p1x)*(p2y-p1y)/(p2x-p1x)+p1y;
        //print (inY); print(","); println(yTest);
        if (abs(inY-yTest)<=tol) {
          return true;
        }
        else
          return false;
      }
      else {
        //hoverLn = false;
        return false;
      }
    }
    else {
      //hoverLn = false;
      return false;
    }
  }
}
boolean drawingLine = false;
float pt1X, pt1Y, pt2X, pt2Y;
void mousePressed() {
  if (inCanvas(mouseX, mouseY)==true) {
    if (mouseButton == LEFT) {
      if (drawingLine ==false) {
        drawingLine = !drawingLine;
        pt1X=mouseX;
        pt1Y=mouseY;
      }
      else
      {
        drawingLine = !drawingLine;
        pt2X=mouseX;
        pt2Y=mouseY;
        paths.add(new ToolPath(pt1X, pt1Y, pt2X, pt2Y, 5));
        pt1X=0;
        pt1Y=0;
        pt2X=0;
        pt2Y=0;
      }
    }
    else if (mouseButton == RIGHT) {
      if (paths.size()>0 && hoverLn == true) {
        ToolPath path = (ToolPath) paths.get(lnHovering); 
        paths.remove(path);
        if (lnHovering>0)
          lnHovering -=1;
        redraw();
      }
    }
  }
  //println(paths.size());
}

void mouseMoved() {
  ptHovering[0]=0;
  ptHovering[1]=0;
  hoverLn=false;
  for (int i = 0 ; i<paths.size(); i++) {
    ToolPath path = (ToolPath) paths.get(i);
    if (path.pointHvr(mouseX, mouseY) > 0) {
      ptHovering[0] = i; 
      ptHovering[1] = path.pointHvr(mouseX, mouseY);
    }

    if (path.lineHvr(mouseX, mouseY) == true) {
      hoverLn = true;
      lnHovering = i;
    }
  }
  //  print(hoverLn);print(",");
  //  println(lnHovering);
}

float round(float number, float decimal) {
  return (float)(round((number*pow(10, decimal))))/pow(10, decimal);
}

float[] convertCoord(float inX, float inY) {
  float canvasSqr = 4.0;
  float[] calc = {
    0, 0
  };
  calc[0] = round(map(inX, canvasX1, canvasX2, 0.0, canvasSqr), 3);
  calc[1] = round(map(inY, canvasY2, canvasY1, 0.0, canvasSqr), 3);

  return calc;
}

StringList gCode;

void compileGcode() {
  float[] convertPt1 = {
    0.0, 0.0
  };
  float[] convertPt2 = {
    0.0, 0.0
  };
  gCode = new StringList();
  gCode.append("G20");
  gCode.append("G1 Y4.0 F50");
  gCode.append("X4.0");
  gCode.append("Y0.0");
  gCode.append("X0.0");
  gCode.append("G1 Z0.15");

  for (int i = 0; i < paths.size(); i++) {
    ToolPath path = (ToolPath) paths.get(i);

    convertPt1 = convertCoord(path.coords(1)[0], path.coords(1)[1]);
    convertPt2 = convertCoord(path.coords(2)[0], path.coords(2)[1]);
    gCode.append("X" + convertPt1[0] + " Y" + convertPt1[1]);
    gCode.append("Z0.0");
    gCode.append("X" + convertPt2[0] + " Y" + convertPt2[1]);
    gCode.append("Z0.15");
  }
  gCode.append("X0.0 Y0.0");
}



