


/* @pjs preload="clock.png"; */
/* @pjs font="LiberationSerif-Bold.ttf"; */

import fisica.*;
import geomerative.*;
import rita.*;
import org.apache.batik.svggen.font.table.*;
import org.apache.batik.svggen.font.*;


//RiText rt1 = new RiText(this, "Beep");
PImage ck;
FWorld world;
float posX = 0;
RFont font;
int count =0;
//String[] urls = getImgurPhotos("sleep");
FChar chr;



class FChar extends FPoly {
  RShape m_shape;
  RShape m_poly;
  boolean m_bodyCreated;

  FChar(char chr) {
    super();

    float x = random(200, 300);
    float y = random(200, 350);


    String txt = "Beep";
    // txt += chr;

    RG.textFont(font, (int)random(30, 70));
    m_shape = RG.getText(txt);
    m_poly = RG.polygonize(m_shape);

    if (m_poly.countChildren() < 1) {

      return;
    }
    m_poly = m_poly.children[0];    

    // Find the longest contour of our letter
    float maxLength = 0.0;
    int maxIndex = -1;
    for (int i = 0; i < m_poly.countPaths(); i++) {
      float currentLength = m_poly.paths[i].getCurveLength();
      if (currentLength > maxLength) {
        maxLength = currentLength;
        maxIndex = i;
      }
    }

    if (maxIndex == -1) return;

    RPoint[] points = m_poly.paths[maxIndex].getPoints();

    for (int i=0; i<points.length; i++) {
      this.vertex(points[i].x, points[i].y);
    }

    this.setFill(0);
    this.setStroke(0);
    this.setStrokeWeight(0);

    this.setDamping(0);
    this.setRestitution(0.5);
    this.setBullet(true);
    this.setPosition(x, y);

    //this.setPosition(posX+10, height/5);

    posX = (posX + m_poly.getWidth()) % (width-100);

    m_bodyCreated = true;
  }

  boolean bodyCreated() {
    return m_bodyCreated;
  }

  void draw(PGraphics applet) {

    preDraw(applet);
    m_shape.draw(applet);
    postDraw(applet);
  }
}


void setup() {

  size(600, 600);
  smooth();

  
  Fisica.init(this);
  Fisica.setScale(4);
  RG.init(this);

  RG.setPolygonizer(RG.ADAPTATIVE);

  world = new FWorld();
  world.setGravity(0, 200);
  world.setEdges(this, color(255));
  world.remove(world.top);

  font = RG.loadFont("LiberationSerif-Bold.ttf");




//img
  ck = loadImage("clock.png");
frameRate(60);

}

void draw() {
  

  background(190);
 
 
  image(ck, 150, 30);

tr();


  world.draw(this);
  world.step();
}




void tr() {  
  println(frameCount);

  //float z = 0;
  if (frameCount == count+43) {
    // z = random(0, 9);
    count = frameCount;
     chr = new FChar(key);
    if (chr.bodyCreated()) {
      world.add(chr);

    }
  }
}



