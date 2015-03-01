
// R.A. Robertson 2014.08 "Mesh 2D Freehand Tool" ~ www.rariora.org ~
// License: Creative Commons :: Attribution, Share Alike

int switchIndex;
float startX, startY, endX, endY;
ArrayList<Site> siteList;
boolean mouseUp;
boolean close = true;
boolean toggleFill = true;
String mode;

void setup() {
  size(960, 400); 
  background(255);
  stroke(0);
  strokeWeight(2);
  siteList = new ArrayList<Site>(); 
}

void draw() {
  if (mouseUp) {
    siteList.add(new Site(mouseX, mouseY)); 
    println(siteList.size()); 
    switch(switchIndex) {
      default: beginShape(); break;
      case '1': beginShape(); break;
      case '2': beginShape(POINTS); break;
      case '3': beginShape(LINES); break;
      case '4': beginShape(TRIANGLES); break;
      case '5': beginShape(TRIANGLE_STRIP); break;
      case '6': beginShape(TRIANGLE_FAN); break;
      case '7': beginShape(QUADS); break;
      case '8': beginShape(QUAD_STRIP); break;  
    }  
    for (int i = 0; i < siteList.size(); i++ ) {
      vertex(siteList.get(i).x, siteList.get(i).y);
    }
    if (toggleFill) { fill(200, 0, 0); } else { noFill(); }
    // Note that noFill() makes CLOSE modes more apparent.
    mouseUp = false;
  }
}

/* ======== UI ======== */

void mouseReleased() {
  if (mouseButton == LEFT) {
    point(mouseX, mouseY);
    mouseUp = true;
  }
  if (mouseButton == RIGHT) {
    if (close) { endShape(CLOSE); } else { endShape(); }
    siteList = new ArrayList<Site>();
  }
}

void keyPressed() {
   if (key >= '1' && key <= '8') switchIndex = key;
   if (key == 'c' || key == 'C') close = !close;
   if (key == ' ') setup();
   if (key == 'b' || key == 'B') siteList = new ArrayList<Site>();
   if (key == 'f' || key == 'F') toggleFill = !toggleFill;
   
   switch(switchIndex) {
      default: mode = "DEFAULT"; break;
     case '1': mode = "DEFAULT"; break;
     case '2': mode = "POINTS"; break;
     case '3': mode = "LINES"; break;
     case '4': mode = "TRIANGLES"; break;
     case '5': mode = "TRIANGLE_STRIP"; break;
     case '6': mode = "TRIANGLE_FAN"; break;
     case '7': mode = "QUADS"; break;
     case '8': mode = "QUAD_STRIP"; break;   
   }
  println(mode + "  CLOSE = " + close + "  Vertices = " + siteList.size());
}

/* ======== Class ======== */

class Site {
  int x, y;
  Site(int x, int y) {
    this.x = x;
    this.y = y;
  }
}
