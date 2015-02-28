
//Homework_11
//copyright Maitri Shah, Pittsburgh, PA

float centerX, centerY, centerZ;
float deltaX, deltaY, deltaZ;
color [ ] allColors ;
float mappedXRotation, mappedYRotation, mappedZRotation;
float centerCircle;
float centerCircleX, centerCircleY, centerCircleZ;

void setup ( )
{
  size(600, 600, P3D );
  noStroke( );  
  
  centerX = width/2;
  centerY = height/2;
  centerZ = 0;
  deltaX = 0;
  deltaY = 0;
  deltaZ = 0;
  allColors = new int [13] ;
  initializeAllColors( );
  centerCircle = width/2;
  centerCircleX = width/2;
  centerCircleY = width/2;
  centerCircleZ = width/2;
  
  PFont font;
  font = loadFont("Font1.vlw");
  textFont(font);
  
}

// Making an array of random colors to fill the speheres ----------------------------

void initializeAllColors ( )
{
 for (int i = 0 ; i < allColors.length ; i++ )
  {
   allColors[i] = color(random(255), random(255), random(255), 100);
  } 
}

//--------------------------------------------------------------------------------

void draw ( )
{
  background(255);
  pushMatrix ( );
    translate(0,0,0);
    letterS( );
    moveS( );
  popMatrix( );
  
  drawSlider1( );
  drawSlider2( );
  drawSlider3( );
  
  drawButtons( );
  showData( );

}

//-----------------------------------------------------------------------------------------

void showData( )
{
  textSize(22);
  text( ("X-Axis Distance = " + int(centerX - 300) 
        + "    Y-Axis Distance = " + int(centerY - 300) 
        + "    Z-Axis Distance = " + int(centerZ) ), 0.15*width, 0.06*height );
}

//-----------------------------------------------------------------------------------------

void drawButtons( )
{
 fill(222, 51, 51 );
 stroke( 0 );
 strokeWeight(4);
 ellipse ( 0.05*width, 0.05*height, 0.08*width, 0.08*height) ;
 ellipse ( 0.95*width, 0.05*height, 0.08*width, 0.08*height) ;
 fill(0);
 text("STOP", 0.02*width, 0.06*height);
 text("RESET", 0.915*width, 0.06*height) ;
}


//-----------------------------------------------------------------------------------------

void mousePressed ( )
{
 if (  mouseX < 0.1*width && mouseY < 0.1*width)
 {
  deltaX = 0;
  deltaY = 0;
  deltaZ = 0;
 }
 
 else if ( mouseX > 0.9*width && mouseY < 0.1*width)
 {
  centerX = width/2;
  centerY = height/2;
  centerZ = 0;
  deltaX = 0;
  deltaY = 0;
  deltaZ = 0;
  centerCircle = width/2;
  centerCircleX = width/2;
  centerCircleY = width/2;
  centerCircleZ = width/2;
  mappedXRotation = 0;
  mappedYRotation = 0;
  mappedZRotation = 0;
 }
}

//--------------------------------------------------------------------------------

float findCenter ( )
{
  float centerCircle ;
  
  if (mouseX >= width*0.1125 && mouseX <= width*0.875)
 {
  centerCircle = mouseX;
 }
 
 else if (mouseX < width*0.1125)
 {
  centerCircle =  width*0.1125;
 }
 
 else
 {
  centerCircle = width*0.8875 ;
 }
 
 return centerCircle ;
}


//----------------------------------------------------------------------------------

void findCenterCircle( )
{
       if ( mouseY > 0.85*height && mouseY < 0.9*height)
         {
           centerCircleX =  findCenter( ) ;
           mappedXRotation = map(centerCircleX, width*0.1125, width*0.8875, -360, 360);
         }
         
       else if (mouseY > 0.9*height && mouseY  < 0.95*height )
         {
          centerCircleY = findCenter( ) ; 
          mappedYRotation = map(centerCircleY, width*0.1125, width*0.8875, -360, 360);
         }
 
       else if( mouseY  > 0.95*height )
        {
         centerCircleZ = findCenter( ) ;
         mappedZRotation = map(centerCircleZ, width*0.1125, width*0.8875, -360, 360);
        }

}

//----------------------------------------------------------------------------------

void drawSlider3 ( )
{
  noStroke( );
  fill(0);
  rect(width*0.1, height*0.95, width*0.8, height*0.025);
  fill(222, 51, 51);
  ellipse(centerCircleZ, height*0.9625, width*0.025, height*0.025);
  textSize(20);
  fill(0);
  text("Z-Axis" , 0.02*width , 0.97*height );
  text( int(mappedZRotation), 0.92*width, 0.97*height);
}

