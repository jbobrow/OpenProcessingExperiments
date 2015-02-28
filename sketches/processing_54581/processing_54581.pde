
//Homework11
//Vishal Agrawal
//vishala@andrew.cmu.edu
//copyright (C) 2012

int MAX = 10;

float [ ] bx;
float [ ] by;
float [ ] bht;
float [ ] bwd;
float [ ] bdx;
float [ ] bdy;
color [ ] bcol;

void setup( )
{
   size ( 600, 600 );
   bx = new float [ MAX ];
   initFloatArray( bx, 50, width-50 );
   by = new float [ MAX ];
   initFloatArray( by, 50, height-50  );
   bht = new float [ MAX ];
   initFloatArray( bht, 0, height*.1);
   bwd = new float [ MAX ];
   initFloatArray( bwd, 0, width*.1 );
   bdx = new float [ MAX ];
   initFloatArray( bdx, 5 ,15  ); 
   bdy = new float [ MAX ];
   initFloatArray( bdy, 5 ,15  ); 
   bcol = new color [ MAX ];
   initColorArray( );
}

void draw( )
{
  prepScreen( );  
  moveBoxes( );   
  drawBoxes( );
}

void initFloatArray( float [ ] farray, float low, float high)
{
  for(int i=0; i<farray.length; i++)
  {
    farray[i] = random(low,high);
  }
}

void initColorArray( )
{
  for(int i=0; i<bcol.length; i++)
  {
    bcol[i] = color(random(255), random(255), random(255));
  }
}

void moveBoxes( )
{
  for(int i=0; i<MAX; i++)
  {
    bx[i] +=  bdx[i];
    by[i] +=  bdy[i];
    if( bx[i] > width - (bwd[i]) ||  bx[i] < 0 )
    {
      bdx[i] = -bdx[i];
    }
    if( by[i] > height - bht[i] || by[i] < 0 )
    {
      bdy[i] = -bdy[i];
    }
  }
}

void drawBoxes( )
{
  for(int i=0; i<MAX; i++)
  {
    fill(bcol[i]);
    rect(bx[i], by[i], bwd[i], bht[i]);
  }
}

void prepScreen( )
{
  fill( #059B3A, 10   );

  rect( 0, 0, width, height ); 
}
