
/**
  * Nils Seifert & Michael Muehlhaus
  *
  * www.muehlseife.de
  *
  * you can select & move the Vectors and Polygons
  * for drawing a new polygon, hold 'n'
**/

ArrayList<Polygon> polygons;
ArrayList<Object> selected;

Polygon newPolygon;
boolean beginNewPolygon = false;
boolean redraw = true;

int[] colors = {color(0, 0, 255), color(255, 0, 255), color(255, 0, 0), color(255, 255, 0), color(0, 255, 0)};

ArrayList<Agent> a;
float minutesPerFrame = 1f;

int intermediate = 1;
            
void setup() {
  size(800, 600, JAVA2D); smooth();
   
  polygons = new ArrayList<Polygon>();
  selected = new ArrayList<Object>();
   
  polygons.add(new Polygon(new Vector(0, 0),
                           new Vector(0, height),
                           new Vector(width, height),
                           new Vector(width, 0)));
  polygons.get(0).visible = false;
  polygons.get(0).selectable = false;
  polygons.get(0).closed = true;
  
  polygons.add(new Polygon(new Vector(160, 0),
                           new Vector(160, 220),
                           new Vector(320, 380)));
   
  polygons.add(new Polygon(new Vector(460, 600),
                           new Vector(460, 450),
                           new Vector(640, 450),
                           new Vector(640, 320)));
                           
  a = new ArrayList<Agent>();
  for (int i = 0; i < 600; i++) a.add(new Agent());                    
}

void draw() {
  //background(60, 80, 120);
  if (!keyPressed || (keyPressed && key != 'n')) {
    if (beginNewPolygon = true) {
      if (newPolygon != null) if (newPolygon.vertices.size() > 2) {polygons.add(newPolygon);}
    }
    beginNewPolygon = false; newPolygon = null;
  } else redraw = true;
  if (redraw) {
    background(255);
    //for (Polygon poly : polygons) {poly.display();}
    redraw = false;
    
    a = new ArrayList<Agent>();
    for (int i = 0; i < 600; i++) a.add(new Agent());
  }
  for (Polygon poly : polygons) {poly.display();}
  textAlign(LEFT, TOP);
  if (beginNewPolygon) {
    //fill(0); text("draw polygon by clicking left mouse button", 4, 4);
    
    if (newPolygon != null) if (newPolygon.vertices.size() > 0) {
      strokeWeight(1.5);
      noFill(); stroke(0, 125);
      beginShape();
      for (Vector vec : newPolygon.vertices) vertex(vec.x, vec.y);
      vertex(mouseX, mouseY);
      //vertex(newPolygon.vertices.get(0).x, newPolygon.vertices.get(0).y);
      endShape();
    }
  } //else {fill(0); text("hold 'n' for drawing new polygon", 4, 4);}
  
  for (int i = 0; i < intermediate; i++) for (Agent aa : a) aa.update();
  
  for (Agent aa : a) aa.display();
}


