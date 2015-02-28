
PImage patch; //PImage to store patch
Point[] bodyPoints; //array used to store the coordinates of the teapot body
Point[] lidPoints; //array used to store the coordinates of the teapot lid
float angle=PI/3; //angle the cross section will be rotated by each time
int lidHeight=80;  //height of the lid from the teapot

void setup() //method called as soon as the program is run
{
  size(256,256,P3D); //specify the size of the window and OPENGL for 3D
  bodyPoints=getBodyPoints(); //load teapot body points into the bodyPoints array
  lidPoints=getLidPoints(); //load teapot lid points into the lidPoints array
  patch = loadImage("IttenPatch.png"); //load the patch image into the patch PImage
  patch.resize((100/patch.height)*patch.width,100); //resize the patch to fit the height of the row 
}

void draw()
{
  background(16,118,151);
  lights();
  //light from below right in midnight blue
  pointLight(255,255,255,mouseX,mouseY,500);
  fill(255);
  noStroke();
  drawPot(width/2,0,-1000,0);
}
void drawPot(int x,int y, int z,float yRotation)
{
  pushMatrix();
  rotateZ(angle/2);
  cameraControl();
  translate(x,y,z);
  rotateX(PI/2);
  rotateY(yRotation);
  rotateZ(map(mouseX,0,width,0,TWO_PI));
  drawBody(bodyPoints);
  drawPatches();
  drawLid(lidPoints,lidHeight);
  drawHandle_Spout();
  popMatrix();
}
void drawBody(Point[] bodyPoints)
{
  pushMatrix();
  for(int i=1;i<bodyPoints.length;i++)
  {//void drawLevelPanels(int panelHeight, float angle, int width1, int width2,int startHeight,PImage img)
    drawLevelPanels(bodyPoints[i].y-bodyPoints[i-1].y,angle,bodyPoints[i-1].x,bodyPoints[i].x,bodyPoints[i-1].y);
  }//drawLevelPanels(100,angle,100,120,100,a);
  rotateX(-PI/2);
  popMatrix();
}

void drawLid(Point[] lidPoints, int offset)
{
  translate(0,0,offset);
  for(int i=1;i<lidPoints.length;i++)
  {//void drawLevelPanels(int panelHeight, float angle, int width1, int width2,int startHeight,PImage img)
    drawLevelPanels(lidPoints[i].y-lidPoints[i-1].y,angle,lidPoints[i-1].x,lidPoints[i].x,lidPoints[i-1].y);
  }//drawLevelPanels(100,angle,100,120,100,a);
  //void drawLevelBase(int width1, float angle,int startHeight,PImage img)
  translate(0,0,-173);
  sphere(20);
  translate(0,0,30);
  sphere(25);
  translate(0,0,143);
  translate(0,0,-offset);
}

void drawHandle_Spout()
{
  translate(140,0,-230);
  rotateY(PI/4);
  drawLevelPanels(-70,PI/2,30,20,0);
  rotateY(-PI/4);
  translate(-280,0,0);
  rotateY(-PI/2);
  drawLevelPanels(-90,PI/2,20,20,4);
  translate(0,0,84);
  rotateY(-PI/2);
  sphere(30);
  drawLevelPanels(-100,PI/2,20,20,0);
  translate(0,0,100);
  drawLevelPanels(-20,PI/2,20,0,0);
}

void drawPatches()
{
  pushMatrix();
    translate(0,183*sin(PI/3),-298);
    rotateX(-PI/2);
    image(patch,-patch.width/2,0);
    rotateX(PI/2);
    translate(0,-2*183*sin(PI/3),0);
    rotateZ(PI);
    rotateX(-PI/2);
    image(patch,-patch.width/2,0);
  popMatrix();
}
void drawAxes()
{
  stroke(255,0,0);
  line(0,0,0,100,0,0);
  stroke(0,255,0);
  line(0,0,0,0,100,0);
  stroke(0,0,255);
  line(0,0,0,0,0,100);
  stroke(0);
}

