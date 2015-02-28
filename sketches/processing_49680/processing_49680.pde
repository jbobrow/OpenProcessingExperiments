
import toxi.color.*;
import toxi.geom.*;
 
float   XRAD = 3;
float   YRAD = 8000;
int     RES = 20;
int     NUM_POINTS=10;
 
void setup() {
  size(500, 500);
  smooth();
  noLoop();
}
 
void draw() {
 
  ColorTheme t = new ColorTheme("test");
  t.addRange(ColorRange.BRIGHT, TColor.newRandom(), random(0.2, 0.5));
  ColorList list = t.getColors(250);
 
  background(random(1,255),random(1,255),random(1,255));
  drawSpline(list);
  
}
 
void keyPressed() {
  redraw();
}
 
void drawSpline(ColorList list) {
  smooth();
  noStroke();
  float numCols = list.size();
  Vec3D[] points=new Vec3D[NUM_POINTS];
 points[0]=new Vec3D(-XRAD,random(0.2,0.9)*height,0);
  for(int i=1; i<points.length-1; i++) {
    points[i]=new Vec3D(random(-1,1)*50+(float)i/points.length*width,random(0.25,0.75)*height,random(-1,1)*300);
  }
  points[points.length-1]=new Vec3D(width+XRAD,random(height),0);
  java.util.List vertices=new Spline3D(points).computeVertices(width/RES);
  for(Iterator i=vertices.iterator(); i.hasNext(); ) {
    Vec3D v=(Vec3D)i.next();
    fill(list.get((int) random(numCols)).toARGB());
    ellipse(v.x,v.y,noise(v.y*0.01)*XRAD,noise(v.x*0.01)*YRAD);
  }
}


