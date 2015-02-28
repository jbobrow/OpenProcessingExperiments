
final int MAX = 7; //total number of items in each frame

float [ ] c = new float [MAX] ; //radius of each small sphere
float [ ] deltaC = new float [MAX] ; //delta for pulsating the sphere
float [ ] radii = new float [MAX] ; //radius of the circle making the spheres
float [ ] posX = new float [MAX] ; //position in X axis
float [ ] posY = new float [MAX] ; //position in Y axis
float [ ] posZ = new float [MAX] ; //initial position in Z Axis
float [ ] deltaZ = new float [MAX] ; //pushed or pulled in the Z axis by this amount
color [ ] col = new color [MAX] ; // random colors


//---------------------------------------------------------------------------------------------------------------

void setup ( )
{
  size(600, 600, P3D );
  noStroke( ); 
  frameRate(60);
  sphereDetail(4);
  initialize( ) ;  
}

// Initializing the arrays --------------------------------------------------------------------------------------

void initialize( )
{
  for(int i = 0 ; i < MAX ; i++ )
    {
     c[i] = random(0.05*width, 0.1*width) ;
     deltaC[i] = random(0.1, 0.4) ;
     radii[i] = random(0.1*width, 0.3*width) ;
     posX[i] = random(0.2*width, 0.8*width) ;
     posY[i] = random(0.2*height, 0.8*height) ;
     posZ[i] = random(-200, 0);
     deltaZ[i] = random( 0 , 5 ) ;
     col[i] = color(random(255), random(255), random(255),100 ) ;   
    }
}

//---------------------------------------------------------------------------------------------------------------

void draw ( )
{
  
  background(255);
  directionalLight(102, 102, 102, 0, 0, -1);
  ambientLight(102, 102, 102);

  for(int i = 0 ; i < MAX ; i++ )
    {
      pushMatrix( ) ;
        translate(posX[i] , posY[i] , posZ[i] ) ; //translate the centre of the cicle of spheres
        drawAllSpheres( i );                      //draw the circle of spheres
        moveSphere( i );                          //for each sphere - move it
        pulsate( i );                             //for each sphere - pulsate it - 
                                                  //tried making the move and pulsate into one command, did not work.
        pushSphere( i );                           //pushed the whole circle of spheres back by deltaZ

        bringBackSpheres( i ) ;                   //when posZ is more than 0 or less than -300 , bring the circle back.
      popMatrix( );
    } 
}

//----------------------------------------------------------------------------------------------------------

void bringBackSpheres( int i )
{
   if ( posZ[i] < -500 || posZ[i] > 300)
   {
     deltaZ[i] = -deltaZ[i] ;
     posZ[i] +=  -deltaZ[i];
   } 
}

//-----------------------------------------------------------------------------------------------------------

void pushSphere( int i )
{
     {
      posZ[i] = posZ[i] - deltaZ[i]; 
     }

}

//-----------------------------------------------------------------------------------------------------------

void drawAllSpheres( int i )
{
  float rds = radii[i] ;
  
  pushMatrix( );
    translate( rds*sin(radians(30)), -rds*cos(radians(30)), 0 ) ;
    drawSphere( i ); 
  popMatrix( );
  
  pushMatrix( );
    translate ( rds*sin(radians(60)), -rds*cos(radians(60)), 0 ) ;
    drawSphere( i ); 
  popMatrix( );
  
  pushMatrix( );
    translate ( rds*sin(radians(90)), - rds*cos(radians(90)), 0 ) ;
    drawSphere( i );
  popMatrix( );
 
  pushMatrix( );
    translate ( rds*sin(radians(60)), rds*cos(radians(60)), 0 ) ;
    drawSphere( i );
  popMatrix( );
 
  pushMatrix( );
    translate ( rds*sin(radians(30)), rds*cos(radians(30)), 0 ) ;
    drawSphere( i );
  popMatrix( );
 
  pushMatrix( );
    translate( rds*sin(radians(0)) , rds*cos(radians(0)), 0 ) ;
    drawSphere( i ); 
  popMatrix( );
  
  pushMatrix( );
    translate( -rds*sin(radians(30)), rds*cos(radians(30)), 0 ) ;  
    drawSphere( i );
  popMatrix( );
    
  pushMatrix( );
    translate( -rds*sin(radians(60)), rds*cos(radians(60)), 0 ) ;
    drawSphere( i ); 
  popMatrix( );
  
  pushMatrix( );
    translate( -rds*sin(radians(90)), rds*cos(radians(90)), 0 ) ;  
    drawSphere( i ); 
  popMatrix( );

  pushMatrix( );
    translate( -rds*sin(radians(60)), -rds*cos(radians(60)), 0 ) ;
    drawSphere( i ); 
  popMatrix( );
  
  pushMatrix( );
    translate( -rds*sin(radians(30)), -rds*cos(radians(30)), 0 ) ;
    drawSphere( i ); 
  popMatrix( );
  
  pushMatrix( );
    translate( -rds*sin(radians(0)) , -rds*cos(radians(0)), 0 ) ;
    drawSphere( i ); 
  popMatrix( );
  
}

//-----------------------------------------------------------------------------------------------------------

void drawSphere( int i )
{
  fill(col[i]) ;
  sphere(c[i] );  
}

//------------------------------------------------------------------------------------------------------------

void moveSphere( int i )
{
 c[i] = c[i] + deltaC[i] ; 
}

//-----------------------------------------------------------------------------------------------------------

void pulsate( int i )
{ 
  if( c[i] <= 0.05*width || c[i] > 0.1*width )
  {
   deltaC[i] = - deltaC[i] ;

  }
  
}

