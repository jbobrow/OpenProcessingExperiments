
import java.util.ArrayList;
import java.awt.geom.Point2D;
import java.awt.geom.Rectangle2D;

// name of file where bluenoise (i.e., random but regularly distributed) points are stored
String filename;
String line;
BufferedReader reader;
// storage for points
ArrayList<BNPoint> pts = new ArrayList<BNPoint>(4096);
// count controls animation state
int count = 0;
// set counting to false to freeze animation
boolean counting = true;
// state vars for the two sets of points that are separately animated
boolean showMultiColorOne = false;
boolean showMultiColorTwo = false;
boolean drawTrianglesOne = false;
boolean drawTrianglesTwo = false;
int evalOne = 0;
int evalTwo = 1;
// points can be sorted by various Comparaters, sortOrder selects one of them
int sortOrder = 3;
float rippleSpeed1 = 1;
float rippleSpeed2 = 1;
color colorOne;
color colorTwo;
float colorSpeed = 1;
// arrays for colors and permutating color components
int[] choosy = {0,1,2};
float[] colores = {0,0,0};
// range of values in bluenoise points file
float dataWidth = 1024.0f;
float scalingFactor;
float distance;
float xctr;
float yctr;
// control params for triangle rotation
int rotationInc = 0;
float xoff = 0;
float yoff = 0;
// points for center of two ripples
BNPoint p1;
BNPoint p2;


public void setup() {
  size(800,800);
  background(127);
  smooth();
  xctr = width/2;
  yctr = height/2;
  // to start with, ripples a generated from the center
  p1 = new BNPoint(xctr, yctr);
  p2 = new BNPoint(xctr, yctr);
  colorOne = color(0, 0, 0);
  colorTwo = color(255, 255, 255);
  filename = "coords_4096.txt";
  initCoords(filename, sortOrder);
  // randomize various parameters
  randomSetup();
}


public void initCoords(String filename, int sortOrder) {
  reader = createReader(filename);
  boolean isGood = true;
  scalingFactor = width/dataWidth;
  while (isGood) {
    try {
      line = reader.readLine();
    } 
    catch (IOException e) {
      e.printStackTrace();
      line = null;
    }
    if (line == null) {
      // Stop reading because of an error or file is empty
      isGood = false;
    } 
    else {
      String[] pieces = split(line, ' ');
      float x = (Float.valueOf(pieces[0]) + 8) * scalingFactor;
      float y = (Float.valueOf(pieces[1]) + 8) * scalingFactor;
      pts.add(new BNPoint(x, y));
    }
  }
  if (0 == sortOrder) {
    Collections.sort(pts, new CompareX());
  }
  else if (1 == sortOrder) {
    Collections.sort(pts, new CompareY());
  }
  else if (2 == sortOrder) {
    Collections.sort(pts, new CompareCtr(xctr, yctr));
  }
  else {
    Collections.sort(pts, new CompareAng(xctr, yctr));
  }
}


public void randomSetup() {
  showMultiColorOne = (random(0,1)) >= 0.5 ? false : true;
  showMultiColorTwo = (random(0,1)) >= 0.5 ? false : true;
  drawTrianglesOne = (random(0,1)) >= 0.5 ? false : true;
  drawTrianglesTwo = (random(0,1)) >= 0.5 ? false : true;
  float theta = random(0, TWO_PI);
  float radius = width > height ? height/2 : width/2;
  float magnitude = random(0, radius);
  p1.x = magnitude * cos(theta) + xctr;
  p1.y = magnitude * sin(theta) + yctr;
  theta = random(0, TWO_PI);
  magnitude = random(0, radius);
  p2.x = magnitude * cos(theta) + xctr;
  p2.y = magnitude * sin(theta) + yctr;
  theta = random(0, TWO_PI);
  magnitude = random(0, radius);
  xoff = magnitude * cos(theta);
  yoff = magnitude * sin(theta);
}


public void draw() {
  ripple();
  if (counting) count++;
}


