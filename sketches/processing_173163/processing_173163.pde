
float[] coordsX;
float[] coordsY;
int pointslength;



int pointDragged;

boolean showCode = true ;
boolean fillState = true;
boolean dataState = true;
boolean curvesState = false;

int grid_unit = 10;

boolean snap2grid = true;

void setup(){
  size(900, 600);
  frameRate(25);
  coordsX = new float[35];
  coordsY = new float[35]; 

  randomize();
  smooth();
  noFill();

  background(0);
  
  textSize(12);
  
}


void draw() {
  background(0);
  println(mouseX);

  // grid
  stroke(50);
  for (int i = 0; i < height; i +=grid_unit) {
    line(0, i, width, i);
  }
  for (int i = 0; i < width; i +=grid_unit) {
    line(i, 0, i, height);
  }

  // center
  fill(255, 0, 0);
  stroke(255, 0, 0);
  ellipse(width/2, height/2, 5, 5);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);

  pushMatrix();
  if ( showCode ) {
    fill(255);
    stroke(255);
    int j = 10;
    text("beginShape();", 10, j);
    for ( int i =0; i < pointslength; i++ ) {
      j = j + 13;
      float y = (coordsY[i]-height/2);
      float x = (coordsX[i]-width/2);
      text("curveVertex( "+x+" , "+y+" );", 10, j);
    }
    text("endShape();", 10, j+13);
  } else if ( dataState && curvesState ) {
      noFill();
      stroke(255, 100, 100);
      beginShape();
      if ( curvesState) {
        curveVertex(coordsX[0], coordsY[0]);
        curveVertex(coordsX[0], coordsY[0]);
      } else {
        vertex(coordsX[0], coordsY[0]);
        vertex(coordsX[0], coordsY[0]);
      }
      for ( int i =1; i < pointslength-1; i++) {
        if ( curvesState) curveVertex(coordsX[i], coordsY[i]);
        else vertex(coordsX[i], coordsY[i]);
      }
      if ( curvesState) {
        curveVertex(coordsX[pointslength-1], coordsY[pointslength-1]);
        curveVertex(coordsX[pointslength-1], coordsY[pointslength-1]);
      } else {
        vertex(coordsX[pointslength-1], coordsY[pointslength-1]);
        vertex(coordsX[pointslength-1], coordsY[pointslength-1]);
      }
      endShape();
      stroke(255);
      ellipse(coordsX[0], coordsY[0], 3, 3);
    }
    stroke(255);
    if ( fillState) fill(127, 150);
    else noFill();
    beginShape();

    for ( int i =0; i < pointslength; i++) {
      if ( curvesState) curveVertex(coordsX[i], coordsY[i]);
      else vertex(coordsX[i], coordsY[i]);
    }
   // endShape(CLOSE);
   endShape();

    if ( dataState ) {
      for ( int i =0; i < pointslength; i++) {
        fill(255);
        //stroke(255,0,0);

        text(int(coordsX[i]-width/2)+" , "+int(coordsY[i]-height/2), coordsX[i]+5, coordsY[i]+5);
        //noFill();
        ellipse(coordsX[i], coordsY[i], 3, 3);
      }
    }
  
  popMatrix();
}

void mousePressed() {

  // Find closest point
  float closestDistance = 40; // minimal distance
  int closestPoint = -1;
  for ( int i=0; i < pointslength; i++ ) {
    float distance = dist(mouseX, mouseY, coordsX[i], coordsY[i]);
    if ( distance < closestDistance) {
      closestPoint = i;
      closestDistance = distance;
    }
  }

  pointDragged = closestPoint;
}

void mouseDragged() {

  if (snap2grid) {
    if ( pointDragged != -1 ) {
      // Update last curveVertex
      coordsX[pointDragged] =int( mouseX/grid_unit) * grid_unit;
      coordsY[pointDragged] = int(mouseY/grid_unit)*grid_unit;
    } else {
      for ( int i =0; i < pointslength; i++) {
        coordsX[i] = coordsX[i] + mouseX - pmouseX;
        coordsY[i] = coordsY[i] + mouseY - pmouseY;
      }
    }
  } else {

    if ( pointDragged != -1 ) {
      // Update last curveVertex
      coordsX[pointDragged] = mouseX;
      coordsY[pointDragged] = mouseY;
    } else {
      for ( int i =0; i < pointslength; i++) {
        coordsX[i] = coordsX[i] + mouseX - pmouseX;
        coordsY[i] = coordsY[i] + mouseY - pmouseY;
      }
    }
  }
}

void mouseReleased() {
  pointDragged = -1;
}

void keyPressed() {
  if (key == '+') {
    grid_unit += 1;
  } else if (key == '-') {
    grid_unit -=1;
  }
  grid_unit = constrain(grid_unit, 5, 100);
  //println(grid_unit);

  if (key == CODED) {
    if (keyCode == LEFT) {
      for ( int i =0; i < coordsX.length; i++) {
        coordsX[i] = coordsX[i] -grid_unit;
        coordsY[i] = coordsY[i];
      }
    } else if (keyCode == RIGHT) {
      for ( int i =0; i < coordsX.length; i++) {
        coordsX[i] = coordsX[i] +grid_unit;
        coordsY[i] = coordsY[i];
      }
    } else if (keyCode == UP) {
      for ( int i =0; i < coordsX.length; i++) {
        coordsX[i] = coordsX[i] ;
        coordsY[i] = coordsY[i]-grid_unit;
      }
    } else if (keyCode == DOWN) {
      for ( int i =0; i < coordsX.length; i++) {
        coordsX[i] = coordsX[i] ;
        coordsY[i] = coordsY[i]+grid_unit;
      }
    }
  }

  if (key == 'a') {
    addVal();
  } else if (key == 'e') {
    removeVal();
  } else if (key == 'h') {
    randomize();
  } else if (key == 'c') {
    curvesState = !curvesState ;
  } else if (key == 's') {
    snap2grid = !snap2grid;
  } else if (key == 'p') {
  println('ok');
    printCode();
    
  }
   else if (key == 'd') {
    dataState = !dataState;
  }
}

void addVal() {
  if ( length < coordsX.length) { 
    float angle = atan2(coordsY[pointslength-1]-coordsY[pointslength-2], coordsX[pointslength-1]-coordsX[pointslength-2]);
    coordsX[pointslength] = cos(angle) * 40 + coordsX[pointslength-1];
    coordsY[pointslength] = sin(angle) * 40 + coordsY[pointslength-1];
    pointslength= pointslength+ 1;
  }
}


void removeVal() {
  if ( pointslength> 4) pointslength= pointslength- 1;
}

void randomize() {
  for ( int i=0; i < coordsX.length; i++ ) {
    coordsX[i] = (int)random(width-10)+5;
    coordsY[i] = (int)random(height-10)+5;
  }
  pointslength= int(random(1)+4);
} 

void fill(boolean theValue) {
  fillState = theValue;
} 

void curves(boolean theValue) {
  curvesState = theValue;
} 

void data(boolean theValue) {
  dataState = theValue;
} 

void snap2grid(boolean theValue) {
  snap2grid = theValue;
} 

void printCode() {
  String code = new String();
  code = code + "beginShape();\r";
  for ( int i =0; i < pointslength; i++) {
    float y = (coordsY[i]-height/2);
    float x = (coordsX[i]-width/2);

    if ( curvesState) code = code + "curveVertex("+x+", "+y+");\r";
    else code = code + "vertex("+x+", "+y+");\r";
  }
  code = code + "endShape();\r";
  println(+code);
  // cp.copyString(code);
}
