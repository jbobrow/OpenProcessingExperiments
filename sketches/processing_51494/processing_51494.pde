
//draw a quad
//on mouse click, find the closest vertex 
//slide it over to the mouse click

PVector vertex1, vertex2, vertex3, mouseVector, moveThis;
float interpTime = 50;
int pointToMove, i, tempX, tempY;
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void setup()
{
  size(800, 800);
  background(255);
vertex1 = new PVector(200f, 200f);
vertex2 = new PVector(600f, 200f);
vertex3 = new PVector(200f, 600f);
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////draw goes here
void draw()
{
  background(255);
  
  
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
  
  stroke(0);
  fill(0);
  beginShape();
  vertex(vertex1.x, vertex1.y);
  vertex(vertex2.x, vertex2.y);
  vertex(vertex3.x, vertex3.y);
  endShape();
  
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void mousePressed()
{
  tempX=mouseX;
  tempY=mouseY;
  
  print("mouse pressed \n");
mouseVector = new PVector(mouseX, mouseY);  
  print("the mouse position is" + mouseVector.x + " " + mouseVector.y + "\n");
moveThis = closestVertex();

i = 0; 

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







