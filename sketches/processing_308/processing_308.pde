
/*********************************
Author: BaoQuoc Doan
Date: March 31st, 2008
Comments: Another Experiment with Bezier Curves, It sort looks like a Spiral Graph

***********************************/
int counter = 2;

void setup() {
  size( 600, 600 ); 
  background(0);
}

void draw() {
  counter++;

  if(counter == 300) {
    counter = 300; 

  }

  stroke(200);
  strokeWeight(1);

  DrawCurves(); 

}

void DrawCurves() {
  background(0);
  smooth();
  int[] a = { 
    width/2, height/2   };
  int[] b = { 
    mouseX, mouseY   };

  line( a[0], a[1], b[0], b[1]);

  int[] cvA = new int[2];
  int[] cvB = new int[2];

  int posAngle = FindRelativePolarCoord(a, b);

  int halfDistance = FindDistance(a, b) / 2;

  noFill();

  for(int i = 1; i < counter; i ++) {
    stroke(i % 200, i % 100,0, 30);
    cvA = PolarToCartesian( a[0], a[1],  int(halfDistance + ( halfDistance * (.5 + ( i/10) ) )), posAngle + (i * 2));
    //line( a[0], a[1], cvA[0], cvA[1] );    

    cvB = PolarToCartesian( b[0], b[1], int(halfDistance + ( halfDistance * (.5 + ( i/10) ) )), posAngle - (i * 2) + 180);
    //line( b[0], b[1], cvB[0], cvB[1] );

    bezier(a[0], a[1], cvA[0], cvA[1], cvB[0], cvB[1], b[0], b[1]);


    cvA = PolarToCartesian( a[0], a[1], halfDistance, posAngle - (i * 10));
    //line( a[0], a[1], cvA[0], cvA[1] );    

    cvB = PolarToCartesian( b[0], b[1], halfDistance, posAngle + (i * 10) - 180);
    //line( b[0], b[1], cvB[0], cvB[1] );    
  }
}

//// Finds Polar Coordinate relative to a Reference Point, interms of 0 to 360 degrees
int FindRelativePolarCoord(int[] orig, int target[]) {  
  // Find Angle
  float angle = degrees(atan2(target[1] - orig[1],target[0] - orig[0]));  

  // Covert Degrees (0 to -180), to (180 to 360)
  if(angle < 0) {
    angle = 360 + angle;  
  }  

  // convert to interger
  int deg = int(angle); 

  // Change this to the format for texfile output
  println(" Angle: "+deg);

  return deg; 
}

int FindDistance(int[] orig, int target[]) {
  // Find Distance
  int distance = int(dist(orig[0], orig[1], target[0], target[1]));

  return distance;
}

int[] PolarToCartesian(int xRef, int yRef, int d, int theta) {
  float x = xRef + (d * cos(radians(theta)));
  float y = yRef + (d * sin(radians(theta)));


  int[] coordinate = { 
    int(x), int(y)   };
  return coordinate;
}

