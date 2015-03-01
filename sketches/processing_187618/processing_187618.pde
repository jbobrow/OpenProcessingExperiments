
CurveShape c;

void setup(){
  //size(displayWidth,displayHeight);
  size(800,600);
  colorMode(HSB, 360, 100, 100);
  c = new CurveShape();
}

void draw(){
  background(0);
  c.update();
  c.display();
}

/*
// Full Screen
boolean sketchFullScreen() {
  return true;
}*/
class CurveShape {

  int numPoints = 500;
  int border = 0;
  PVector[] points = new PVector[numPoints];
  float[] t = new float[numPoints];
  float[] n = new float[numPoints];
  float[] nScaled = new float[numPoints];


  CurveShape() {
    for (int i = 0; i < points.length; i++) {
      points[i] = new PVector(int(random(border, width-border)), int(random(border, height-border)));
    }
  }

  void update() {

    for (int i = 0; i < points.length; i++) {
      checkEdges( points[i] );
      n[i] = noise(t[i]);
      nScaled[i] = map(n[i], 0, 1, -1, 1);
      points[i].x += nScaled[i]; 
      points[i].y += nScaled[i];
      t[i] += (i*100+.0001)*.005;
    }
  }

  void display() {
    noFill();
    colorChange();
    strokeWeight(.5);
    beginShape();
    curveVertex(points[0].x, points[0].y);
    for ( int i = 0; i < points.length; i ++) {
      curveVertex(points[i].x, points[i].y);
    }
    curveVertex(points[points.length-1].x, points[points.length-1].y);
    endShape();
  }

  void checkEdges(PVector dot) {
    if ( dot.x > width ) {
      dot.x = 0;
    }
    if ( dot.x < 0 ) {
      dot.x = width;
    }
    if ( dot.y > height ) {
      dot.y = 0;
    }
    if ( dot.y < 0 ) {
      dot.y = height;
    }
  }

  void colorChange() {
    float c = 360*((sin(frameCount)+1)/2.0);
    float s = random(75)*((sin(frameCount)+1)/2.0);
    float b = random(75)*((sin(frameCount)+1)/2.0);
     stroke(c, s, b );
  }
  // "dot" monitor
  //    for (int i = 0; i < points.length; i++)
  //    {
  //      noStroke();
  //      fill(255, 0, 0);
  //      ellipse(points[i].x, points[i].y, 5, 5);
  //    }
}



