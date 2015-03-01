
float radius = 100; // radius of circle circumscribing polygon
int vertexNr = 6;
boolean showGrid = true;
boolean showPoints = true;
int items = 8; //menu items
Draggables draggables;
PVector[] vertices;
PVector[] translations;
color[] colors;

void setup() {
  size(700, 600);// height divisible by 8 = menu items
  ellipseMode(RADIUS);
  textAlign(CENTER, CENTER);
  vertices = makeVertices();
  translations = makeTranslationVectors();
  draggables = newDraggables();
  colorMode(HSB, 360, 100, 100, 100);
  colors = new color[3];
  colors[0] = color(49, 80, 80, 80);
  colors[1] = color(349, 80, 80, 80);
  colors[2] = color(239, 80, 80, 80);
}

void draw() {
  background(colors[0]);
  vertices = makeVertices();
  translations = makeTranslationVectors();
  drawTiling(false);
  if (showGrid) {
    drawTiling(true);
  }
  showMenu();
  draggables.update();
  if (showPoints) {
    fill(0, 0, 90);
    noStroke();
    draggables.redraw();
  }
}

void mouseReleased() {
  draggables.release();
}

PVector[] makeVertices() {
  PVector[] vertices = new PVector[vertexNr];
  PVector mid = new PVector(height/2, height/2);
  for (int i = 0; i< vertices.length; i++) {
    vertices[i] = new PVector(mid.x+radius*cos(i*2*PI/vertices.length + PI/vertices.length), 
    mid.y+radius*sin(i*2*PI/vertices.length + PI/vertices.length));
  }
  return vertices;
}

PVector[] makeTranslationVectors() {
  PVector[] translations = new PVector[2]; 
  if (vertices.length == 6) {
    translations[0] = new PVector(vertices[2].x-vertices[0].x + vertices[1].x-vertices[0].x, vertices[4].y-vertices[0].y);
    translations[1] = new PVector(0, vertices[4].y-vertices[1].y + vertices[5].y-vertices[0].y);
  } else {
    translations[0] = new PVector(vertices[1].x-vertices[0].x, vertices[1].y-vertices[0].y);
    translations[1] = new PVector(vertices[2].x-vertices[1].x, vertices[2].y-vertices[1].y);
  }
  return translations;
}

Draggables newDraggables() {
  PVector[] points;
  if (vertexNr == 3) {  //place them on different sides depending on vertexNr
    points = new PVector[9];
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j <3; j++) {
        points[i*3+j] = new PVector(vertices[i].x+(j+1)*(vertices[(i+1)%3].x-vertices[i].x)/4, 
        vertices[i].y+(j+1)*(vertices[(i+1)%3].y-vertices[i].y)/4);
      }
    }
  } else if (vertexNr == 4) {
    points = new PVector[floor(vertexNr/2)*3];
    for (int i = 0; i < floor (vertexNr/2); i++) {
      for (int j = 0; j <3; j++) {
        points[i*3+j] = new PVector(vertices[i].x+(j+1)*(vertices[i+1].x-vertices[i].x)/4, 
        vertices[i].y+(j+1)*(vertices[i+1].y-vertices[i].y)/4);
      }
    }
  } else { //vertexNr = 6
    points = new PVector[floor(vertexNr/2)*3];
    for (int i = 0; i < floor (vertexNr/2); i++) {
      for (int j = 0; j <3; j++) {
        points[i*3+j] = new PVector(vertices[i*2].x+(j+1)*(vertices[i*2+1].x-vertices[i*2].x)/4, 
        vertices[i*2].y+(j+1)*(vertices[i*2+1].y-vertices[i*2].y)/4);
      }
    }
  }
  return new Draggables(points, 4, height, height);
}

void zoom(boolean zoomIn) {
  radius = (zoomIn ?  radius*1.01 : radius*0.99);
  PVector mid = new PVector(height/2, height/2);
  for (int i = 0; i<draggables.size (); i++) {
    float r, arg;
    r = sqrt((draggables.getX(i)-mid.x)*(draggables.getX(i)-mid.x)+(draggables.getY(i)-mid.y)*(draggables.getY(i)-mid.y));
    arg = atan2(draggables.getY(i)-mid.y, draggables.getX(i)-mid.x);
    r = (zoomIn ?  r*1.01 : r*0.99);
    draggables.setX(mid.x+r*cos(arg), i);
    draggables.setY(mid.y+r*sin(arg), i);
  }
}

