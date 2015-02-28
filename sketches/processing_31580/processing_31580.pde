
int colorRed =0;
int colorSwitch =0;
int gridYScale =0;
int gridYSwitch = 0;
int gridXScale =0;
int gridXSwitch = 0;
int rotateDegree = 0 ;
float theta = 0;
float r = 50;
float maxDistance = 150;


void setup() {
  size (800, 500, P3D);
  frameRate(10);
}

void draw () {
  background(255);

  noStroke ();

  if (rotateDegree < 180) {
    rotateDegree++;
  }
  else {
    rotateDegree--;
  }

  // resize the grid size overtime
  if (gridYScale < 50 && gridYSwitch== 0) {
    gridYScale ++;
  }
  else if (gridYScale >=50 && gridYSwitch ==0 ) {
    gridYScale --;
    gridYSwitch = 1;
  }
  else if (gridYScale > 25 && gridYSwitch ==1 ) {
    gridYScale -- ;
  }
  else if (gridYScale == 25 && gridYSwitch ==1 ) {
    gridYScale ++ ;
    gridYSwitch = 0 ;
  }


  // resize the grid size overtime
 if (gridXScale < 50 && gridXSwitch== 0) {
    gridXScale ++;
  }
  else if (gridXScale >=50 && gridXSwitch ==0 ) {
    gridXScale --;
    gridXSwitch = 1;
  }
  else if (gridXScale > 25 && gridXSwitch ==1 ) {
    gridXScale -- ;
  }
  else if (gridXScale == 25 && gridXSwitch ==1 ) {
    gridXScale ++ ;
    gridXSwitch = 0 ;
  }



 // adding step of 25 to create grid in X direction

  for (int gridX= 0 ; gridX<800 ; gridX = (gridX + gridXScale) ) {


    // adding step of 25 to create grid in Y direction
    for (int gridY=0; gridY<800 ; gridY = gridY + gridYScale ) {
      // each individual object's diameter respond to the distance of the mouse

      float shapeDiameter;
      float colorSwap;
      // mouseX minus by 400 to respond to origin location which is shifted by 400
      PVector mousePos = new PVector( mouseX , mouseY , 0);
      PVector shapePos = new PVector( gridX, gridY, 0);
      shapeDiameter = PVector.dist (shapePos, mousePos) / maxDistance *40;



      // changing cube red value over time
      if (colorRed < 255 && colorSwitch== 0) {
        colorRed ++;
      }
      else if (colorRed >=255 && colorSwitch ==0 ) {
        colorRed --;
        colorSwitch = 1;
      }
      else if (colorRed > 0 && colorSwitch ==1 ) {
        colorRed -- ;
      }
      else if (colorRed == 0 && colorSwitch ==1 ) {
        colorRed ++ ;
        colorSwitch = 0 ;
      }


      pushMatrix ();
      
      translate (gridX , gridY , shapeDiameter*3);

      fill(colorRed, 0, 0, 50);
      box(20, 20, 20);
      popMatrix();
    }
  }
}


