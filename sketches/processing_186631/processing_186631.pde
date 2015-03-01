
ArrayList <int[]> ellipsePoints = new ArrayList<int[]>();
int [] selectorPosition;

void setup() {
  size(300, 300);
  background(225);
  
  //iteration for the creation coordinates for ellipses
  for (int i = 30; i < 300; i += 30) {
    for (int j = 30; j < 300; j += 30) {
      
      //construction of int list so I can use curly bracket construct
      ellipsePoints.add(new int[] {i,j}); 
      
    }
  }
}

void draw() {
  fill(80);
  //refreshes background each time draw is called
  background(225);
  //display of mouse coordinates for scale while building
  //text(str(mouseX)+' '+str(mouseY), 0, 10);
  //loop to draw all datapoints in the ellipsePoints list
  for (int[]i : ellipsePoints) {
    ellipse(i[0], i[1], 10, 10);
  }
  fill(#FF7E7E);
  int currentClosestEllipse = closestTo(new int[] {mouseX, mouseY}, ellipsePoints);
  ellipse(ellipsePoints.get(currentClosestEllipse)[0],ellipsePoints.get(currentClosestEllipse)[1],8,8);
}

int closestTo(int[] pointerLocation, ArrayList<int[]> ellipsePoints){
  int [] p = pointerLocation;
  float minEllipseDistance = 10000.0;
  int currentEllipseIndex = 0;
  int minEllipseIndex = 0;
  for ( int[] i : ellipsePoints) {
    float distance =  sqrt(sq(p[0] - i[0]) + sq(p[1] - i[1]));
    if (distance < minEllipseDistance){
      minEllipseDistance = distance;
      minEllipseIndex = currentEllipseIndex;
    }
    
    currentEllipseIndex += 1;
  }
  
  return minEllipseIndex;
}