void drawTiling(boolean grid) {
  int xRun = floor(height/(2.0*abs(translations[0].x)))+3; //floor needed for Javascript version
  int yRun = floor(height/(2.0*abs(translations[1].y)))+3; //approximately what's needed to cover the window with non-rectangular tilings
  PVector[][] piece;
  if (vertexNr == 3) {
    piece = makeTriangle();
  } else if (vertexNr == 4) {
    piece = makeSquare();
  } else {
    piece = makeHexagon();
  }
  for (int i = - xRun; i <= xRun; i++) { 
    for (int j = - yRun; j <= yRun; j++) {
      if (grid) {
        stroke(0, 0, 90, 30);
        strokeWeight(1);
        noFill();
        drawPolygon(i*translations[0].x + j*translations[1].x, i*translations[0].y + j*translations[1].y);
      } else {
        noStroke();
        if (vertexNr < 6) {
          fill(colors[1]);
          if ((i+j)%2==0) {
            drawPiece(piece, i*translations[0].x + j*translations[1].x, i*translations[0].y + j*translations[1].y);
          } else if (vertexNr == 3) {
            drawPiece(piece, i*translations[0].x + j*translations[1].x, i*translations[0].y + j*translations[1].y);
          } 
        } else {
          fill(colors[1]);
          drawPiece(piece, i*translations[0].x + j*translations[1].x, i*translations[0].y + j*translations[1].y);
          float ang = -2*PI/3;
          PVector[][] pRot = new PVector[vertexNr][4];
          for (int m = 0; m < pRot.length; m++) {
            for (int n = 0; n < pRot[m].length; n++) {
              pRot[m][n] = rotatePoint(piece[m][n], ang, vertices[1]);
            }
          }
          fill(colors[2]);
          drawPiece(pRot, i*translations[0].x + j*translations[1].x, i*translations[0].y + j*translations[1].y);
        }
      }
    }
  }
}

void drawPolygon(float dx, float dy) {
  for (int k = 0; k< vertices.length; k++) {
    line(  vertices[k].x + dx, vertices[k].y + dy, 
    vertices[(k+1)%vertices.length].x + dx, vertices[(k+1)%vertices.length].y+ dy);
  }
}

PVector[][] makeTriangle() {
  PVector[][] points = new PVector[vertexNr][4]; //each side has 1 polygonvertex + 3 movable points
  for (int i = 0; i < points.length; i++) {
    points[i][0] = vertices[i];
    for (int j = 1; j < 4; j++) {
      points[i][j] = new PVector(draggables.getX(i*3+j-1), draggables.getY(i*3+j-1));
    }
  }
  return points;
}

PVector[][] makeSquare() {
  PVector[][] points = new PVector[vertexNr][4]; //each side has 1 polygonvertex + 3 movable points
  for (int i = 0; i < 2; i++) {
    points[i][0] = vertices[i];
    for (int j = 1; j < 4; j++) {
      points[i][j] = new PVector(draggables.getX(i*3+j-1), draggables.getY(i*3+j-1));
    }
  }
  PVector[] trans = new PVector[2];
  trans[0] = new PVector(vertices[3].x -vertices[0].x, vertices[3].y -vertices[0].y);
  trans[1] = new PVector(vertices[0].x -vertices[1].x, vertices[0].y -vertices[1].y);
  for (int i = 2; i < 4; i++) {
    points[i][0] = vertices[i];
    for (int j = 1; j < 4; j++) {
      points[i][4-j] = new PVector(points[i-2][j].x + trans[i-2].x, points[i-2][j].y + trans[i-2].y);
    }
  }
  return points;
}

