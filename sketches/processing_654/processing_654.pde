
int xSpacing = 20;
int ySpacing = xSpacing/2;
int xGridPoints,yGridPoints;
int xStartingPoint, yStartingPoint;
float xposA, yposA, xposB, yposB;
int xGridPos = 0;
//int yGridPos;
float xoff = 0.0;
float yoff = 0.0;
color lineC = color(0,2);
int[] barGraph;

int totalCycles = 0;

PFont font;
int count=0;
float m;

void setup(){
  font = loadFont("SansSerif-15.vlw");

  size(400,400);
  smooth();
  frameRate(1000);
  background(255);

  xGridPoints = floor(width/xSpacing);
  yGridPoints = floor(height/ySpacing);
  barGraph = new int[yGridPoints];

  for(int a = 0;a < yGridPoints;a++){
    barGraph[a] = 0;
  }

  for(int i = 0;i <= xGridPoints;i++){
    for(int j = 0;j <= yGridPoints;j++){
      stroke(0);
      point(i*xSpacing,j*ySpacing);
    }  
  }
  stroke(lineC);
  xStartingPoint = 0;
  yStartingPoint = yGridPoints/2;
  xposA = xStartingPoint;
  yposA = yStartingPoint * ySpacing;
}

void draw(){
  totalCycles();
  if(xGridPos < xGridPoints){
    strokeWeight(1);
    //lineC = color(random(255),random(255),random(255));
    xposB = xposA;
    yposB = yposA;
    xGridPos ++;
    xoff += .01;
    yoff += .01;
    //float nx = (noise(xoff) * ySpacing)-(ySpacing/2);
    //float ny = (noise(yoff) * ySpacing)-(ySpacing/2);
    xposA = (xGridPos * xSpacing);
    //xposA += nx;
    int changeDirection = floor(random(2));
    switch(changeDirection){
    case 0:
      yposA -= ySpacing;
      //yposA += ny;
      break;
    case 1:
      yposA += ySpacing;
      // yposA += ny;
      break;
    case 2:
      yposA += ySpacing;
      // yposA += ny;
      break;
    default:
      println("out of bounds");
      break;
    }
    stroke(lineC);
    line(xposA,yposA,xposB,yposB);
  } 
  else {

    updateCount();
    barGrapher();
    xGridPos = 0;
    xposA = xStartingPoint;
    yStartingPoint = yGridPoints/2;
    //yStartingPoint = int(random(yGridPoints));
    yposA = yStartingPoint * ySpacing;

    //strokeWeight(random(2)+1);
  }
}

void updateCount(){ 
  //noStroke();
  fill(25,50,255);
  noStroke();
  rect(0,0,96,20);
  textFont(font);
  count++;
  fill(255);
  text(count, 10, 15); 
}

void totalCycles(){
  //noStroke();
  fill(25,50,255);
  noStroke();
  rect(0,20,96,20);
  textFont(font);
  totalCycles++;
  fill(255);
  stroke(lineC);
  text(totalCycles, 10, 35);
}

void barGrapher(){
  barGraph[int(yposA/ySpacing)] ++;
  for(int a = 0;a < barGraph.length - 1;a++){
    int x = width;
    int y = (a*ySpacing)-(ySpacing);
    fill(255,0,0);
    rect(x,y,-(barGraph[a]),ySpacing*2);
  }
}