public void ripple() {
  float fx = 21.0f * colorSpeed;
  float fy = 34.0f * colorSpeed;
  float kx = 2 * PI * (count % fx)/fx;
  float ky = 2 * PI * (count % fy)/fy;
  colorMode(RGB, 1.0);
  background(0.5);
  fill(0);
  noStroke();
  for (int i = 0; i < pts.size(); i++) {
    if (i % 2 == evalOne) continue;
    // draw odd-numbered dots
    BNPoint pt = pts.get(i);
    float x = pt.x;
    float y = pt.y;
    float d = dist(x, y, xctr, yctr);
    if (d > width/2) continue;
    float d1 = dist(x, y, p1.x, p1.y);
    if (showMultiColorOne) {
      float c0 = (cos(x) + 1)/2;
      float c1 = (sin(y) + 1)/2;
      float c2 = 1 - (cos(d1/width * 5 * PI + kx) + 1)/2;
      int fac = 3;
      colores[0] = c0;
      colores[1] = c1;
      colores[2] = c2;
      fill(colores[choosy[0]], colores[choosy[1]], colores[choosy[2]]);
    }
    else {
      fill(colorOne);
    }
    // make concentric rings
    float w = (cos(rippleSpeed1/1.618 * (d1)/width * (-PI) + kx + 1) * 8 ) + 9;
    // muddy the signal, vary the size
    w += sin(y + ky + 1) * 6;
    // compensate for resized window
    w = w * scalingFactor;
    if (drawTrianglesOne) {
      w *= 0.8;
      triang(x,y,w);
    }
    else {
      ellipse(x,y,w,w);
    }
    pt.setW(w);
  }
  for (int i = 0; i < pts.size(); i++) {
    if (i % 2 == evalTwo) continue;
    // draw even-numbered dots
    BNPoint pt = pts.get(i);
    float x = pt.x;
    float y = pt.y;
    float d = dist(x, y, xctr, yctr);
    if (d > width/2) continue;
    float d2 = dist(x, y, p2.x, p2.y);
    if (showMultiColorTwo) {
      float c0 = (cos(x) + 1)/2;
      float c1 = (sin(y) + 1)/2;
      float c2 = 1 - (cos(d2/width * 5 * PI + kx) + PI/4)/2;
      colores[0] = c2;
      colores[1] = c1;
      colores[2] = c0;
      fill(colores[choosy[0]], colores[choosy[1]], colores[choosy[2]]);
    }
    else {
      fill(colorTwo);
    }
    // make concentric rings
    float w = (cos(rippleSpeed2/2.618 * (d2)/width * PI + kx) * 8 ) + 9;
    // muddy the signal, vary the size
    w += sin(y + ky) * 6;
    // compensate for resized window
    w = w * scalingFactor;
    if (drawTrianglesTwo) {
      w *= 0.8;
      triang(x,y,w);
    }
    else {
      ellipse(x,y,w,w);
    }
    pt.setW(w);
  }
}


void mouseMoved() {
  float d =  mouseY - yctr;
  float newSpeed = (d * 233.0f/width) ;
  if (newSpeed != rippleSpeed1) {
    rippleSpeed1 = newSpeed;
  }
  d =  mouseX - xctr;
  newSpeed = (d * 233.0f/width) ;
  if (newSpeed != rippleSpeed2) {
    rippleSpeed2 = newSpeed;
  }
  newSpeed = dist(mouseX, mouseY, xctr, yctr)/width + 1.0f;
  if (newSpeed != colorSpeed) {
    colorSpeed = newSpeed;
  }
}


void mouseClicked() {
  if (CODED == key) {
    if (CONTROL == keyCode) {
      println("CONTROL: " + mouseX + ", " + mouseY);
      xoff = (mouseX - xctr);
      yoff = (mouseY - yctr);
    }
    else if (SHIFT == keyCode) {
      println("SHIFT: " + mouseX + ", " + mouseY);
      p1.setX(mouseX);
      p1.setY(mouseY);
    }
    else if (ALT == keyCode) {
      println("ALT: " + mouseX + ", " + mouseY);
      p2.setX(mouseX);
      p2.setY(mouseY);
    }
  }
}


void keyPressed() {
  // report
  if (key == 'r') {
    println("\nlocation: " + mouseX + ", " + mouseY + ", colorSpeed: " + colorSpeed);
    println("count: " + count + ", rippleSpeed1: " + rippleSpeed1 + ", rippleSpeed2: " + rippleSpeed2);
    println("p1: " + p1.x +", "+ p1.y + ", p2: " + p2.x +", "+ p2.y);
    println("rotationInc: " + rotationInc + ", xoff: " + xoff + ", yoff: " + yoff);
    println("sortOrder: " + sortOrder + ", evalOne: " + evalOne + ",  evalTwo: " + evalTwo + "\n");
  }
  // freeze
  if (key == ' ') {
    if (counting) { counting = false; }
    else { count++; }   
  }
  if (RETURN == keyCode || ENTER == keyCode) {
     counting = true;
   }
  // UP and DOWN increment count when frozen
  if (CODED == key) {
    // increment count
    if (UP == keyCode) count++;
    // decrement count
    if (DOWN == keyCode) count--;
      // rotate triangles cw
    if (RIGHT == keyCode) rotationInc++;
    // rotate triangles ccw
    if (LEFT == keyCode) rotationInc--;
  }
  // swap evalOne and evalTwo
  if (key == 'x') {
    int temp = evalOne;
    evalOne = evalTwo;
    evalTwo = temp;
  }
  // initialize with new sort
  if (key == 'i') {
    pts.clear();
    sortOrder = (sortOrder + 1) % 4;
    initCoords(filename, sortOrder);
  }
  if (key == 'a') {
    randomSetup();
  }
  // reset
  if (key == 'z') {
    rotationInc = 0;
    yoff = 0;
    xoff = 0;
    p1.setX(xctr);
    p1.setY(yctr);
    p2.setX(xctr);
    p2.setY(yctr);
    evalOne = 0;
    evalTwo = 1;
    showMultiColorOne = false;
    showMultiColorTwo = false;
    drawTrianglesOne = false;
    drawTrianglesTwo = false;
    pts.clear();
    sortOrder = 2;
    initCoords(filename, sortOrder);
  }
  if (key == '1') {
    showMultiColorOne = !showMultiColorOne;
  }
  if (key == '2') {
    showMultiColorTwo = !showMultiColorTwo;
  }
  if (key == '3') {
    drawTrianglesOne = !drawTrianglesOne;
  }
  if (key == '4') {
    drawTrianglesTwo = !drawTrianglesTwo;
  }
  // step to next color permutation when '5' is pressed
  if(key=='5') {
    boolean hasNextPerm = nextPerm(choosy);
    if (!hasNextPerm) {
      // set the array to its beginning state
      choosy[0] = 0;
      choosy[1] = 1;
      choosy[2] = 2;
    }
    // println(choosy[0] +", "+choosy[1] +", "+ choosy[2]);
  }
}


