
//Lincoln He
//Carnegie Mellon University All Rights Reserved
//Processing for the Arts
//HW9

float [] pArrayX = new float[ 20 ];
float [] pArrayY = new float[ 20 ];
float [] pArrayZ = new float[ 20 ];

color [] col = new int [ 20 ];
int diam;

void setup()
{
  size(600,600,P3D);
  initArrays( pArrayX, pArrayY, pArrayZ );

  noFill();
  strokeWeight(.01);
  diam = width/40;

}

void draw()
{
  background( 255 );
  lights();
  moveFigs( pArrayX, pArrayY, pArrayZ);
  drawFigs( pArrayX, pArrayY, pArrayZ);
  drawSphere (pArrayX, pArrayY, pArrayZ);
  
}
  
void drawSphere(float[]arrayX, float[]arrayY,float[]arrayZ)
{
  for (int i = 0; i<arrayX.length; i++)
   {
   pushMatrix();
     translate(arrayX[i], arrayY[i], arrayZ[i] );
     rotateY( radians(frameCount*i) );
     fill(random(255), random(255), random(255));
     sphere(diam);
   popMatrix();
   }
}
  
void drawFigs(float[]arrayX, float[]arrayY,float[]arrayZ)
{

   for (int i = 0; i<arrayX.length; i++)
   {
    
    pushMatrix();
       translate(arrayX[i], arrayY[i], arrayZ[i] );
       rotateY( radians( frameCount*i ) );
       pyramid();
       
    popMatrix();
   }
 
}


void pyramid()
{
  scale(30);
  beginShape();
   vertex(-1, -1, -1);
  vertex( 1, -1, -1);
  vertex( 0,  0,  1);

  vertex( 1, -1, -1);
  vertex( 1,  1, -1);
  vertex( 0,  0,  1);

  vertex( 1, 1, -1);
  vertex(-1, 1, -1);
  vertex( 0, 0,  1);

  vertex(-1,  1, -1);
  vertex(-1, -1, -1);
  vertex( 0,  0,  1);
  endShape( CLOSE );
}


void moveFigs ( float[ ] arrayX, float [ ] arrayY, float [ ] arrayZ )
{ 
for( int i = 0; i < arrayX.length; i++)
   {
    arrayX[i] += 5 + i;
    if ( arrayX[i] >= 500 )
    {
       arrayX[i] = -500; 
    }
    else if ( arrayX[i] < -500)
    {
      arrayX[i] = 500; 
    }
    
    arrayY[i] += 5+i;
    if( arrayY[i] >= 500 )
    {
       arrayY[i] = -500; 
    } 
    else if ( arrayY[i] < -500)
    {
      arrayY[i] = 500; 
    }
   
    arrayZ[i] += 5+i;
    if ( arrayZ[i] >= 500 )
    {
       arrayZ[i] = -500; 
    }
      }     
}


void initArrays( float [ ] arrayX, float [ ] arrayY, float [ ] arrayZ )
{
   for (int i = 0; i < arrayX.length; i++)
   {
     arrayX[ i ] = random( 50, width-50 );
     arrayY[ i ] = random( 50, height-50 ); 
     arrayZ[ i ] = random( -100, -1000 * i * 1000);   
   }
}


