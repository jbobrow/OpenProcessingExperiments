
//Homework 9
//Amy Friedman
//amyfried
//Copyright Amy Friedman November 2013 Pittsburgh, PA

float [ ] bluePeopleArrayX = new float[ 35 ];
float [ ] bluePeopleArrayY = new float[ 35 ];
float [ ] bluePeopleArrayZ = new float[ 35 ];
float [ ] redPeopleArrayX = new float[ 50 ];
float [ ] redPeopleArrayY = new float[ 50];
float [ ] redPeopleArrayZ = new float[ 50 ];

float sz;
color blue, red, purple;

void setup()
{
  size(400,400, P3D);
  frameRate(20);
  
  initArraysB(bluePeopleArrayX, bluePeopleArrayY, bluePeopleArrayZ);
  initArraysR(redPeopleArrayX, redPeopleArrayY, redPeopleArrayZ);
  
  blue = color( 0, 0, 255 );
  red = color( 255, 0, 0 );
  purple= color(#7900D1);
  sz=8;
  
  stroke(0 );
  strokeWeight(1);
  sphereDetail( 5 );
  noCursor( );
  loop();
}

void draw()
{
  background(255);
  textSize(15);
  text("We come in all different shapes and colors....", width*.05, height*.05);
  moveRedArmy(redPeopleArrayX, redPeopleArrayY, redPeopleArrayZ);
  moveBlueArmy(bluePeopleArrayX, bluePeopleArrayY, bluePeopleArrayZ);
  redArmyMen(redPeopleArrayX, redPeopleArrayY, redPeopleArrayZ, red,purple);
  blueArmyMen( bluePeopleArrayX, bluePeopleArrayY, bluePeopleArrayZ, blue, purple);
  armyCollide(bluePeopleArrayX,bluePeopleArrayY,bluePeopleArrayZ,redPeopleArrayX,redPeopleArrayY, redPeopleArrayZ, purple);
}

void armyCollide(float [] blueX, float [] blueY, float [] blueZ, float [] redX, float[] redY, float[]redZ, color mix)
//walk at bottom of page and upside down at top
//then walk left side && right side
//then walk backwards up down left right
//then start over
{
    for( int i = 0; i < blueX.length; i++)
   {
     if (blueX[i]>width*.5 && redX[i]<width*.5)
     {
       armyMen(blueX[i], blueY[i], blueZ[i]);
       armyMen(redX[i], redY[i], redZ[i]);
       fill(mix);
     }
  }
}



void moveRedArmy ( float[ ] arrayX, float [ ] arrayY, float [ ] arrayZ )
{ 
   for( int i = 0; i < arrayX.length; i++)
   {
      
      arrayZ[i]=arrayZ[i]-3;
      if (arrayZ[i]<-1000||arrayZ[i]>1000)
      {
        arrayZ[i]=-arrayZ[i];      
      }
   }
}

void moveBlueArmy ( float[ ] arrayX, float [ ] arrayY, float [ ] arrayZ )
{ 
   for( int i = 0; i < arrayX.length; i++)
   {
      arrayX[i]=arrayX[i]+3;
      
      if(arrayX[i]>width+sz)
      {
        arrayX[i]=-arrayX[i];
      }
   }
}

void redArmyMen( float[ ] arrayX, float [ ] arrayY, float [ ] arrayZ, color col, color mix )
{
  fill(col);
  for( int i=0; i<arrayX.length; i++)
  {
    armyMen(arrayX[i], arrayY[i], arrayZ[i]);
    if(arrayZ[i]<-400)
    {
      fill(mix);
      text("....but at the end of the day were all people", width*.2, height*.15);
    }
  }
   
}


void blueArmyMen( float[ ] arrayX, float [ ] arrayY, float [ ] arrayZ, color col, color mix)
{
  fill(col);
  for( int i=0; i<arrayX.length; i++)
  {
    armyMen(arrayX[i], arrayY[i], arrayZ[i]);
    
    if(arrayX[i]>width*.5)
    {
      fill(mix);
    }
  }   
}


void armyMen( float x, float y, float z )
{
   
      pushMatrix( );
      translate( x, y, z );
      sphere( sz );
      popMatrix( ); 
      
      pushMatrix();
      translate( x, y+13, z);
      box(sz,sz*1.87,sz*1.43); 
      popMatrix();
    
      pushMatrix();
      translate( x+5, y+10, z);
      box(sz*.71,sz*1.43,sz*.57); 
      popMatrix();
      
      pushMatrix();
      translate( x-5, y+10, z);
      box(sz*.71,sz*1.43,sz*.57); 
      popMatrix();
      
      pushMatrix();
      translate( x+3, y+21, z);
      box(sz*.57,sz*1.57,sz*.57); 
      popMatrix();
      
      pushMatrix();
      translate( x-3, y+21, z);
      box(sz*.57,sz*1.57,sz*.57); 
      popMatrix(); 
}


void initArraysR( float [ ] arrayX, float [ ] arrayY, float [ ] arrayZ )
{
   for (int i = 0; i < arrayX.length; i++)
   {
     arrayX[ i ] = random(width*.25, width*.75);
     arrayY[ i ] = random( height*.65, height); 
     arrayZ[ i ] = random( -120, -3000 * i * 3000);   
   }
}

void initArraysB( float [ ] arrayX, float [ ] arrayY, float [ ] arrayZ )
{
   for (int i = 0; i < arrayX.length; i++)
   {
     arrayX[ i ] = random( 0-width*.5, width*.1);
     arrayY[ i ] = random( height*.65, height); 
     arrayZ[ i ] = random( -120, -3000 * i * 3000);   
   }
}