void cameraControl()
{
  beginCamera();
  if(keyPressed) {
    switch(keyCode) {
    case UP: 
      translate(0,10,0);
      break; //pedestal up
    case DOWN: 
      translate(0,-10,0);
      break; //pedestal down
    case LEFT: 
      translate(10,0,0);
      break; //truck left
    case RIGHT: 
      translate(-10,0,0);
      break; //truck right
    default:
    }
    switch(key) {
    case 'f': 
      translate(0,0,-10);
      break; //dolly forward
    case 'b': 
      translate(0,0,10);
      break; //dolly backward
    case 'q': 
      rotateY(.01);
      break; //pan left
    case 'w': 
      rotateY(-.01);
      break; //pan right
    case 'a': 
      rotateX(.01);
      break; //tilt up
    case 's': 
      rotateX(-.01);
      break; //tilt down
    case 'z': 
      rotateZ(.01);
      break; //roll left
    case 'x': 
      rotateZ(-.01);
      break; //roll right
    default:
    }
  }
  endCamera();
}

//idea for method from http://board.flashkit.com/board/showthread.php?t=775357
Point getRotatedPoint(float x, float y, float angle)
{
  float transformedX = x*cos(angle)-y*sin(angle);
  float transformedY = x*sin(angle)+y*cos(angle);
  Point p = new Point();
  p.x=(int)transformedX;
  p.y=(int)transformedY;
  return p;
}

float getDistanceBetweenPoints(float x1, float y1, float x2, float y2)
{
  return sqrt(abs((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2)));
}

void drawLevelBase(int width1, float angle,int startHeight)
{
  translate(0,0,-startHeight);
  beginShape();
  for(int i=0; i<=TWO_PI/angle; i++)
  {
    vertex(getRotatedPoint(width1,0,i*angle).x,getRotatedPoint(width1,0,i*angle).y);
  }
  endShape(CLOSE);
  translate(0,0,startHeight);
}

void drawLevelPanels(int panelHeight, float angle, int width1, int width2,int startHeight)
{
  noStroke();
  translate(0,0,-startHeight);
  for(int i=0; i<=TWO_PI/angle; i++)
  {
    beginShape();
    vertex(getRotatedPoint(width1,0,i*angle).x,getRotatedPoint(width1,0,i*angle).y);
    vertex(getRotatedPoint(width2,0,i*angle).x,getRotatedPoint(width2,0,i*angle).y,-panelHeight);
    vertex(getRotatedPoint(width2,0,i*angle+angle).x,getRotatedPoint(width2,0,i*angle+angle).y,-panelHeight);
    vertex(getRotatedPoint(width1,0,i*angle+angle).x,getRotatedPoint(width1,0,i*angle+angle).y);
    endShape(CLOSE);
  }
  translate(0,0,startHeight);
}

Point[] getBodyPoints() //load points in point array
{
  //creates a new array of Points gives each one predetermined coordinates for drawing the teapot then returns these coordinates
  Point[] p=new Point[19];
  p[0]=new Point(1,457);
  p[1]=new Point(129,459);
  p[2]=new Point(155,443);
  p[3]=new Point(178,423);
  p[4]=new Point(183,398);
  p[5]=new Point(183,298);
  p[6]=new Point(167,249);
  p[7]=new Point(129,199);
  p[8]=new Point(80,168);
  p[9]=new Point(70,174);
  p[10]=new Point(86,191);
  p[11]=new Point(121,218);
  p[12]=new Point(143,259);
  p[13]=new Point(156,303);
  p[14]=new Point(159,363);
  p[15]=new Point(151,405);
  p[16]=new Point(130,427);
  p[17]=new Point(86,435);
  p[18]=new Point(0,434);
  return p;
}

Point[] getLidPoints()
{
  Point[] p =new Point[4];
  p[0]=new Point(0,172);
  p[1]=new Point(66,173);
  p[2]=new Point(76,166);
  p[3]=new Point(0,163);
  return p;
}



