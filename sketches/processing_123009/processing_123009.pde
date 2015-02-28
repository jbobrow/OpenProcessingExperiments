
//Yingri Guan
//HW9

import toxi.geom.*;
import toxi.geom.mesh.*;
import toxi.math.waves.*;
import toxi.processing.*;

import processing.opengl.*;

ToxiclibsSupport gfx;

TriangleMesh mesh;

int NUM = 30;

int [ ] xCoords;
int [ ] yCoords;
int [ ] zCoords;
int [ ] xDelta;
int [ ] yDelta;
int [ ] zDelta;
int [ ] boxSize;
int [ ] xRot;
int [ ] yRot;
int [ ] zRot;
color [ ] cols;

int dx, dy;
int ddx, ddy;

void setup ()
{
  size( 500, 500, P3D );
  
  dx = width/2;
  dy = height/2;
  ddx = 0;
  ddy = 0;
  
  xCoords = new int[ NUM ];
  yCoords = new int[ NUM ];
  zCoords = new int[ NUM ];
  xDelta = new int[ NUM ];
  yDelta = new int[ NUM ];
  zDelta = new int[ NUM ];
  boxSize = new int[ NUM ];
  xRot = new int[ NUM ];
  yRot = new int[ NUM ];
  zRot = new int[ NUM ];
  cols = new color[ NUM ];
  
  initCoords( xCoords, -width, width );
  initCoords( yCoords, -height, height );
  initCoords( zCoords, -width, height );
  initCoords( xDelta, -5, 5 );
  initCoords( yDelta, -5, 5 );
  initCoords( zDelta, 5, 15 );
  initCoords( boxSize, 5, 50 );
  initCoords( xRot, -5, 5 );
  initCoords( yRot, -5, 5 );
  initCoords( zRot, -5, 5 );
  initColors( );
  
  strokeWeight( 2 );
  sphereDetail( 4 );  
  
  gfx=new ToxiclibsSupport(this);

}

void draw ( )
{
  background( 0 );
//  lights( );
  stroke( 255 );
  moveFigures( );
  plotFigures( ); 
  directionalLight(0, 255, 0, 0, -1, 0); 

}

void initCoords( int [ ] coords, int  min, int max )
{
  for( int i = 0 ; i < coords.length ; i++ )
  {
    coords[i] = int( random( min, max ) );
  }
}

void initColors(   )
{
  for( int i = 0 ; i < cols.length ; i++ )
  {
    float r = random( 255 );
    float g = random( 255 );
    float b = random( 255 );
    cols[i] = color( r, g, b );
  }
}

void moveFigures( )
{
  for( int i = 0 ; i < cols.length ; i++ )  
  {
    xCoords[i] = xCoords[i] + xDelta[i];
    if ( xCoords[i] <=-width || xCoords[i] >= width )
    {
       xDelta[i] = xDelta[i]*(-1); 
    }
    
    yCoords[i] = yCoords[i] +yDelta [i];
    if( yCoords[i] <=-height|| yCoords[i] >= height )
    {
       yDelta[i] = yDelta[i]*(-1); 
    } 

    zCoords[i] = zCoords[i] +zDelta [i];
    if ( zCoords[i] <=- width || zCoords[i] >= height)
    {
       zDelta[i] = zDelta[i]*(-1); 
    }
  }  
}

void plotFigures ( )
{
  noStroke( );
  for( int i = 0 ; i < cols.length ; i++ )  
  {

    fill( cols[i]);
    pushMatrix( );
      translate (xCoords[i], yCoords[i], zCoords[i] );
      rotateX( -radians( frameCount)*xRot[i] );
      rotateY( -radians( frameCount)*yRot[i] );
      rotateZ( -radians( frameCount)*zRot[i] );
      
     SurfaceFunction f=new SuperEllipsoid(1,1);
          mesh=(TriangleMesh)new SurfaceMeshBuilder(f).createMesh(null,40,50);
          mesh.computeVertexNormals();
          mesh.transform(new Matrix4x4().translate(-boxSize[i]/2, -boxSize[i]/2, -boxSize[i]/2 - 2));
          gfx.mesh(mesh,true,50);
          
    popMatrix( );
  }
}

void keyPressed(){
  for( int i = 0 ; i < cols.length ; i++ )  
  {
      if (key == 'x')
      {
         xRot[i]--;
      }
      else if (key == 'X')
      {
         xRot[i]++;
      }
      else if (key == 'y')
      {
         yRot[i]--;
      }
      else if (key == 'Y')
      {
         yRot[i]++;
      }
      else if (key == 'z')
      {
         zRot[i]--;
      }
      else if (key == 'Z')
      {
         zRot[i]++;
      }
//      else if ( key == ' ' )
//     {
//      xRot[i] = yRot[i] = zRot[i] = 0;
//      xDelta[i] = yDelta[i] = zDelta[i] = 0;
//   }



  }
}