// draw a triangle
void triang(float x, float y, float r) {
  float x0, y0, x1, y1, x2, y2;
  float k = 2.23606797749979; // sqrt(5)
  float yinc = r/k;
  float xinc = 2 * yinc;
  x0 = 0;
  y0 = -r;
  x1 = xinc;
  y1 = yinc;
  x2 = -xinc;
  y2 = y1;
  // float ang = getAngle(x - xctr, y - yctr) + 0.4636476;  // plus 30 degree rotation to point triangle to center
  float ang = getAngle(x - (xctr + xoff), y - (yctr + yoff)) + ((count + rotationInc) % 128)/128.0 * 2 * PI;  
  float[] pt0 = {
    x0, y0
  };
  pt0 = translateCoord(rotateCoord(pt0, ang), x, y);
  // println("ang: " + ang + " pt: " + pt0[0] +", " + pt0[1]);
  float[] pt1 = {
    x1, y1
  };
  pt1 = translateCoord(rotateCoord(pt1, ang), x, y);
  float[] pt2 = {
    x2, y2
  };
  pt2 = translateCoord(rotateCoord(pt2, ang), x, y);
  triangle(pt0[0], pt0[1], pt1[0], pt1[1], pt2[0], pt2[1]);
}


// Given a dx and dy return the angle
// of rotation measured clockwise from 0
// degrees in radians
float getAngle(float dx, float dy) {
  double ang;
  if (dx != 0) {
    ang = Math.atan(Math.abs(dy/dx));
  }
  else if (dy != 0) {
    ang = PI / 2;
  }
  else {
    ang = 0;
  }
  if (dx < 0) {
    if (dy < 0) {
      ang = ang + PI;
    }
    else {
      ang = PI - ang;
    }
  }
  else if (dy < 0) {
    ang = 2 * PI - ang;
  }
  return (float) ang;
}


// Rotate points through an angle
// returns a new deltaX and deltaY
// degrees in radians
float[] rotateCoord(float[] pin, float rot) {
  double sintheta = Math.sin(rot);
  double costheta = Math.cos(rot);
  float dx = pin[0];
  float dy = pin[1];
  // rotation is counterclockwise from the coordinate axis
  float[] pout = new float[2];
  pout[0] = (float) (dx * costheta - dy * sintheta);
  pout[1] = (float) (dx * sintheta + dy * costheta);
  return pout;
}

// translate coordinate distance xTrans, yTrans along x and y axes
float[] translateCoord(float[] pin, float xTrans, float yTrans) {
  float[] pout = new float[2];
  pout[0] = pin[0] + xTrans;
  pout[1] = pin[1] + yTrans;
  return pout;
}


/**
 * Step to next permutation of an Array of integers. The next permutation is the one
 * that would appear next in a sorted list of all permutations, where the sorting function
 * orders in descending order. In the final permutation, each nubmer is greater than the previous
 * and no more permutations are possible. This is an impementation of an algorithm described by 
 * Edsger Dijkstra in "A Discipline of Programming" [Prentice-Hall, 1976].
 * @return   true if the permutation was sucessfully generated, otherwise false
 */
boolean nextPerm(int[] permArray) {
  int i = permArray.length - 2;
  while (permArray[i] >= permArray[i + 1]) {
    if (i-- <= 0) {
      // permutation is in terminal ordering
      return false;
    }
  }
  int j = permArray.length - 1;
  while (permArray[j] <= permArray[i]) j--;
  swap(i, j, permArray);
  i++;
  j = permArray.length - 1;
  while (i < j) {
    swap(i, j, permArray);
    i++;
    j--;
  }
  /* println("i: " + i + " j: " + j); */
  return true;
}


void swap(int i, int j, int[] permArray) {
  int temp = permArray[i];
  permArray[i] = permArray[j];
  permArray[j] = temp;
}


