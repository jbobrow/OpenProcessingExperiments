
Strokes[] brushStrokes;


void setup() {
  size ( 400, 400 );

  brushStrokes = new Strokes[ 15 ];
  
  for ( int i=0; i<brushStrokes.length; i++) {
    float newRed = map(i, 0, brushStrokes.length, 100, 255);
    color newFill = color( newRed, 255, 100);
    color newStroke = color( newRed, 255, 100);
    brushStrokes[i] = new Strokes( newFill, newStroke );
  }
}


void draw() {

  fill( 0, 3);
  noStroke();
  rect( 0, 0, width, height );
  
  for ( int i=0; i<brushStrokes.length; i++) {
    brushStrokes[i].display();
  }
  
}

class Strokes {

  float x;
  float y;
  float offSetX;
  float offSetY;
  color fillColor;
  color strokeColor;

  Strokes( color theColor, color theStroke ) {
    fillColor = theColor;
    strokeColor = theStroke;
  }

  void display() {

    //float extent = random(-30, 30);
    
    for ( float i=0; i<40; i++) {
      offSetX = random(-i, i);
      offSetY = random(-i, i);
      
      if (mouseX-pmouseX == 0) {
        x = mouseX + (offSetX)*random(3);
        y = mouseY + (offSetY)*random(3);
      }
      
      else {
        x = mouseX + offSetX;
        y = mouseY + offSetY;
      }
    }

    fill(fillColor);
    stroke(strokeColor);
    line( mouseX, mouseY, x, y );
  }
  
}



