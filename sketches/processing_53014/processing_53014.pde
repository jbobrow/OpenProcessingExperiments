
//draw a quad
//on mouse click, find the closest vertex 
//slide it over to the mouse click
import peasy.*;
PeasyCam cam;


PVector vertex1, vertex2, vertex3, mouseVector, moveThis;
float interpTime = 50;
int pointToMove, i, tempX, tempY;
boolean hasMoved=false;
int tempXforCam = 0;
int tempYforCam = 0;
int xDif;
int yDif;
int lightJiggle=0;
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void setup()
{
  cam = new PeasyCam(this, 400, 400, -400, 1100);
 cam.setActive(false);
  size(800, 800, P3D);
  background(255);
vertex1 = new PVector(200f, 200f, 0f);
vertex2 = new PVector(600f, 200f, 0f);
vertex3 = new PVector(200f, 600f, 0f);



}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////draw goes here
void draw()
{
  
  background(255);
  lights();
  lightFalloff(1.0, 0.1, 0.1);
  directionalLight(126, 1, 126, cam.getPosition()[0]+lightJiggle, cam.getPosition()[1]+lightJiggle, cam.getPosition()[2]);
  //ambientLight(2, 2, 2);
  textMode(SCREEN);
  fill(242); 
  text("more more more");


  
  
  
///////////////////////////////////////////// calculate the changes to the camera to make
 xDif = mouseX-tempXforCam;
 yDif = mouseY-tempYforCam;
 tempXforCam = mouseX;
 tempYforCam = mouseY;
 
 if(hasMoved){
    cam.rotateY(((float)xDif/width)*7);
    cam.rotateX(((float)yDif/height)*7);
 }

    
    
    
  if(i < interpTime)
  {
    i++;
    
    if(pointToMove==1)
    {
       vertex1.set(CosineInterpolate(moveThis.x, tempX, i), CosineInterpolate(moveThis.y, tempY, i), 0);
    }
    if(pointToMove==2)
    {
      vertex2.set(CosineInterpolate(moveThis.x, tempX, i), CosineInterpolate(moveThis.y, tempY, i), 0);
    }
    if(pointToMove==3)
    {
      vertex3.set(CosineInterpolate(moveThis.x, tempX, i), CosineInterpolate(moveThis.y, tempY, i), 0);
    } 
  }

  
 
  stroke(140);
  fill(140);
  beginShape(TRIANGLE_FAN);
  vertex(vertex1.x, vertex1.y, 0);
  vertex(vertex2.x, vertex2.y, 0);
   //fill(random(150, 255), random(150, 255), random(150, 255));
  vertex(vertex3.x, vertex3.y, 0);
  
  vertex(400, 400, -800);
  
 
  endShape();
 
  
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void mousePressed()
{
 if(!hasMoved)
 {
  tempX=mouseX;
  tempY=mouseY;
  
  print("mouse pressed \n");
  mouseVector = new PVector(mouseX, mouseY);  
  print("the mouse position is " + mouseVector.x + " " + mouseVector.y + " " + mouseVector.z);
  moveThis = closestVertex();

  i = 0; 
  hasMoved=true;
 }
}  
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

PVector closestVertex()
{
  PVector tempVector = new PVector(0, 0);
  
  if(mouseVector.dist(vertex1)==min(mouseVector.dist(vertex1), mouseVector.dist(vertex2), mouseVector.dist(vertex3)))
  {
    pointToMove = 1;
    tempVector = vertex1; 
  }
  if(mouseVector.dist(vertex2)==min(mouseVector.dist(vertex1), mouseVector.dist(vertex2), mouseVector.dist(vertex3)))
  {
    pointToMove = 2;
    tempVector = vertex2; 
  }
  if(mouseVector.dist(vertex3)==min(mouseVector.dist(vertex1), mouseVector.dist(vertex2), mouseVector.dist(vertex3)))
  {
    pointToMove = 3;
    tempVector = vertex3; 
  }
 return tempVector;
  //call this function on mousePressed()
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


float CosineInterpolate(float y1, float y2, float mu)
{
   float mu2;

   mu2 = (1-cos((float)(mu/interpTime)*PI))/2;
   return(y1*(1-mu2)+y2*mu2);
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





