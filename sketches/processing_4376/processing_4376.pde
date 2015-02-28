
import processing.opengl.*; 
import processing.dxf.*; 
 
int maxdepth = 5; 
int lastX; 
int currDirection = 0; 
float currViewRot = 0; 
float viewRotInc = 1; 
int fillAlphaMixer = 0; 
int strokeAlphaMixer = 0; 
int fillHue = 50; 
float heightHop = 7; 
 
java.util.List levels = new ArrayList(); 
 
void setup()  
{ 
  frameRate(30); 
  size(600, 600, P3D); 
  colorMode(HSB,100); 
  background(100); 
  stroke(236.2); 
  strokeWeight(1.0); 
  for (int i=0; i<=maxdepth;i++) 
  { 
    levels.add(new ArrayList()); 
  } 
  lastX = mouseX; 
  Rectangle r = new Rectangle(0, 0, width, height); 
  subdivide(r, 0);   
} 
 
void mouseMoved() 
{ 
  int currX = mouseX; 
  int diff = currX - lastX; 
  //  viewRotInc = -(currX-width/2)/10; 
  //  if(diff < 0 && diff >= -5) viewRotInc = diff; 
  //  else if(diff > 0 && diff <= 5) viewRotInc = -diff; 
  //  else if(diff > -5 && diff < 5) viewRotInc = 0; 
  //  println (lastX + " : " + currX + " : " + diff);   
  lastX = currX; 
 
  fillAlphaMixer = (int)map(mouseX, 0, height, 0, 100); 
  strokeAlphaMixer = (int)map(mouseY, 0, height, 0, 100); 
} 
 
void mouseClicked() 
{ 
  float pluMin = mouseX-width/1; 
  double curInc = -log(abs(pluMin*15))*.5 * (pluMin/abs(pluMin)); 
  //  println("pow " + pow(pluMin, .05)); 
  //  curInc = pow(pluMin, -2) * (pluMin/abs(pluMin));   
  curInc = -map(abs(pluMin), 0, width/2, 0, 6) *(pluMin/abs(pluMin)) ; 
  //  println(curInc); 
 
  viewRotInc = (float)curInc; 
  fillHue = (int)map(mouseY, 0, height, 0, 100); 
} 
 
void rotateCity() 
{ 
  //  if(viewRotInc == 0) return; 
  currViewRot += viewRotInc; 
  rotateZ(radians(currViewRot)); 
} 
 
void subdivide(Rectangle r, int depth) 
{ 
  if(depth >= maxdepth) return; 
  depth++; 
  java.util.List rectangles = (java.util.List)levels.get(depth); 
  Rectangle[] rects = r.subdivide(); 
  for(int i=0; i< rects.length; i++) 
  { 
    rectangles.add(rects[i]); 
    subdivide(rects[i], depth); 
  }   
} 
 
void draw()  
{ 
  background(80); 
  beginCamera(); 
  camera(); 
  translate(0,0,1200); 
  rotateX(radians(-90)); 
  translate(0,1200,1200); 
  endCamera(); 
  drawRectangles();   
} 
 
void drawRectangles() 
{ 
  pushMatrix(); 
  translate(width/3,height/3,0); 
  rotateCity();   
  translate(-width/3,-height/3,0); 
 
  int depth = 0; 
  Iterator levelsI = levels.iterator();   
  while(levelsI.hasNext()) 
  { 
    depth++; 
    java.util.List rectangles = (java.util.List)levelsI.next(); 
    Iterator rectsI = rectangles.iterator(); 
    while(rectsI.hasNext()) 
    { 
      Rectangle rect = (Rectangle)rectsI.next(); 
      pushMatrix(); 
      translate(rect.x1,rect.y1); 
      strokeAndFill(depth); 
      rect.drawShape(depth); 
      popMatrix(); 
    }   
  } 
  popMatrix(); 
 
} 
 
void strokeAndFill(int depth) 
{ 
  int f = 100/depth; 
  int fillHue = this.fillHue/depth; 
  int fillSat = mouseX/depth; 
  int fillBright = int(70 + viewRotInc); 
  strokeWeight(maxdepth - depth + 1); 
  stroke(f+20, .1* f/depth, f/depth, strokeAlphaMixer/(depth));  
  fill(fillHue, fillSat, fillBright, fillAlphaMixer/(depth)); 
} 
 
class Rectangle 
{ 
  final float x1,x2,y1,y2, w, h, xdiv,ydiv;  
  Rectangle(float x1, float y1, float x2, float y2) 
  { 
    this.x1 = x1; 
    this.x2 = x2; 
    this.y1 = y1; 
    this.y2 = y2; 
    w = x2 - x1; 
    h = y2 - y1; 
    xdiv = random(5,w); 
    ydiv = random(5,h); 
  } 
 
  Rectangle[] subdivide() 
  { 
    Rectangle[] rects = new Rectangle[4]; 
    rects[0] = new Rectangle(x1,y1,x1+xdiv,y1+ydiv); 
    rects[1] = new Rectangle(x1,y1+ydiv,x1+xdiv,y2); 
    rects[2] = new Rectangle(x1+xdiv,y1,x2,y1+ydiv); 
    rects[3] = new Rectangle(x1+xdiv,y1+ydiv,x2,y2); 
    return rects; 
  } 
 
  void drawShape(float factor){ 
    pushMatrix(); 
    heightHop = 15/viewRotInc+7.5; 
    float d = ( maxdepth == factor ? 10 * factor * abs(random(.5,cos(currViewRot/5)*heightHop+1)) : 100); 
    translate(w/2,h/2,d/6); 
    translate(0,0,100*factor); 
    box(w,h,d); 
    popMatrix(); 
    pushMatrix(); 
    popMatrix(); 
  } 
 
  public String toString(){ 
    return x1 + ", " + y1 + ", " + x2 + ",  "+y2; //;+ " \ " + xdiv + " : " + ydiv; 
  } 
}

