
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/10500*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
PPolygon pp1, pp2;

void setup(){
  size(600,600);
  pp1 = new PPolygon();
  pp2 = new PPolygon();
  pp1.theta = -pp1.theta;
  frameRate(70);
  textAlign(CENTER); 
  PFont myFont; myFont = loadFont("AlaskanNights-48.vlw");
  textFont (myFont, 48);  textMode(SCREEN);
}

void draw(){
  background(255);
  fill(0);
  text("Click to reset", width/2, height*.95);
  pp1.detectCollision();
  pp2.detectCollision();
  pp1.theta+=.01;
  pp2.theta-=.01;
  pp1.draw();
  pp2.draw();
  pp1.xc = mouseX;
  pp1.yc = mouseY;
}

class PPolygon{
  int v = (int)random(3,5), xc=width/2, yc=height/2;
  int[] x,y,x2,y2;
  float theta;
  color c, c2;
  Rectangle bounds;
  Polygon b, a;
  PMatrix2D target;

  PPolygon(){
    x = new int[v];
    y = new int[v];
    x2 = new int[v];
    y2 = new int[v];
    a = new Polygon();
    target = new PMatrix2D();
    bounds = new Rectangle();
    for(int i=0; i<v; i++){
      x[i] = (int)random(-width*.25,width*.25);
      y[i] = (int)random(-height*.25,height*.25);  
    }
    b = new Polygon(x,y,v); 
  }

  void draw(){
  pushMatrix();
  translate(xc, yc);
  rotate(theta);
  target = getMatrix(target);
  popMatrix();
  
  for (int i=0; i<v; i++){
    x2[i] = (int)(target.multX(x[i],y[i]));
    y2[i] = (int)(target.multY(x[i],y[i]));
  }
  a = new Polygon(x2,y2,v);
  bounds = a.getBounds();
  fill(c);
  beginShape();
  for(int i=0; i<v; i++)
    vertex(x2[i],y2[i]);
  endShape(CLOSE);
  fill(c2,100);
  rect(bounds.x, bounds.y, bounds.width, bounds.height);
}

void detectCollision(){
if (pp1.bounds.intersects(pp2.bounds)){
  for (int i=0; i<pp2.v; i++)
    if (pp1.a.contains(pp2.x2[i],pp2.y2[i]))
      pp1.c = pp2.c = random();

  for (int i=0; i<pp1.v; i++)
    if (pp2.a.contains(pp1.x2[i],pp1.y2[i]))
      pp1.c = pp2.c = random();
  c2 = color(127,100);
}
else
  c2 = color(127,0);
}
}
void mouseClicked(){
  setup();
}

color random(){
  return color((int)random(255),(int)random(255),(int)random(255));
}


