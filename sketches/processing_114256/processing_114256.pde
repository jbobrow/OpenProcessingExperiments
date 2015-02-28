
//annie ranttila, copyright 2013
//carnegie mellon university
//assignment 6 - programming in the arts with processing
float transX, transY, transZ;
float rotX, rotY, rotZ;
float rotDeltaX, rotDeltaY, rotDeltaZ;
PImage img;
void setup()
{
  size (600, 600, P3D);
  rotDeltaX = 0;
  rotDeltaY = 0;
  rotDeltaZ = 0;
  img = loadImage("LED1.jpg");
 
}

void draw()
{
 
   pushMatrix();
    PrepareWindow();
    drawInitial();
    //frameRate(20);
    popMatrix();
    
   showStats();
}

void drawInitial()
{
  strokeWeight(6);
  stroke(random(255), random(255), random(255));
  noFill();
 
  pushMatrix();
  rotateZ(radians(30));
  rotateY(radians(30));
  translate(-70,0,0);
  box(10,200,10);
  popMatrix();
  
  pushMatrix();
  rotateZ(radians(150));
  rotateY(radians(30));
  translate(-48,8,0);
  box(10,200,10);
  popMatrix();
  
  pushMatrix();
  //rotateX(radians(30));
  rotateY(radians(30));
  translate(-20,0,30);
  box(180,10,10);
  popMatrix();


}



void mouseDragged()
{
  
     if (pmouseX < mouseX)
       {
        transX+=1;
       }
      
     if (pmouseX > mouseX)
       {
        transX-=1;
       }
      
     if (pmouseY > mouseY)
       {
        transY-=1;
       }
      
     if (pmouseY < mouseY)
       {
        transY+=1;
       }
  
     if (pmouseY > mouseY )
       {
        transZ+=1;
       }
      
     if (pmouseY < mouseY)
       {
        transZ-=1;
       }
  }


void keyPressed()
{
  if ( key == 'X' ) 
      rotDeltaX = rotDeltaX + 2;
    if ( key == 'x' ) 
      rotDeltaX = rotDeltaX - 2;
    if ( key == 'Y' ) 
      rotDeltaY = rotDeltaY + 2;
    if ( key == 'y' ) 
      rotDeltaY = rotDeltaY - 2;
    if ( key == 'Z' ) 
      rotDeltaZ = rotDeltaZ + 2;
    if ( key == 'z' ) 
      rotDeltaZ = rotDeltaZ - 2;
    if(key == ' ')
    {
      
       rotDeltaX= 0;
       rotDeltaY= 0;
       rotDeltaZ= 0;
        
       rotX= 0;
       rotY= 0;
       rotZ= 0;

    }
    if(key == 's')
    {
      rotDeltaX = 0;
      rotDeltaY = 0;
      rotDeltaZ = 0;
    }


}

void showStats( )
{
   fill( 255 );
   textSize( 18 );
   textAlign( CENTER );
   text("x, y, z to rotate, space to reset, s to stop ", 
          width*.5, height - 500 );
   }

void PrepareWindow( )
{

 //background(img); 
 image(img,0,0,width,height);
translate( width/2, height/2, 0 );
 lights( );
  translate(transX, 0, 0);
  rotX += rotDeltaX;
  rotateX(radians(rotX));
translate(transY, 0, 0);
  rotY += rotDeltaY;
  rotateY(radians(rotY));
  translate(transZ, 0, 0);
  rotZ += rotDeltaZ;
  rotateZ(radians(rotZ));

}

void drawAxis()
{
   

    translate( width/2, height/2, 0 );
}


