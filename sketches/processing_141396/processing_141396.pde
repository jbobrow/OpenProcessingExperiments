
// HW 9 prototype
// Strings
// Array of Strings

final int MAX_IMAGE = 7;
String str;
//String [] arrayOfMonth = {"JAN","FEB", "MARCH","APRIL", "MAY", "JUNE", "JUL", "AUG", "SEPT", "OCT", "NOV","DEC"};
String [] arrayOfMonth = {"Spring", "Summer", "Autumn", "Winter"};

//String [ ] arrayOfStr1 = { "hello world", "hello", "world", "how are you" };
//String [ ] arrayOfStr2 = { "red", "orange", "yellow", "green", "blue", "violet" };
//String [ ] arrayOfStr3 = { "0", "1", "2", "3", "4", "5" };

float [ ] xVals      = { 10,  50, 100, 150, 200, 250, 300, 350, 400, 450, 490 };
float [ ] yVals      = {  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0};
float [ ] deltaYVals = {  1,   2,   3,   4,   5,   6,   7,   8,   9,  10,  11 };

//PImage pic;
PImage[ ] picArray;
PImage[ ] picArray2;

int picCount;

void setup( )
{
  size( 400, 600 );
  textSize( 18 );
  fill( 0 );
  textAlign( CENTER, CENTER );
  frameRate( 24 );
  str = "Carnival";  
  
  imageMode( CENTER );
  picArray = new PImage [ MAX_IMAGE ];
  picArray2 = new PImage [ MAX_IMAGE ];
  initImageArray( picArray, picArray2 );
  picCount = 0;
}

void draw( )
{
  background( 170, 230, 250  );
  //text( str, width/2, 140 );
 // printArray( arrayOfStr2 );  
  //printIndividualCharacters( str );
  //rainCharacters( str );
  spinCharacters( );
  
  
  pushMatrix( );
    rotate( radians( frameCount ) );
    
    stroke(0, 102, 153);
    strokeWeight(3);
    line(0,0, 0,-63);
    line(0,-63,6,-58);
    line(0,-63,-6,-58);
    
    popMatrix( );
  
}

void printArray( String [ ] anyArray)
{
  for( int i = 0; i < anyArray.length; i++ )
  {
     text( anyArray[i], width/2, 70 + i*40 ); 
  }
  noLoop( );
}

void printIndividualCharacters( String s )
{  
  for( int i = 0; i < s.length( ); i++ )
  {
    text( "index [" + i +"]: " + s.charAt( i ), width/2, 20 + i*20 ); 
  }
  noLoop( );
}

void rainCharacters( String s )
{
  for( int i = 0; i < s.length( ); i++ )
  {
    // The % operatoris used here because the three arrays of float that 
    // position and move the letters amay not be the same length as the
    // String being used.
    // Using the % operator insures the a the array index is alwasy inbounds
    // though the output may superiimpose one letter over another.
    yVals[ i % yVals.length] += deltaYVals[i % deltaYVals.length];
    if( yVals[i % yVals.length] > height )  
    {
          yVals[i % yVals.length] = 0;
    }
    text( arrayOfMonth[ i ], xVals[i % xVals.length], yVals[i % yVals.length]); 
  }
}

void spinCharacters()
{
  float degreesOfSeparation = 360/4 ;
  
  translate( width/2, height/4 );
 
  fill( 255 );
  noStroke( );
  ellipse( 0, 0, 130, 130 );
  
  pushMatrix( );
    for( int i = 0; i < 4; i++ )
    {  
      rotate( radians( degreesOfSeparation ) ); 
      line( 0, 0, 0, 100 );

           pushMatrix( );
        translate( 0, 115);
        //rotate( radians( -frameCount) - radians(degreesOfSeparation*(i+1)));
        text( arrayOfMonth[i], 0, 0); 
      popMatrix( );
    }  
  popMatrix( );
  textSize(20);
  fill(0, 102, 153);

  text("Japanese fashion", -100,200); 
  text("Aemrican fashion", 100,200); 
  
      image( picArray[picCount], 0-width/4, height/2, 110, 160 );
     
      image( picArray2[picCount], width/4, height/2, 110, 160 );
  
  if( frameCount%90 == 0 )//changes what picture it is showing
  {
    picCount++;
    if (picCount >= 4)
    {
       picCount = 0; 
    }
  }


}

void  initImageArray( PImage [ ] picArray , PImage [ ]picArray2  )
{
  for(int i = 0; i < 4; i++)
  {
    String imageName = "Pic" + i + ".jpg" ;
    picArray[i] = loadImage(imageName );
    String imageName2 = "Pic" + (i+4) + ".jpg" ;
    picArray2[i] = loadImage(imageName2 );
  }
  
}


