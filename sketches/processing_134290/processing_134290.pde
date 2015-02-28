
//Copyright Sophie Vennix, siv
//Homework6
//February 18, 2014

float transX;  // transX axis translation amounts
float rotX;  // X axis rotation amounts
float rotDeltaX;  // amount of X axis rotation change for each input

float transY; // transY axis translation amounts
float rotY; // Y axis rotation amounts
float rotDeltaY; //amount of Y axis rotation change for each input

float transZ; // transZ axis translation amounts
float rotZ; // Z axis rotation amounts
float rotDeltaZ; // amount of Z axis rotation change for each input

void setup( )
{
   size( 600, 600, P3D );
   
//Initially there is no rotation:   
   rotDeltaX  = 0;
   rotDeltaY = 0;
   rotDeltaZ= 0;
}

// Strongly suggest you do not alter the draw( ) function...
void draw( )
{
  pushMatrix( );
     prepWindow( );
     drawInitial( );
  popMatrix( );
  showStats( );   
}

// INITIAL: LETTER "S"//
void drawInitial( )
{  
     ///STYLE PROPERTIES///
     //fill(288,0,69);
     fill(248);
     noStroke();
     //stroke(249,62,88);
     //box(50);    
     
     ///POSITIONS///
     
     ///horizontal stroke1
     pushMatrix();
     translate(25,-75,0);
     box(25);
     popMatrix();
     
     pushMatrix();
     translate(0,-75,0);
     box(25);
     popMatrix();
     
     pushMatrix();
     translate(-25,-75,0);
     box(25);
     popMatrix();
     
     ///vertical stroke1
     pushMatrix();
     translate(-50,-50,-25);
     box(25);
     popMatrix();
     
     pushMatrix();
     translate(-50,-25,-25);
     box(25);
     popMatrix();
     
     ///horizontal stroke2
     pushMatrix();
     translate(25,0,0);
     box(25);
     popMatrix();
     
     pushMatrix();
     translate(0,0,0);
     box(25);
     popMatrix();
     
     pushMatrix();
     translate(-25,0,0);
     box(25);
     popMatrix();
     
     ///vertical stroke2
     pushMatrix();
     translate(50,25,-25);
     box(25);
     popMatrix();
     
     pushMatrix();
     translate(50,50,-25);
     box(25);
     popMatrix();
     
     ///hotizontal stroke3
     pushMatrix();
     translate(25,75,0);
     box(25);
     popMatrix();
     
     pushMatrix();
     translate(0,75,0);
     box(25);
     popMatrix();
     
     pushMatrix();
     translate(-25,75,0);
     box(25);
     popMatrix();
     
} 

void prepWindow( )
{
  background( 255 );  
    
  ///(MOVES(0, 0, 0 )POINT TO CENTER OF WINDOW);)///
  translate( width/2, height/2, 0 );
  
  ///MOVEMENT///
  translate(transX,0,0);
  rotX += rotDeltaX;
  rotateX(radians(rotX));

  translate(0, transY, 0);
  rotY += rotDeltaY;
  rotateY(radians(rotY));

  translate(0,0,transZ);
  rotZ += rotDeltaZ;
  rotateZ(radians(rotZ));

  ///DRAW AXIS LINES///
  strokeWeight( 3 );
  ///Z AXIS
  stroke( 255, 98, 0 ); 
  line( 0, 0, 200, 0, 0, -200 );
  ///Y AXIS
  stroke( 0, 164, 128 );
  line( 0, 200, 0, 0, -200, 0 );
  ///X AXIS
  stroke( 59, 218, 0 );
  line( 200, 0, 0, -200, 0, 0 );  

  ///SPOTLIGHTS
  //noLights();
  if (keyPressed) {
    if (key == 'p'){
   ///Z AXIS
   directionalLight(random(0,255), random(0,255), random(0,255), 0, 0, -1 );
   directionalLight(random(0,255), random(0,255), random(0,255), 0, 0, 1 );
   ///Y AXIS
   directionalLight(random(0,255), random(0,255), random(0,255), 0, -1, 0);
   directionalLight(random(0,255), random(0,255), random(0,255), 0, 1, 0);
   
   ///X AXIS
   directionalLight(random(0,255), random(0,255), random(0,255), -1, 0, 0);
   directionalLight(random(0,255), random(0,255), random(0,255), 1, 0, 0);
    }
  }
  ///TURN ON CYAN LIGHTS
  if (keyPressed){
  if (key == 'o')
    {
   directionalLight(30, 255, 255, 0, 0, -1 );
   directionalLight(50, 255, 255, 0, 0, 1 );
    }
  }
  
  ///TURN ON YELLOW LIGHTS
  if (keyPressed){
  if (key == 'i')
    {
   directionalLight(255, 255, 30, 0, 0, -1 );
   directionalLight(255, 255, 50, 0, 0, 1 );
    }
  }
  
  ///TURN ON MAGENTA LIGHTS
  if (keyPressed){
  if (key == 'u')
    {
   directionalLight(255, 30, 255, 0, 0, -1 );
   directionalLight(255, 50, 255, 0, 0, 1 );
    }
  }
}
  