PVector[][] makeHexagon() {
  PVector[][] points = new PVector[vertexNr][4]; //each side has 1 polygonvertex + 3 movable points
  for (int i = 0; i < vertexNr; i+=2) {
    points[i][0] = vertices[i];
    for (int j = 1; j < 4; j++) {
      points[i][j] = new PVector(draggables.getX(floor(i/2)*3+j-1), draggables.getY(floor(i/2)*3+j-1));
    }
  }
  for (int i = 1; i < vertexNr; i+=2) {
    points[i][0] = vertices[i];
    for (int j = 1; j < 4; j++) {
      points[i][4-j] = rotatePoint(points[i-1][j], -2*PI/3, vertices[i]);
    }
  }
  return points;
}

//rotate p around q by angle
PVector rotatePoint(PVector p, float angle, PVector q) {
  float ang = atan2(p.y-q.y, p.x-q.x);
  float r = dist(p.x, p.y, q.x, q.y);
  return new PVector(q.x + r*cos(ang+angle), q.y + r*sin(ang + angle));
}

void drawPiece(PVector[][] piece, float dx, float dy) {
  beginShape();
  for (int i = 0; i < piece.length; i++) {
    curveVertex(piece[i][0].x+dx, piece[i][0].y+dy);
    curveVertex(piece[i][0].x+dx, piece[i][0].y+dy);
    curveVertex(piece[i][0].x+dx, piece[i][0].y+dy);
    for (int j = 1; j < 4; j++) {
      curveVertex(piece[i][j].x+dx, piece[i][j].y+dy);
    }
  }
  curveVertex(piece[0][0].x+dx, piece[0][0].y+dy);
  curveVertex(piece[0][0].x+dx, piece[0][0].y+dy);
  curveVertex(piece[0][0].x+dx, piece[0][0].y+dy);
  endShape();
}

/******************************************/
/* menu stuff *****************************/
/******************************************/

void showMenu() {
  stroke(150);
  fill(25);
  rect(height, 0, width-height-1, height-1);
  for (int i=height/items; i<height-10; i+=height/items) {
    line(height, i, width, i);
  }
  stroke(0, 0, 100);
  drawMenuPolygon(3, new PVector(height+(width-height)/2, height/items/2), 0.3*(width-height), 0, items);
  drawMenuPolygon(4, new PVector(height+(width-height)/2, height/items+height/items/2), 0.3*(width-height), height/items, items);
  drawMenuPolygon(6, new PVector(height+(width-height)/2, 2*height/items+height/items/2), 0.3*(width-height), 2*height/items, items);
  textSize(18);
  if (radius < 0.5*height) {
    fill(0, 0, 90);
  } else {
    fill(0, 0, 20);
  }
  text("zoom\n in", height+(width-height)/2, 3*height/items+height/items/2); 
  if (radius > 30) {
    fill(0, 0, 90);
  } else {
    fill(0, 0, 20);
  }
  text("zoom\n out", height+(width-height)/2, 4*height/items+height/items/2); 
  fill(0, 0, 90);
  if (showGrid) {
    text("hide\n grid", height+(width-height)/2, 5*height/items+height/items/2);
  } else {
    text("show\n grid", height+(width-height)/2, 5*height/items+height/items/2);
  }
  if (showPoints) {
    text("hide\n points", height+(width-height)/2, 6*height/items+height/items/2);
  } else {
    text("show\n points", height+(width-height)/2, 6*height/items+height/items/2);
  }
  text("new\n colours", height+(width-height)/2, 7*height/items+height/items/2); 
  if (mouseX>height) {
    int nrFromTop = floor(items*mouseY/height); 
    int top = height/items*nrFromTop;
    noStroke();
    fill(0, 0, 90, 50);
    rect(height, top, width-height, height/items); // hover effect
    if (mousePressed) {
      if (nrFromTop == 3 && radius <0.5*height) { 
        zoom(true);
      }
      if (nrFromTop == 4 && radius > 30) {
        zoom(false);
      }
    }
  }
}

