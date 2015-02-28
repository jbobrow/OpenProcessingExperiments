
//Homework 10
//Copyright Miranda Jacoby 2014 all rights reserved
//"split and space" code courtesy of Jim Roberts

//CONTROLS
//Press Space to stop the loop.
//Release Space to continue the loop. 
//Press any other key to quit the program. 


//Testing Noise
float dxStart, dyStart, dxNoise, dyNoise, dx, dy;

//Camera Variables
float eyeX, eyeY, centerX, centerY, upX, upY;

float inc;



String [ ] fileStrings;
String [ ] [ ] individualWords;
void setup( )
{
  size( 800, 600, P3D );
  //size(displayWidth, displayHeight-50, P3D);
  //cameraValues();
  //I considered changing the textMode to SHAPE for clearer text,
  //but the program wouldn't run higher than two frames per second
  //when this mode was enabled
  eyeX = width/2 ;
  eyeY = height/2 ;
  centerX = width/2 ;
  centerY = height/2 ;
  upX = 0 ;
  upY = 1 ;

  textAlign(CENTER);
  fileStrings = loadStrings( "tongueCutSparrow.txt");
  //Begin "split and space" code
  println( fileStrings.length);
  individualWords = new String[ fileStrings.length][0];
  
  for( int i = 0; i < fileStrings.length; i++)
  {
     String [ ] temp =  fileStrings[i].split(" ");
     // you might want to traverse temp here and "clean" up the words
        for( int j = 0; j > temp.length; j++)
       {
         // dp the replace stuff here
         //Was unable to get replact to function properly
        temp[i] = temp[i].replace(",", "");
        temp[i] = temp[i].replace(".", "");
        temp[i] = temp[i].replace("\"", "");
        temp[i] = temp[i].replace("!", "");
        temp[i] = temp[i].replace("?", "");
        temp[i] = temp[i].replace("-", "");
         
       }
     individualWords[i] = temp ;
  }
  //End "split and space" code.
}

void draw( )
{

background( 0 );
fill( 255);
//wordSize();
cameraMove( );
printText( );

}

void printText( )
{
  int yPos = 20;
  // traverse down the 2-d array of Strings row by row
  for( int row = 0; row < individualWords.length  ; row++)
  {
     int xPos = 10;
      // traverse accross each row column by column
     for( int col = 0; col < individualWords[row].length; col++)
     {
         text( individualWords[row][col], xPos, yPos );
         xPos += 50;//70;
          textSize( int(12 + random(18)) );                 
          //Camera Values
         
     }
     yPos += 15;
  }
  
}

//void wordSize()
//{
//  for( int j = 0; j > temp.length; j++)
//  {
//  textSize( (24 + random(32)) );
//  }
//}

void cameraValues()
{
  dxStart = width/3;
  dyStart = height/3;
  dxNoise = random( width/10 );
  dyNoise = random( height/10 );
  dx = dxStart + dyNoise;
  dy = dxStart + dyNoise; 
}

void cameraMove()
{
  //eye and center are changing EyeY = CenterY, EyeX = CenterX;
  camera(eyeX, eyeY, (height/2.0) / tan(PI*30.0 / 180.0), centerX, centerY, 0, upX, upY, 0);
  
  eyeY = eyeY + inc;
  centerY = centerY + inc;
  inc = 15;

             if(eyeY >= 4800)//&& centerY >= 4800)
            {
              inc = -inc;
              criticalError();
              //eyeY -= 15;//--; 
              //centerY -= 15;//--;
           // }
            }
          
         if(eyeY <= 299) ///&& centerY < 300)
         {
           inc = -inc;
           //eyeY + inc = eyeY
           //centerY + inc = centerY
           //inc += 15;
           //eyeY += 15;//++;
            //centerY += 15;//++;
            //println(eyeY);
         }
        // if (eyeY >= 300 || eyeY < 4800)
       //  {
        //   inc = inc;
        // }
//         }

        println(eyeY);
        //println(centerY);
}

void keyPressed( )
{
    if (key == ' ')
    {
        noLoop( ); 
 
    }
    else
    {
      exit();
    }
}

void keyReleased( )
{
 if (key == ' ')
 {
   loop( ); 
 }
}

//This is what happens when I can't figure out why 
//my code won't make the camera decrement properly.
void criticalError()
{
 fill(255, 0, 0);
 textSize(100);
  text("CRITICAL ERROR", width/2, 4800); 
//I didn't change the fill back to white because 
//the way in which the red fill is applied to the text 
//has greater visual interest.
}


