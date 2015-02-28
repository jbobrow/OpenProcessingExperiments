
//ICE 14

//CopyRight Risa Hiyama
//Create an array of 10 Strings and initialize it with an initializer list containing 10 
// Strings of your own choosing. 
//• Display the contents of the array in a vertical column with one String on each 
// level. 
//• Move the vertical column across the window in a wrapping motion. 


String [ ] arrayOfStr1 = { "every thing ", "is", "going to be okay", "as long as","you","never", "take your eyes",  "off","this screen"};
float x=0;
void setup( )
{
  size( 500, 600 );
  textSize( 18 );
  fill(255, 255, 0  );
  textAlign( CENTER, CENTER );
  frameRate( 5 );
}

void draw( )
{
  background( 0  );
  //text( str, width/2, 140 );
  printArray( arrayOfStr1 );  
  //printIndividualCharacters( str );
  //moveArray(  arrayOfStr1 );
  //spinCharacters( str );
}


void printArray( String [ ] anyArray)
{
  if(x==width-10){
    x=0;
  }
  else
  x=x+5;
  for( int i = 0; i < anyArray.length; i++ )
  {
     text( anyArray[i], x, 70 + i*40 );
  }
}


