
import processing.opengl.*;

//                                 d8b                          d8,      d8b   d8,                    
//                                 88P                         `8P       88P  `8P                     
//                                d88                                   d88                           
// d8888b d888b8b    88bd88b  d888888  ?88   d8P       88bd88b  88b d888888    88b  88bd88b  d888b8b  
//d8P' `Pd8P' ?88    88P' ?8bd8P' ?88  d88   88        88P'  `  88Pd8P' ?88    88P  88P' ?8bd8P' ?88  
//88b    88b  ,88b  d88   88P88b  ,88b ?8(  d88       d88      d88 88b  ,88b  d88  d88   88P88b  ,88b 
//`?888P'`?88P'`88bd88'   88b`?88P'`88b`?88P'?8b     d88'     d88' `?88P'`88bd88' d88'   88b`?88P'`88b
//                                            )88                                                  )88
//                                           ,d8P                                                 ,88P
//                                        `?888P'                                             `?8888P 
//                                                     d8, d8b  d8b                    
//                    d8P                             `8P  88P  88P                    
//                 d888888P                               d88  d88                     
// d8888b d888b8b    ?88'   d8888b  88bd88b?88,.d88b,  88b888  888   d888b8b    88bd88b
//d8P' `Pd8P' ?88    88P   d8b_,dP  88P'  ``?88'  ?88  88P?88  ?88  d8P' ?88    88P'  `
//88b    88b  ,88b   88b   88b     d88       88b  d8P d88  88b  88b 88b  ,88b  d88     
//`?888P'`?88P'`88b  `?8b  `?888P'd88'       888888P'd88'   88b  88b`?88P'`88bd88'     
//                                           88P'                                      
//                                          d88                                        
//                                          ?8P                                        
//
//
// Based on http://www.openprocessing.org/visuals/?visualID=36883 by Alexis
//
// Hacked by mnem - http://noiseandheat.com/
//

int[][] pos = new int[ 2 ][ 320 ];

int v1;
int p1;

int v2;
int p2;

int want = 0;
int lastWant = 0;

class bead_t
{
  bead_t( float vx0, float vy0, float px0, float py0, color c0 )
  {
    vx = vx0;
    vy = vy0;
    px = px0;
    py = py0;
    c  = c0;
    follow = 0;
    atIntersection = false;
    body();
  }
  float vx, vy, px, py;
  color c;
  float r;
  boolean atIntersection;

  int follow = 0;

  void draw( )
  {
    pushMatrix();

    noStroke();
    fill( c );

    emissive(atIntersection ? 100 : 0);

    translate(px, py, 0);
    sphereDetail(15);
    sphere(r);

    if (r == 15)
    {
      sphereDetail(7);

      fill( 128 );

      translate(-5, 10, 7);

      sphere(5);
      translate(10, 0, 0);
      sphere(5);

      sphereDetail(2);
      translate(1, 3, 3);

      fill( 50, 0, 50 );

      sphere(2);
      translate(-12, 0, 0);
      sphere(2);
    }

    popMatrix();
  }

  void head()
  {
    r = 15;
  }

  void body()
  {
    r = 20;
  }
}

bead_t[] bead = new bead_t[ 6 ];

void setup( )
{
  size( 240, 320, OPENGL );

  p1 = -23200;  
  v1= 0;

  p2 = 23200;  
  v2 = 0;

  for ( int i = 0; i < 320; i++ )
    pos[ 0 ][ i ] = ( p1 / 512 ) + 75;

  for ( int i = 0; i < 320; i++ )
    pos[ 1 ][ i ] = ( p2 / 512 ) + 165;

  for ( int i = 0; i < bead.length; i++ )
    bead[ i ] = new bead_t( 0.0, -1.5, ( p1 / 256 ) + 120, i * 20, color( i%3 == 0 ? 128 : 0, i%3 == 1 ? 128 : 0, i%3 == 2 ? 128 : 0 ) );

  bead[bead.length - 1].head();
}

void moveview( )
{
  while ( bead[ 0 ].py > 40 )
  {
    for ( int i = 1; i < 320; i++ )
    {
      pos[ 0 ][ i - 1 ] = pos[ 0 ][ i ];
      pos[ 1 ][ i - 1 ] = pos[ 1 ][ i ];
    }

    p1 = p1 + v1;
    v1 = v1 - ( ( p1 ) / 2048 );
    pos[ 0 ][ 319 ] = ( p1 / 512 ) + 75;

    p2 = p2 + v2;
    v2 = v2 - ( ( p2 ) / 2048 );
    pos[ 1 ][ 319 ] = ( p2 / 512 ) + 165;

    for ( int j = 0; j < bead.length; j++ )
      bead[ j ].py--;
  }
}

void draw_wire( )
{
  boolean c = false;
  int count = 0;
  beginShape(LINES);
  for ( int y = 0; y < 320; y++)
  {
    if (c)
      stroke(255, 129, 162);
    else
      stroke(185, 255, 144);

    vertex(pos[ 0 ][ y ], y);

    if (c)
      stroke(185, 255, 144);
    else
      stroke(255, 129, 162);

    vertex(pos[ 1 ][ y ], y);

    if (++count == 3)
    {
      c = !c;
      count = 0;
    }
  }
  vertex(pos[ 0 ][ 319 ], 319, -sin(319) * 10);
  vertex(pos[ 1 ][ 319 ], 319, -sin(319) * 10);
  endShape();
}

void draw( )
{
  background( 116, 156, 255 );

  lights();
  directionalLight(200, 200, 200, 1, 0, 0);
  ambientLight(102, 102, 102);

  moveview( );

  for ( int i = 0; i < bead.length; i++ )
  {
    boolean atIntersection = abs( pos[ 0 ][ ( int )bead[ i ].py ] - pos[ 1 ][ ( int )bead[ i ].py ] ) < 2;
    bead[i].atIntersection = atIntersection;
    if ( want < 2 && want != bead[ i ].follow && atIntersection )
    {
      // Jump track
      bead[ i ].follow = want;
    }
    else if (atIntersection && i < bead.length - 1)
    {
      if (bead[ i ].follow == bead[ i+1 ].follow)
        bead[ i ].body();
      else
        bead[ i ].head();
    }
    else if (atIntersection && i == bead.length - 1)
    {
      bead[ i ].head();
    }
    bead[ i ].px = pos[ bead[ i ].follow ][ ( int )bead[ i ].py ];
    bead[ i ].py -= bead[ i ].vy;
  }

  draw_wire( );
  for ( int i = 0; i < bead.length; i++ )
    bead[ i ].draw( );
}

void keyPressed( )
{
  if ( keyCode == LEFT )
    want = 0;
  if ( keyCode == RIGHT )
    want = 1;
}

void keyReleased()
{
  want = 2;
}


