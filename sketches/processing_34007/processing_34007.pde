
   //http://forum.processing.org/topic/generating-shapes
   //Generating shapes
   
    int numberOfCircles = 11;
    int numberOfPoints = 8;
    int distanceBetweenCircles = 50;
    boolean showPoints;
    int pointSize = 8;
     
    int[][] radiusPoint = new int[numberOfCircles][numberOfPoints];
    void setup() {
      size(550,550);
      smooth();
      curveTightness(-0.3);
      noFill();
    }
     
    void draw() {
      background(255);
      translate(width/2,height/2);
      generateRadiusPoints();
     
      for (int i=0; i<numberOfCircles; i++) {
        beginShape();
        for (int j=0; j<numberOfPoints+3; j++) {
          if (j < numberOfPoints) {
            int rPoint = radiusPoint[i][j];
            curveVertex(sin((TWO_PI/numberOfPoints)*j)*rPoint,cos((TWO_PI/numberOfPoints)*j)*rPoint);
            if (showPoints) { ellipse(sin((TWO_PI/numberOfPoints)*j)*rPoint,cos((TWO_PI/numberOfPoints)*j)*rPoint,pointSize,pointSize); }
          } else {
            int rPoint = radiusPoint[i][(j-numberOfPoints)];
            curveVertex(sin((TWO_PI/numberOfPoints)*(j-numberOfPoints))*rPoint,
            cos((TWO_PI/numberOfPoints)*(j-numberOfPoints))*rPoint);
            if (showPoints) { ellipse(sin((TWO_PI/numberOfPoints)*(j-numberOfPoints))*rPoint,
            cos((TWO_PI/numberOfPoints)*(j-numberOfPoints))*rPoint,pointSize,pointSize); }
          }
        }
        endShape();
      }
    }
     
    void generateRadiusPoints() {
      for (int i=0; i<numberOfCircles; i++) {
        for (int j=0; j<numberOfPoints; j++) {
            radiusPoint[i][j] = int(noise(frameCount*0.005,j)*distanceBetweenCircles*i);
        }
      }
    }
     
    void keyPressed() {
      if (key == ' ') {
        showPoints = !showPoints;
      }
    }               