void drawMenuPolygon(int nr, PVector mid, float r, int top, int items) {
  if (nr == vertexNr) {
    stroke(0, 0, 90); 
    fill(0, 0, 20);
    strokeWeight(2);
    rect(height, top, width-height-1, height/items-1);
  } else {
    stroke(0, 0, 20);
    strokeWeight(1);
  }
  PVector[] vertices = new PVector[nr];
  for (int i = 0; i< vertices.length; i++) {
    vertices[i] = new PVector(mid.x+r*cos(i*2*PI/vertices.length + PI/vertices.length), 
    mid.y+r*sin(i*2*PI/vertices.length + PI/vertices.length));
  }
  for (int k = 0; k< vertices.length; k++) {
    line(  vertices[k].x, vertices[k].y, vertices[(k+1)%vertices.length].x, vertices[(k+1)%vertices.length].y);
  }
}

void mouseClicked() { // mousePressed wont work when making fast switch
  if (mouseX>height) {
    int nrFromTop = floor(items*mouseY/height); 
    if ( nrFromTop == 0 || nrFromTop == 1 || nrFromTop == 2) {
      if (nrFromTop == 0) {
        vertexNr = 3;
      } else if (nrFromTop == 1) {
        vertexNr = 4;
      } else {
        vertexNr = 6;
      }
      vertices = makeVertices();
      translations = makeTranslationVectors();
      draggables = newDraggables();
    }

    if (nrFromTop == 5) {
      showGrid = !showGrid;
    }
    if (nrFromTop == 6) {
      showPoints = !showPoints;
    }
    if (nrFromTop == 7) {
      for (int i = 0; i < colors.length; i++) {
        float hue = random(360);
        colors[i] = color(hue, 80, 80, 80);
      }
    }
  }
}

/**************************************************************************/
/* Class to draw a set of draggable points. When dragging a point, no     */
/* other point should be dragged. When  point 1 is dragged onto point 2,  */ 
/* point 2 should be partly hidden. Next time the mouse hits the area of  */
/* collision, point 1 should be dragged.                                  */
/* It's necessary to calle release when mouseReleased                     */
/**************************************************************************/

class Draggables {
  
  PVector[] draggables;
  //A stack of indeces. The index of a dragged point is moved to the last position in stack.
  //Draw points in stack-order, update move in reverse stack-order
  int[] stack; 
  int draggedPoint = -1;
  float radius;
  int maxWidth, maxHeight;
  
  Draggables(PVector[] p, float radius, int maxWidth, int maxHeight){
    draggables = p;
    stack = new int[p.length];
    for (int i=0; i<p.length; i++) {
      stack[i] = i;
    }
    this.radius = radius;
    this.maxWidth = maxWidth;
    this.maxHeight = maxHeight;
  }
  
  float getX(int i) {
    return draggables[i].x;
  }
  
  float getY(int i) {
    return draggables[i].y;
  }
  
  PVector getPoint(int i) {
    return draggables[i];
  }
  
  void setX(float x, int i) {
    draggables[i].x =x;
  }
  
  void setY(float y, int i) {
    draggables[i].y =y;
  }
  
  int size() {
    return draggables.length;
  }
  
  void update() {
    float mx = mouseX;
    float my = mouseY;
    if (mousePressed) {
      for (int k=(stack.length-1); k>-1; k--) {
        int i = stack[k];
        if (draggedPoint == -1) {
          if (dist(draggables[i].x, draggables[i].y, mx, my)<=radius) {
            draggedPoint = i;
            moveToLast(k);  
          }
        } else if (mx >0 && my>0 && mx<maxWidth && my<maxHeight) {
            draggables[draggedPoint].x = mx;
            draggables[draggedPoint].y = my;
        }
      }
    } 
  }
  
  void redraw() {
    for (int i=0; i<draggables.length; i++) {
      ellipse(draggables[stack[i]].x, draggables[stack[i]].y, radius, radius);
    }
  }
  
  void release() {
    draggedPoint = -1;
  }
  
  //place the dragged index at the last position in the stack of indeces
  void moveToLast(int i) {
    int temp = stack[i];
    for (int k=i; k<(stack.length-1); k++) {
      stack[k] = stack[k+1];
    }
    stack[stack.length-1] = temp;
  }
  
}



