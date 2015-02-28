
//how many levels deep to draw mountain:
int iterations = 8;

//snowcaps starts this % above base of mountain
float snowLevel = .82; 

PFont font;

void setup() {
  size(800,400);
  smooth();
  noStroke();
  fill(0);
  noLoop();
  font = loadFont("Dialog.bold-16.vlw");
  textFont(font,16);
}

void draw() {
  background(0);
  
  //this mountain range will have 3 mountains, each with a different 
  //base location and relative distance from viewer, which affects darkness 
  //of fill colors chosen -- farther away = darker triangles
  drawMountain(width/2,.9*height,.7, 3); //in back
  drawMountain(.75*width,.9*height,.8, 2);  //in middle
  drawMountain(.2*width,.9*height,.8, 1); //in front
  
  fill(255);
  textAlign(CENTER);
  text("Click the mouse to redraw at current number of iterations.  Press 1-8 to modify iterations.", width/2, height - 15);
  fill(255,0,0);
  textAlign(RIGHT);
  text("# iterations:  " + iterations, width - 10, 30);
}

void mouseClicked() {
  redraw();
}

void keyPressed() {
  if ( ! Character.isDigit(key)) return;
  int a = Integer.parseInt(""+key);
  if ( a > 0 && a < 9 ) {
    iterations = a;
    redraw();
  }
}


// (x,y) specifies center of this mountain's base
// w specifies % width of window to use
// depth specifies depth of this mountain describing how far back this mountain is
// compared to others for shading purposes; valid values are { 0, 1, 2, 3 }
void drawMountain(float x, float y, float w, int depth) {
  float top = height-y+random(.2*y);
  float localSnowLevel = .9*snowLevel + random(.2*snowLevel);
  int snowHeight = int(top + (1-localSnowLevel)*(y-top));
  println("top = " + top + ", snowHeight = " + snowHeight);
  PVector a = new PVector(x-w*.5*width,y);
  PVector b = new PVector(x -.2*w*width + random(.4*w*width), top);
  PVector c = new PVector(x+w*.5*width,y);
  Triangle tri = new Triangle(a, b, c, depth);
  drawMountainHelper(tri, depth, snowHeight, iterations);
}

void drawMountainHelper(Triangle t, int depth, int snowHeight, int level) {
  if ( level == 0 ) {
    //t.render();
    return;
  }

  PVector randAB = getRandPtBtwn(t.a, t.b);
  PVector randBC = getRandPtBtwn(t.b, t.c);
  PVector randCA = getRandPtBtwn(t.c, t.a);

  Triangle[] triangles = new Triangle[4];
  triangles[0] = new Triangle(randAB, randBC, randCA, depth);
  triangles[1] = new Triangle(t.a, randAB, randCA, depth);
  triangles[2] = new Triangle(t.b, randAB, randBC, depth);
  triangles[3] = new Triangle(t.c, randCA, randBC, depth);
        
  for( Triangle curTri : triangles ) {
    if ( (curTri.getMinY() + curTri.getAvgY())/2.0 > snowHeight ) {
      curTri.render();
    } else { 
      curTri.renderSnow();
    }
    drawMountainHelper(curTri, depth, snowHeight, level-1);
  }

}

PVector getRandPtBtwn(PVector c, PVector d) {
  /*
  //for early testing purposes
    return new PVector( (c.x+d.x)/2, (c.y+d.y)/2);
  }
  */

  //return a point somewhere between c & d, but not necessarily on
  //the segment with endpts c & d
  float deltaX = abs(d.x-c.x);
  float deltaY = abs(d.y-c.y);
  float randX = .5*(c.x + d.x) - .13*deltaX + random(0,.26*deltaX);
  float randY = .5*(c.y + d.y) - .13*deltaY + random(0,.26*deltaY);
  return new PVector( int(randX), int(randY));
} 

public class Triangle {
  PVector a, b, c;
  int depth;

  public Triangle(PVector p, PVector q, PVector r, int d) {
    a = p; 
    b = q; 
    c = r;
    depth = d;
  }
  
  int getAvgY() {
    //return average of vertices' y values
    return (int)((a.y+b.y+c.y)/3.0);
  }
  
  int getMinY() {
    if ( a.y < b.y && a.y < c.y ) return int(a.y);
    if ( b.y < c.y ) return int(b.y);
    return int(c.y);
  }

  void render() {
    fill(random(70 - depth*20, 160 - depth*30));
    triangle(a.x, a.y, b.x, b.y, c.x, c.y);
  }
  
  void renderSnow() {
    fill(random(240 - depth*30, 255));
    triangle(a.x, a.y, b.x, b.y, c.x, c.y);
  }
}


