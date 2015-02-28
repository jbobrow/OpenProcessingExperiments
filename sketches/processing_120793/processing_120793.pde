
// Coral Pais, Carnegie Mellon University
//Reproduction of the program without consent is strictly prohibited

// 257/757  Fall 2013
// Homework #9
// Animated pseudo screen saver in three dimensions

final int BLOCK = 72;

float [ ] blueArrayX = new float[ BLOCK ];
float [ ] blueArrayY = new float[ BLOCK ];
float [ ] blueArrayZ = new float[ BLOCK ];
float [ ] redArrayX = new float[ BLOCK ];
float [ ] redArrayY = new float[ BLOCK ];
float [ ] redArrayZ = new float[ BLOCK ];
color blue, red;
float diam,radius;
int countBlue, countRed;

void setup( )
{
   size( 600, 600, P3D );
   radius=100;
   initBlueArray ( blueArrayX, blueArrayY, blueArrayZ);
   initRedArray ( redArrayX, redArrayY, redArrayZ);
   
   blue = color( 0 , 0, 255 );
   red = color( 255, 0, 0 );
   
   diam = 30;
   
   noStroke( );
   
   
  
}

void draw( )
{
   background( 0 );
   lights ( );
   translate (width, 0, -950);
   rotateX( radians( frameCount/2 ) );
   rotateY( radians( frameCount/2 ) );
   rotateZ( radians( frameCount/2 ) );
      
   drawArray( blueArrayX, blueArrayY, blueArrayZ, blue );
   drawArray( redArrayX, redArrayY, redArrayZ, red );
   
   
   translate (0,0,-1100);
   drawArray( blueArrayX, blueArrayY, blueArrayZ, blue );
   drawArray( redArrayX, redArrayY, redArrayZ, red );
   
   
   if (frameCount%10==0)
   {
     moveBlueArray( blueArrayX, blueArrayY, blueArrayZ );
     moveRedArray( redArrayX, redArrayY, redArrayZ );
   }
  
    
}


void drawArray (float[ ] arrayX, float [ ] arrayY, float [ ] arrayZ, color col)
{
  fill (col);
  
  for (int i=0; i< arrayX. length; i++)
  {
    pushMatrix ( );
    translate( arrayX[ i ], arrayY[i], arrayZ[i] );
    box (diam);
    popMatrix ( );
    
  }
  
}

void moveBlueArray( float[ ] arrayX, float [ ] arrayY, float [ ] arrayZ )
{
  if ( arrayZ [0] != arrayZ [BLOCK-1])
  {
    for( int i = arrayX.length-1; i > 0 ; i--)
     {
      pushMatrix( );
        arrayX[i]=arrayX[i-1];
        arrayY[i]=arrayY[i-1];
        arrayZ[i]=arrayZ[i-1];
       translate( arrayX[ i ], arrayY[i], arrayZ[i] );
      popMatrix( ); 
     }
     countBlue=0;
  }
  
  else
  {
    for( int i = 0; i < arrayX.length-1 ; i++)
               { 
                  pushMatrix( );
                    arrayX[ countBlue ] =  radius * cos (radians (countBlue*20));
                    arrayY[ countBlue ] =  radius * sin (radians (countBlue*20)); 
                    arrayZ[ countBlue ] = -countBlue*20;
                   translate( arrayX[ i ], arrayY[i], arrayZ[i] );
                  popMatrix( ); 
                }
           countBlue++;
    
  }
        
         
  
}


void moveRedArray( float[ ] arrayX, float [ ] arrayY, float [ ] arrayZ )
{
  if (arrayZ [0] != arrayZ [BLOCK-1])
  {
    for( int i = 0; i < arrayX.length-1; i++)
   { 
      pushMatrix( );
        arrayX[i]=arrayX[i+1];
        arrayY[i]=arrayY[i+1];
        arrayZ[i]=arrayZ[i+1];
       translate( arrayX[ i ], arrayY[i], arrayZ[i] );
      popMatrix( ); 
      countRed=BLOCK-1;
   }
  }
  
   else
         { 
           for( int i = arrayX.length-1; i >0 ; i--)
               { 
                  pushMatrix( );
                    arrayX[ countRed ] =  radius * sin (radians (countRed*20));
                    arrayY[ countRed ] =  radius * cos (radians (countRed*20)); 
                    arrayZ[ countRed ] = -countRed*20;
                   translate( arrayX[ i ], arrayY[i], arrayZ[i] );
                  popMatrix( ); 
                }
           countRed--;
         }
           
         
  
}




void initBlueArray( float [ ] arrayX, float [ ] arrayY, float [ ] arrayZ )
{
   
   for (int i = 0; i < arrayX.length; i++)
   {
     
        arrayX[ i ] =  radius * cos (radians (i*20));
       arrayY[ i ] =  radius * sin (radians (i*20)); 
       arrayZ[ i ] = -i*20; 
       
   }
}

void initRedArray( float [ ] arrayX, float [ ] arrayY, float [ ] arrayZ )
{
    
   for (int i = arrayX.length-1; i >0 ; i--)
   {
     
     arrayX[ i ] =  radius * sin (radians (i*20));
     arrayY[ i ] =  radius * cos (radians (i*20)); 
     arrayZ[ i ] = -i*20; 
     
   }
}

void mousePressed ( )
{
   blue = color( random (255) , random (255), 255 );
   red = color( 255, random (255), random (255) );
  
  
}