//----------------------------------------------------------------------------------

void drawSlider2 ( )
{
  noStroke( );
  fill(0);
  rect(width*0.1, height*0.90, width*0.8, height*0.025);
  fill(222, 51, 51);
  ellipse(centerCircleY, height*0.9125, width*0.025, height*0.025);
  textSize(20);
  fill(0);
  text("Y-Axis" , 0.02*width , 0.92*height );
  text( int(mappedYRotation), 0.92*width, 0.92*height);
}

//-----------------------------------------------------------------------

void drawSlider1 ( )
{
  noStroke( );
  fill(0);
  rect(width*0.1, height*0.85, width*0.8, height*0.025);
  fill(222, 51, 51);
  ellipse(centerCircleX, height*0.8625, width*0.025, height*0.025);
  textSize(20);
  fill(0);
  text("X-Axis" , 0.02*width , 0.87*height );
  text( int(mappedXRotation), 0.92*width, 0.87*height);
}


// All the keypressed moving functions ------------------------------------------------------

void keyPressed ( )
{
 if (keyCode == RIGHT )
  {
    deltaX = deltaX + 1;
  } 
  
 else if (keyCode == LEFT )
  {
   deltaX = deltaX - 1; 
  }
  
 else if (keyCode == DOWN )
  {
   deltaY = deltaY + 1; 
  }
  
 else if (keyCode == UP )
  {
   deltaY = deltaY - 1; 
  }
  
 else if (key == 'a' )
  {
    deltaZ = deltaZ - 1;
  }
  
 else if (key == 'c' )
  {
   deltaZ = deltaZ + 1; 
  }
  
 else if (key == 's' )
  {
   deltaX = 0;
   deltaY = 0;
   deltaZ = 0; 
  }
  
 else if (key == ' ' )
  {
    centerX = width/2;
    centerY = height/2;
    centerZ = 0;
    deltaX = 0;
    deltaY = 0;
    deltaZ = 0;
  }
  
 else if (key == 'z')
  {
    centerZ = centerZ - 500;
  }
  
 else if (key == 'x')
  {
   centerZ = centerZ + 500;
  }
  
}

// Moving the letter "S" - adding the deltas - not changing them here ---------------------------

void moveS ( )
{
 centerX = centerX + deltaX;
 centerY = centerY + deltaY;
 centerZ = centerZ + deltaZ; 
}

// Drawing the Letter "S"  - mouse pressed - rotating the letter -------------------------------

void letterS( )
{
  translate(centerX , centerY, centerZ);
   
   // mapping the rotation values for each axis - 
   
      if (mousePressed)
        {
           findCenterCircle( );
          
        }
        
    rotateX(radians(mappedXRotation) ) ;
    rotateY(radians(mappedYRotation) ) ;
    rotateZ(radians(mappedZRotation) );
   
   
  pushMatrix( );
    translate(100, -100, -180);
    drawSphere( allColors[0] ); 
  popMatrix( );
 
  pushMatrix( );
    translate(75, -175, -150);
    drawSphere( allColors[1] );
  popMatrix( );
  
  pushMatrix( );
    translate(0, -200, -120);
    drawSphere( allColors[2] );
  popMatrix( );
 
 pushMatrix( );
   translate(-75,-175, -90);
   drawSphere( allColors[3] );
 popMatrix( );
 
 pushMatrix( );
   translate(-100, -100, -60);
   drawSphere( allColors[4] );
 popMatrix( );
 
 pushMatrix( );
   translate(-75, -25, -30);
   drawSphere( allColors[5] );
 popMatrix( );
 
 pushMatrix( );
   translate(0, 0, 0);
   drawSphere( allColors[6] );
  popMatrix( );
 
 pushMatrix( );
   translate(75, 25, 30);
   drawSphere( allColors[7] );
 popMatrix( );
 
 pushMatrix( );
   translate(100, 100, 60);
   drawSphere( allColors[8] );
 popMatrix( );
 
 pushMatrix( );
   translate(75, 175, 90);
   drawSphere( allColors[9] );
 popMatrix( );
 
 pushMatrix( );
   translate(0, 200, 120);
   drawSphere( allColors[10] );
 popMatrix( );
 
 pushMatrix( );
   translate(-75, 175, 150);
   drawSphere( allColors[11] );
 popMatrix( );
 
 pushMatrix( );
   translate(-100, 100, 180);
   drawSphere( allColors[12] );
 popMatrix( );  
}

// Drawing each Sphere ----------------------------------------------------------

void drawSphere( color col)
{
 noStroke( );
 fill(col);
 sphere(height/10); 
}

