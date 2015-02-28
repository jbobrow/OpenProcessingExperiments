
//copyright Laura Contero 2014
//Homework 10

//press any key to exit
//click on your mouse to find a secret reading

String [ ] dataStrings1, dataStrings2, dataStrings3;
int x [ ] = {300};
int y [ ]= {100};
float xPos, yPos; 
float ySpeed = 3;

void setup()
{
  size( 600, 400 );
  textSize( 24 ); 
  textAlign(CENTER);
    
  dataStrings1 = loadStrings( "data1.txt" );
  dataStrings2 = loadStrings( "data2.txt" );
  dataStrings3 = loadStrings( "data3.txt" );
}

void draw()
{
  background( 255, 0, 0 );
  drawFig( );
  loop( );
  
//  println(frameRate);
}

void drawFig()
{
  //IT PUTS THE LOTION...
  for( int i = 0; i < dataStrings2.length; i++)
  {
    fill( 255, 250, 15 );
    textAlign( CENTER );
    text( dataStrings2[i], x[i], y[i] );
    
    y[i] += ySpeed;
    if( ( y[i] < 0 ) || ( y[i] > height ) ) 
    {
      ySpeed = -ySpeed;
    }
  }
  
  //OR ELSE IT GETS...
  for( int i = 0; i < dataStrings3.length; i++)
  {
    fill( 255, 250, 15 );
    textAlign( CENTER );
    text( dataStrings3[i], x[i], y[i]+30 );
  }
 
  //REDRUM
  for( int i = 0; i < dataStrings1.length; i++)
  {
    fill( 255 );
    textAlign( CENTER );
    text( dataStrings1[i], xPos, yPos );
    
    xPos = frameRate%.25*random( 100, 300 );
    yPos = frameRate%.25*random( 100, 300 );
  }
}
  
void keyPressed()
{
  exit( );
}

void mousePressed()
{
  background( 0 );
  fill( 255 );
  text("RUN", 300, 200);
}


