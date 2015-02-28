


/*

 Shows different types of Camera Behaviour.
 
 with 0,1,2 und 3 change Camera Behaviour 
 0 - Camera rotates staying the same height
 1 - Camera rotates und goes up and down (Spirale)
 2 - Camera reacts on Mouse-Movement
 3 - Camera flies on a Path  
 
 Cursor:  
 Cursor right / left: Radius +/- (Minimum -2) (works in most cases)
 Cursor up / down: Height (only with Camera Behaviour = 0)
 
 The Motive:
 A hanging basket is a suspended container used for growing decorative plants.
 It is hanging on a Lamppost. 
 */

import shapes3d.utils.*;
import shapes3d.org.apache.commons.math.util.*;
import shapes3d.org.apache.commons.math.*;
import shapes3d.org.apache.commons.math.geometry.*;
import shapes3d.*;

// =========================================================================

// Variablen: Zentrale Änderung von Values, 
// die mehrfach auftauchen, hier vornehmen! 
// Wenn man die Stange dann höher positioniert, 
// wandern alle Blumenkästen auch höher. 

// Lamppost 
int ZentraleStange_XValue = 250; // nach rechts
int ZentraleStange_YValue = 330; // nach unten 
int ZentraleStange_ZValue = -150; // nach hinten 

// Lamppost
int TiefeQuerbalken = 122;

// hanging basket 
int HoeheEinesBlumenkastens = 20; 
int TiefeEinesBlumenkastens = 122; 
int BreiteEinesBlumenkastens = 50; 

//  hanging basket 
Cone cone;
Ellipsoid [] ellipsoid = new Ellipsoid [4];

String actualTextMessage = "Use 0,1,2,3 for Camera"; 
String actualTextMessage2 = "Camera circles at constant height";

// ==================================================================

void setup() {
  size(600, 600, P3D);
  // Grass
  initGrass();

  // LookAt
  LookAtX=ZentraleStange_XValue;
  LookAtY= ZentraleStange_YValue;
  LookAtZ= ZentraleStange_ZValue;

  // hanging baskets 
  for (int i = 0; i < ellipsoid.length; i = i+1) {
    ellipsoid[i] = new Ellipsoid(this, 40, 40);
    ellipsoid[i].drawMode(Shape3D.SOLID);
    ellipsoid[i].setRadius(12, 7, 12);
    ellipsoid[i].moveTo(ZentraleStange_XValue, ZentraleStange_YValue+40, ZentraleStange_ZValue-(TiefeQuerbalken/2)+5);
  }
  ellipsoid[0].moveTo(ZentraleStange_XValue, ZentraleStange_YValue+40, ZentraleStange_ZValue-(TiefeQuerbalken/2)-1);  
  ellipsoid[1].moveTo(ZentraleStange_XValue, ZentraleStange_YValue+40, ZentraleStange_ZValue+(TiefeQuerbalken/2)-1);  
  ellipsoid[2].moveTo(ZentraleStange_XValue-(TiefeQuerbalken/2)+0, ZentraleStange_YValue+40, ZentraleStange_ZValue);    
  ellipsoid[3].moveTo(ZentraleStange_XValue+(TiefeQuerbalken/2)+0, ZentraleStange_YValue+40, ZentraleStange_ZValue);
} // function 

void draw() {
  background(153);
  textMode(SCREEN);
  fill(242);  
  text(actualTextMessage + " (now: " + actualTextMessage2 + ").", 10, 30); 
  CheckCamera(); 
  Grass();
  stroke(22);
  PaintLamppost(); 
  Angle=Angle+1.0;
  if (boolGoesOnAPath) { 
    PathValue=PathValue+1;
  }
  PaintHangingBasket();
}

// =====================================================================

void PaintHangingBasket () {

  // Schleife! 
  for (int i = 0; i < ellipsoid.length; i = i+1) {

    stroke(22);
    // Blumenkasten 
    ellipsoid[i].fill(color(72, 66, 44));
    ellipsoid[i].draw();

    stroke(22);
    // je zwei Drähte
    line (ellipsoid[i].x()-10, ellipsoid[i].y(), ellipsoid[i].z(), 
    ellipsoid[i].x(), ellipsoid[i].y()-43, ellipsoid[i].z()); 
    line (ellipsoid[i].x()+10, ellipsoid[i].y(), ellipsoid[i].z(), 
    ellipsoid[i].x(), ellipsoid[i].y()-43, ellipsoid[i].z()); 

    // je drei Blumen 
    pushMatrix();
    translate (ellipsoid[i].x(), ellipsoid[i].y()-17, ellipsoid[i].z());
    scale(.2);
    rotateY(.7);
    Flower(1, 1, +200, 17, 3); 
    popMatrix();

    pushMatrix();
    translate (ellipsoid[i].x()-2, ellipsoid[i].y()-17, ellipsoid[i].z()-2);
    scale(.25);
    rotateY(2*PI-.2);    
    Flower(1, 1, ellipsoid[i].x()-22, ellipsoid[i].y()+117, ellipsoid[i].z()-21); 
    popMatrix();

    pushMatrix();
    translate (ellipsoid[i].x()+2.2, ellipsoid[i].y()-17, ellipsoid[i].z()-2.3);
    rotateY(1.32);    
    scale(.23);
    Flower(1, 1, +2, 7, 221); 
    popMatrix();
  } // for
} // SR 

// =====================================================================

void PaintLamppost () {

  // http://en.wikipedia.org/wiki/Street_light
  // central lamppost
  pushMatrix(); 
  int Hoehe = 220;
  fill(190, 3, 3);
  translate(ZentraleStange_XValue-0, 
  ZentraleStange_YValue+(Hoehe / 2), 
  ZentraleStange_ZValue-0); 
  rotateY(0.0);
  box(11, Hoehe, 11); 
  popMatrix();

  // Querbalken 1
  pushMatrix(); 
  fill(9, 3, 233);
  translate(ZentraleStange_XValue, 
  ZentraleStange_YValue, 
  ZentraleStange_ZValue); 
  rotateY(0.0);
  box(11, 11, TiefeQuerbalken); 
  popMatrix();

  // Querbalken 2
  pushMatrix(); 
  fill(9, 9, 223);
  translate(ZentraleStange_XValue, 
  ZentraleStange_YValue, 
  ZentraleStange_ZValue-0); 
  rotateY(radians(90.0));
  box(11, 11, TiefeQuerbalken); 
  popMatrix();
}


