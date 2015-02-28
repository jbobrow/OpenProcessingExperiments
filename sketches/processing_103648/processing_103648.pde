
int screenWidth = 800;
int screenHeight = 600;


void draw() 
{
   fill(255,255,255);
   ellipse(mouseX,mouseY,50,50);
   
   ellipse(mouseX-10,mouseY-12, 15,15);
   ellipse(mouseX+10,mouseY-12, 15,15);
   
}



void setup()
{

size (screenWidth, screenHeight);
background (100,100,255);

float treeXPosition = screenWidth / 2.0;

drawCloud(300, 200, 150,100);
drawCloud(500, 100, 200, 100);

drawTree(treeXPosition);
drawTree(treeXPosition + 100);
drawTree(treeXPosition  - 300);
drawTree(treeXPosition - 350);




}

void drawTree(float xPosition)

{
 fill(100,100,100);
 rect(xPosition, 300, 50,300);

 fill(0,255,100);
 ellipse(xPosition + 25, 300, 200,200);
  
}

void drawCloud(float xPosition, float yPosition, float cloudWidth, float cloudHeight){
  fill(255,255,255);
  rect(xPosition,yPosition,cloudWidth,cloudHeight,100);
  
  
}