void mouseDragged( )
{
  ///When mouse(LEFT) is dragged to right, translation moves to right
  if (mouseButton == LEFT)
  {
     if (pmouseX < mouseX )
     {
        transX+= 1;
     }
  }
  ///When mouse(LEFT) is dragged to left, translation moves to left
  if (mouseButton == LEFT) 
  {
    if (mouseX < pmouseX)
    {
      transX-= 1;
    }
  }
  ///When mouse(LEFT) is dragged upwards, translation moves up
  if (mouseButton == LEFT)
  {
    if (pmouseY > mouseY)
    {
      transY-= 1;
    }
  }
  ///When mouse(LEFT) is dragged downwards, translation moves down
  if (mouseButton == LEFT)
  {
    if (mouseY > pmouseY)
    {
      transY+=1;
    }
  }
  ///When mouse(RIGHT) is dragged upwards, translation moves closer to you
  if (mouseButton == RIGHT)
  {
    if (pmouseY >  mouseY)
    {
      transZ+=1;
    }
  }
  ///When mouse(LEFT) is dragged downwards, translation moves away from you
  if (mouseButton == RIGHT)
  {
    if (mouseY > pmouseY)
    {
      transZ-=1;
    }
  }
} 

void keyPressed( )
{
    //When "X" is pressed, rotation of X-axis increases in positive direction
    if (key == 'X')
    {
       rotDeltaX += 1;
    }
    //When "x" is pressed, rotation of X-axis increases in negative direction
    if (key == 'x')
    {
       rotDeltaX += -1;
    }
    //When "Y" is pressed, rotation of Y-axis increases in positive direction
    if (key == 'Y')
    {
       rotDeltaY += 1;
    }
    //When "y" is pressed, rotation of Y-axis increases in negative direction
    if (key == 'y')
    {
       rotDeltaY += -1;
    }
    //When "Z" is pressed, rotation of Z-axis increases in positive direction
    if (key == 'Z')
    {
       rotDeltaZ += 1;
    }
    //When "z" is pressed, rotation of Z-axis increases in negative direction
    if (key == 'z')
    {
       rotDeltaZ += -1;
    }
    //When "s" is pressed, all rotations stop/reset
    if (key == 's')
    {
      rotX=0;
      rotY=0;
      rotZ=0;
      rotDeltaX=0;
      rotDeltaY=0;
      rotDeltaZ=0;
    }  
    //When "spacebar" is pressed, all translations are reset, (but rotation continues)
    if (key == ' ')
    {
      transX=0;
      transY=0;
      transZ=0;
    }
   
}  

void showStats( )
{
   textSize(14);
   fill(288,0,69);
   
   ///"ROTATION" STATS
   textAlign( LEFT );
   text("ROTATIONS", 25, 35);
   text("X: "+rotX+" Y: "+rotY+" Z: "+rotZ+" ", 25, 50);
   text("DeltaX: "+rotDeltaX+" DeltaY: "+rotDeltaY+" DeltaZ: "+rotDeltaZ+" ", 25, 65);
  
   ///"TRANSLATION" STATS
   textAlign( RIGHT );
   text("TRANSLATIONS", width-29, height-40);
   text("X: "+transX+" Y: "+transY+" Z: "+transZ+" ", width-25, height-25);
   
}
