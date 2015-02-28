
// Carnegie mellon University
// Computing for the arts & processing 
// Copyright Yasha Mir
// HW_9

float [ ] aArrayX = new float[ 35 ];
float [ ] aArrayY = new float[ 35 ];
float [ ] aArrayZ = new float[ 35 ];
float [ ] bArrayX  = new float[ 30 ];
float [ ] bArrayY  = new float[ 30 ];
float [ ] bArrayZ  = new float[ 30 ];
float [ ] cArrayX  = new float[ 7 ];
float [ ] cArrayY  = new float[ 7 ];
float [ ] cArrayZ  = new float[ 7 ];

int color0, color1, color2, color3, x1, y1, y2, y3, y4;

void setup( )
{
  size( 600, 600, P3D );

  initArrays( aArrayX, aArrayY, aArrayZ );
  initArrays( bArrayX , bArrayY , bArrayZ );
  initArrays( cArrayX , cArrayY , cArrayZ );
  color0 = color(117,99,121);
  color1 = color(172,48,250);
  color2 = color(150,255,39);
  color3 = color(240,255,46);
  x1 = 50;
  y1=300 ;
  y2=500 ;
  y3=800 ;  
}

void draw()
{
 prepWindow(); 
 moveFigs (aArrayX,aArrayY,aArrayZ);
 moveFigs (bArrayX,bArrayY,bArrayZ);
 moveFigs2 (cArrayX,cArrayY,cArrayZ);

 
  pushMatrix();
   translate(width/3, height/3); 
   rotateZ(millis() * 0.001 * PI / 3); 
   drawFigs2 (cArrayX,cArrayY,cArrayZ,color3);
  popMatrix();
  
  pushMatrix();
   translate(width/2, height/2); 
   rotate(millis() * 0.0001 * PI ); 
   drawFigs (aArrayX,aArrayY,aArrayZ,color1);
   drawFigs (bArrayX,bArrayY,bArrayZ,color2);
  popMatrix();
  
 Blackhole();
// movBlkhle (dArrayX,dArrayY,dArrayZ);

 
}

void prepWindow()
{
 background (color0); 
 frameRate(20);
}

//void movBlkhle ()
//{
//  
//}

void Blackhole()
{
  fill(color3,50);
  noStroke();
  pushMatrix();
  translate(width/2, height/2, -600); 
  ellipse (width/20,height/20,200,200); 
  stroke (0,50);
  strokeWeight(4);
  noFill();
  ellipse (width/20,height/20,y1,y1); 
  strokeWeight(3);
  ellipse (width/20,height/20,y2,y2); 
  strokeWeight(2);
  ellipse (width/20,height/20,y3,y3); 
  beginShape(LINES);
  y1+=10;
  y2+=10;
  y3+=10;
  if (y3>width ) y3=200 ;
  else if (y2>2.5*width ) y2=200 ;
  else if (y1>2*width ) y1=200 ;
  popMatrix();


}

void moveFigs ( float[ ] arrayX, float [ ] arrayY, float [ ] arrayZ )
{ 
     for( int i = 0;i < arrayX.length;i++)
   {              
     arrayZ[i] -= i-2;
     if ( arrayZ[i] < -800 ) 
     {
      arrayX[ i ] = random( width );
      arrayY[ i ] = random( height );  
      arrayZ[i] = 500; 
     }  
   }
}

void moveFigs2 ( float[ ] arrayX, float [ ] arrayY, float [ ] arrayZ )
{ 
   for( int i = 0;i < arrayX.length;i++)
   {      
       arrayX[i] += 2 + i;
       arrayY[i] += 2 + i;      
     if (arrayX[i]>width && arrayY[i]>width )
     { 
       arrayX[ i ] = 50;
       arrayY[ i ] = 50;
     }
   }
}

void drawFigs (float[ ] arrayX, float [ ] arrayY, float [ ] arrayZ, color col )
{
//  spotLight(217,219,217,250,300,-200,1,0,0,30,80);
  directionalLight(250,250,242,1,0,-1);
  fill(col,80);
  stroke (col);
  for (int i=0;i<arrayX.length;i++)
  {
      pushMatrix( );
       translate( arrayX[i], arrayY[i], arrayZ[i] );
       rotateX( radians ( frameCount*i*.5));
       rotateY( radians( frameCount*i ));
       box( random(85,x1) );
      popMatrix( ); 
  }
}

void drawFigs2 (float[ ] arrayX, float [ ] arrayY, float [ ] arrayZ, color col )
{
  fill(col,40);
  noStroke();
  for (int i=0;i<arrayX.length;i++)
  {
      pushMatrix( );
       translate( arrayX[i], arrayY[i], arrayZ[i] );
       sphere( x1*.4 );
      popMatrix( ); 
  }
}
void initArrays( float [ ] arrayX, float [ ] arrayY, float [ ] arrayZ )
{
   for (int i = 0; i < arrayX.length; i++)
   {
     arrayX[ i ] = random( width );
     arrayY[ i ] = random( height ); 
     arrayZ[ i ] = random( -300,500);   
   }
}


