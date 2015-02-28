
import toxi.math.noise.*;
import toxi.math.waves.*;
import toxi.geom.*;
import toxi.math.*;
import toxi.math.conversion.*;
import toxi.geom.util.*;

import processing.opengl.*;

Vec2D[] pointList;
int pointNb;
PFont font;
color[] colList = { color(255,0,0), color(0,0,255), color(255,0,255), color(0,255,0) };

void setup() {
  size(600,600,P3D);
  smooth();
  pointList = new Vec2D[4];
  for (int i = 0; i < 4; i++) {
    int _i = 1;
    if (i == 1 || i == 2) _i = 0;
    pointList[i] = new Vec2D((floor(i * 0.5) * 300)+150, (_i * 300)+150);
    println(pointList[i].toString());
  }
  pointNb = 4;
  font = createFont("Arial Bold", 12);
}

void draw() {
  background(255);
  Vec2D _mouse = new Vec2D(mouseX, mouseY);
  if (mousePressed && pointNb == 4) {
    float _lastTarget = 600;
    for (int i = 0; i < 4; i++) {
      float _targ = min(_lastTarget, _mouse.distanceTo(pointList[i]));
      if (_targ != _lastTarget) {
        pointNb = i;
        _lastTarget = _targ;
      }
    }
  } else if (!mousePressed) {
    pointNb = 4;
  }
  if (pointNb < 4) {
    pointList[pointNb].set(_mouse);
  }
  Vec2D _v1 = pointList[0].sub(pointList[1]);
  Vec2D _v2 = pointList[2].sub(pointList[1]);
  Vec2D _v3 = pointList[3].sub(pointList[2]);
  float _angle = degrees(_v1.angleBetween(_v2, true));
  float _newAngle = (180 - _angle) * 0.5;
  Vec2D _cp1 = _v1.getRotated(radians(_newAngle));
  _cp1.addSelf(_v1);
  float _l = pointList[2].sub(pointList[1]).magnitude();
  float _s = _l / _cp1.sub(pointList[1]).magnitude();
  _cp1 = pointList[1].interpolateTo(_cp1, _s * -0.5);
  _l = _v1.magnitude();
  _s = _l / _v2.magnitude();
  Vec2D _cp2 = _cp1.sub(pointList[1]).getInverted().scale(_s).add(pointList[1]);

  float _angle2 = degrees(_v2.angleBetween(_v3, true));
  float _newAngle2 = (180 - _angle2) * 0.5;
  Vec2D _cp3 = _v2.getRotated(radians(_newAngle2));
  _cp3.addSelf(_v2);
  _l = pointList[3].sub(pointList[2]).magnitude();
  _s = _l / _cp3.sub(pointList[2]).magnitude();
  _cp3 = pointList[2].interpolateTo(_cp3, _s * -0.5);
  _l = _v2.magnitude();
  _s = _l / _v3.magnitude();
  Vec2D _cp4 = _cp3.sub(pointList[2]).getInverted().scale(_s).add(pointList[2]);

  textFont(font);
  fill(0);
  for (int i = 0; i < 3; i++) {
    stroke(0);
    strokeWeight(1);
    text("p" + (i+1), pointList[i].x + 5, pointList[i].y + 5);
    line(pointList[i].x, pointList[i].y, pointList[i+1].x, pointList[i+1].y);
    Vec2D _v = pointList[i+1].sub(pointList[i]).scale(0.5).add(pointList[i]);
    text("v" + (i+1), _v.x + 5, _v.y + 5);
    stroke(colList[i]);
    strokeWeight(5);
    point(pointList[i].x, pointList[i].y);
  }
  stroke(colList[3]);
  point(pointList[3].x, pointList[3].y);
  text("p4", pointList[3].x + 5, pointList[3].y + 5);

  stroke(150,150,150);
  strokeWeight(2);
  text("a = " + round(_angle) + " deg", pointList[1].x + 5, pointList[1].y + 20);
  line(pointList[1].x, pointList[1].y, _cp1.x, _cp1.y);
  line(pointList[1].x, pointList[1].y, _cp2.x, _cp2.y);
  text("cp1", _cp1.x + 5, _cp1.y + 5);
  text("cpa = " + round(_newAngle) + " deg", _cp1.x + 5, _cp1.y + 20);
  strokeWeight(5);
  stroke(150,150,150);
  point(_cp1.x, _cp1.y);

  stroke(150,150,150);
  strokeWeight(2);
  text("a2 = " + round(_angle2) + " deg", pointList[2].x + 5, pointList[2].y + 20);
  line(pointList[2].x, pointList[2].y, _cp3.x, _cp3.y);
  line(pointList[2].x, pointList[2].y, _cp4.x, _cp4.y);
  text("cp2", _cp3.x + 5, _cp3.y + 5);
  text("cp2a = " + round(_newAngle2) + " deg", _cp3.x + 5, _cp3.y + 20);
  strokeWeight(5);
  stroke(150,150,150);
  point(_cp3.x, _cp3.y);
}


