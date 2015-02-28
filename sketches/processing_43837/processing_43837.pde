
// Homework Extra Credit 3
// 51-757 Computing for the Arts with Processing
// October 27, 2011
// Copyright Molly Nix October 2011 Pittsburgh, PA 15232


int MAX = 5;

float [ ] bx;
float [ ] by;
float [ ] bht;
float [ ] bwd;
float [ ] bdx;
float [ ] bdy;
color [ ] bcol;

void setup( )
{
  size ( 400, 200 );
  textSize( 24 );
  textAlign( CENTER );
  bx = new float [ MAX ];
  initFloatArray( bx, 50, width-50 );
  by = new float [ MAX ];
  initFloatArray( by, 50, height-50  );
  bht = new float [ MAX ];
  initFloatArray( bht, 0, height*.1);
  bwd = new float [ MAX ];
  initFloatArray( bwd, 0, width*.1 );
  bdx = new float [ MAX ];
  initFloatArray( bdx, 1, 10  ); 
  bdy = new float [ MAX ];
  initFloatArray( bdy, 2, 14  ); 
  bcol = new color [ MAX ];
  initColorArray( );
}

void draw( )
{
  prepScreen( );  
  moveBoxes( );   
  drawBoxes( );
}
void initFloatArray(float [ ] farray, float low, float high) 
{
  for ( int i = 0; i < farray.length; i++ )
  {
    farray[ i ] = int( random(low, high) );
  }
}

void initColorArray( ) 
{
  for ( int i = 0; i < bcol.length; i++ )
  {
    bcol[ i ] = color( int( random(255) ), 
    int( random(255) ), 
    int( random(255) ) );
  }
}

void moveBoxes( ) 
{
  for (int i =0; i< MAX; i++) 
  {
    bx[i] = bx[i] + bdx[i];
    by[i] = by[i] + bdy[i];
    if ((bx[i] > width - (bwd[i]/2)) || (bx[i] < (bwd[i]/2))) 
    {
      bdx[i] = -bdx[i];
    }
    if ((by[i] < (bht[i]/2)) || (by[i] > height - (bht[i]/2))) 
    {
      bdy[i] = -bdy[i];
    }
  }
}

void drawBoxes( )
{
  for ( int i = 0; i < MAX; i++ ) 
  {
    fill( bcol[i] );
    rect( bx[i], by[i], bwd[i], bht[i] );
  }
}

void prepScreen( )
{
  fill(225, 152, 111, 10);
  noStroke();
  rectMode( CENTER );
  rect( width/2, height/2, width, height );
}


