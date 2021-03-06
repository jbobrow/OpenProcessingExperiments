
import processing.core.PApplet;
import java.util.ArrayList;

//FKBox derived from the original FKBox class by David Bollinger

public class FKBox {
  private final PApplet processing;

  float pivotx, pivoty;
  float x1, y1, x2, y2, w, h;
  float rot, drot, moment;
  int c;
  FKBox parent;
  ArrayList children;
  int nchildren;

  FKBox(PApplet processing, float x1, float y1, float x2, float y2, float rot, int c) {
    this.processing = processing;

    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
    this.w = java.lang.Math.abs(x2-x1);
    this.h = java.lang.Math.abs(y2-y1);
    this.rot = rot;
    this.drot = 0f;
    this.c = c;
    this.parent = null;
    this.children = new ArrayList();
    this.nchildren = 0;
  }

  void attach(FKBox child, float x, float y) {
    child.parent = this;
    child.pivotx = x;
    child.pivoty = y;
    child.calc();
    children.add(child);
    nchildren++;
  }

  void calc() {
    float dx1 = java.lang.Math.abs(x1 - pivotx); 
    float dx2 = java.lang.Math.abs(x2 - pivotx); 
    float dx = java.lang.Math.max(dx1,dx2);
    float dy1 = java.lang.Math.abs(y1 - pivoty); 
    float dy2 = java.lang.Math.abs(y2 - pivoty); 
    float dy = java.lang.Math.max(dy1,dy2);
    moment = PApplet.sqrt(java.lang.Math.max(dx,dy));
  }

  void impulse(float force, float decay) {
    drot += force;
    for (int i=0; i<nchildren; i++) {
      FKBox child = (FKBox)children.get(i);
      child.impulse(drot*decay*child.moment, decay);
    }
  }

  void move(float friction) {
    drot *= friction;
    for (int i=0; i<nchildren; i++) {
      FKBox child = (FKBox)children.get(i);
      child.move(friction);
    }
  }

  void boxAsRectCORNER(float x1, float y1, float x2, float y2) {
    processing.pushMatrix();

    float w = java.lang.Math.abs(x2 - x1);
    float h = java.lang.Math.abs(y2 - y1);

    processing.translate(java.lang.Math.min(x1, x2) + w/2, java.lang.Math.min(y1, y2) + h/2, 0);
    processing.box(w, h, 50);

    processing.popMatrix();

  }  

  void draw() {
    processing.pushMatrix();
    processing.translate(pivotx, pivoty, 0);
    processing.rotate(rot+drot);
    processing.fill(c, 177);

    boxAsRectCORNER(x1,y1,x2,y2);

    for (int i=0; i<nchildren; i++) {
      FKBox child = (FKBox)children.get(i);
      child.draw();
    }
    processing.popMatrix();
  }

}



