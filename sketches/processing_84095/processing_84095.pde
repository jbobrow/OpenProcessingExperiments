
import toxi.geom.*;
import toxi.processing.*;

ArrayList <Polygon2D> polygons = new ArrayList <Polygon2D> ();
ArrayList <Vec2D> points = new ArrayList <Vec2D> ();
int draggedPolygon = -1;
ToxiclibsSupport gfx;
boolean onPolygon;
Vec2D mouse;

void setup() {
  size(1280,720);
  gfx = new ToxiclibsSupport(this);
  noStroke();
  smooth();
}

void draw() {
  background(255);
  mouse = new Vec2D(mouseX,mouseY);

  // (re)set onPolygon to false
  onPolygon = false;

  // draw all the polygons
  for (Polygon2D p : polygons) {
    if (p.containsPoint(mouse)) {
      // if the mouse is over a polygon...
      // set onPolygon to true and color it red
      onPolygon = true;
      fill(255,0,0);
    } else {
      fill(0);
    }
    gfx.polygon2D(p);
  }

  // draw all the points
  fill(0);
  for (Vec2D p : points) {
    ellipse(p.x,p.y,5,5);
  }
}

void mousePressed() {
  // if the mouse is NOT on a polygon
  if (!onPolygon) {
    // add a point at mouseX,mouseY
    points.add(mouse);
    // if the right mouse button is pressed
    // and there are more than 2 points
    if (mouseButton == RIGHT && points.size() > 2) {
      // create a polygon from the points
      polygons.add(new Polygon2D(points));
      // clear the points
      points.clear();
    }
  }
}

void mouseDragged() {
  // if no polygon is selected
  if (draggedPolygon == -1) {
    // check if the mouse is on a polygon
    for (int i=0; i<polygons.size(); i++) {
      if (polygons.get(i).containsPoint(mouse)) {
        // if so, set this to be the selected polygon
        draggedPolygon = i;
      }
    }
  // if a polygon is selected
  } else {
    // set change amount to the movement of the mouse
    Vec2D change = new Vec2D(mouseX-pmouseX,mouseY-pmouseY);
    // get the selected polygon
    Polygon2D p = polygons.get(draggedPolygon);
    // add the change to all of it's individual points
    for (Vec2D v : p.vertices) {
      v.addSelf(change);
    }
  }
}

void mouseReleased() {
  // on mouse release reset to 'no polygon selected'
  draggedPolygon = -1;
}

void keyPressed() {
  // clear all points and polygons
  if (key == ' ' && !mousePressed) {
    points.clear();
    polygons.clear();
  }
  // delete the polygon under the mouse
  if (key == 'd' && !mousePressed) {
    for (int i=polygons.size()-1; i>=0; i--) {
      if (polygons.get(i).containsPoint(mouse)) {
        polygons.remove(i);
      }
    }
  }
  // remove the last point (if points > 0)
  if (key == 'x') {
    if (points.size() > 0) {
      points.remove(points.size()-1);
    }
  }
}
