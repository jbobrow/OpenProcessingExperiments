
color[][] pixelArray;
int boxLength;
color fillColor = color(0, 255, 0);

ArrayList<myPoint> checkedPoints;

ArrayList<myPoint> pointsToAdd;
int count;

//255-white
//0-black
void setup() {
  pixelArray=new color[60][60];
  checkedPoints=new ArrayList<myPoint>();
  pointsToAdd=new ArrayList<myPoint>();
  count=0;

  size(600, 600);

  loadPixels();

  for (int i=0;i<pixelArray.length;i++) {
    for (int j=0;j<pixelArray[i].length;j++) {
      float randomValue=random(0, 1);
      if (randomValue<0.55) {
        pixelArray[i][j]=color(255);
      }
      else {
        pixelArray[i][j]=color(0);
      }
    }
  }

  updatePixels();

  boxLength=width/pixelArray.length;
}

void draw() {
  
  if(!pointsToAdd.isEmpty() && count<pointsToAdd.size()){
    pixelArray[pointsToAdd.get(count).x][pointsToAdd.get(count).y]=fillColor;
    count++;
  }
  
  background(255);
  for (int i=0;i<pixelArray.length;i++) {
    for (int j=0;j<pixelArray[i].length;j++) {
      fill(pixelArray[i][j]);
      stroke(pixelArray[i][j]);
      rect(i*boxLength, j*boxLength, boxLength, boxLength);
    }
  }
}

color[][] fillMap(color[][] pixelMap, int startX, int startY) {
  myPoint newPoint = new myPoint(startX, startY);
  for (myPoint a : checkedPoints) {
    if (a.equals(newPoint)) {
      return pixelMap;
    }
  }
  
  checkedPoints.add(new myPoint(startX, startY));
  if (pixelMap[startX][startY]==color(255)) {
    pointsToAdd.add(new myPoint(startX, startY));
  }
  else{
    return pixelMap;
  }
  
  if (startX>0) {
    pixelMap=fillMap(pixelMap, startX-1, startY);
  }
  if (startY>0) {
    pixelMap=fillMap(pixelMap, startX, startY-1);
  }
  if (startX<pixelMap.length-1) {
    pixelMap=fillMap(pixelMap, startX+1, startY);
  }
  if (startY<pixelMap[0].length-1) {
    pixelMap=fillMap(pixelMap, startX, startY+1);
  }
  return pixelMap;
}

void mouseClicked() {
  checkedPoints=new ArrayList<myPoint>();
  pixelArray=fillMap(pixelArray, mouseX/boxLength, mouseY/boxLength);
}

void keyPressed(){
  if(keyCode=='R'){
    setup();
  }
}

class myPoint {
  int x;
  int y;

  myPoint(int a, int b) {
    x=a;
    y=b;
  }

  boolean equals(myPoint other) {
    return(x==other.x && y==other.y);
  }
}


