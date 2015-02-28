
//Spline2D

import toxi.geom.*;
import toxi.processing.*;
ToxiclibsSupport gfx;
boolean switcher = true;

import controlP5.*;
ControlP5 cp5;
int myColorBackground = color(0, 0, 0);
public int len = 40;  //maximum length of sides
public int polnum = 20; //number of sides
public float theta1 = 30;
public float theta2 = 30;

PFont font;


void setup() {
  background(200);
  size(600, 600);
  gfx = new ToxiclibsSupport(this);
  noFill();
  
  font = loadFont("HelveticaNeue-UltraLight-20.vlw");
  textFont(font, 15);
  
  //Contoroler
  cp5 = new ControlP5(this);

  cp5.addSlider("len")
    .setRange(0, 150)
    .setPosition(40, 60)
    .setSize(150, 15)
  ;
  
  cp5.addSlider("polnum")
    .setRange(3, 9)
    .setPosition(40, 80)
    .setSize(150, 15)
  ;
    
  cp5.addSlider("theta1")
    .setRange(0, 90)
    .setPosition(40, 100)
    .setSize(150, 15)
  ;
  cp5.addSlider("theta2")
    .setRange(0, 360)
    .setPosition(40, 120)
    .setSize(150, 15)
  ;
    
}

void draw() {
  background(220);
  stroke(0,0,0);
  Vec2D o = new Vec2D(width/2, height/2);
  Vec2D[] v = new Vec2D[polnum];  //make vec2d array of polnum
  Vec2D vs = new Vec2D(len,0);  //make first vector
  v[0] = o.add(vs.sub(o).limit(len));
  v[1] = v[0].add(v[0].sub(o).limit(len).getRotated(radians(theta1)));
  
  //add splines
  Spline2D s=new Spline2D();
  s.add(o);
  s.add(v[0]);
  s.add(v[1]);
  for (int i = 2; i<v.length; i++){
    v[i] = v[i-1].add(v[i-1].sub(v[i-2]).limit(len).getRotated(radians(theta1)));
    s.add(v[i]);
  }
  
  //draw lines
  beginShape();
  for(Iterator i=s.pointList.iterator(); i.hasNext();) {
    Vec2D vc=(Vec2D)i.next();
    vertex(vc.x, vc.y);
  }
  endShape();

  ellipse(o.x, o.y, 4, 4);
  fill(0);
  ellipse(v[polnum-1].x, v[polnum-1].y, 4, 4);
  noFill();
  
  //caliculate max length between two points
  float[] pointDistance = new float[polnum];
  for (int i = 0; i<polnum; i++){
    pointDistance[i] = o.distanceTo(v[i]);
  }
  String maxdistance = "max distance : " + String.valueOf( max(pointDistance) );
  fill(0);
  text(maxdistance, 40,160);
  noFill();
}

