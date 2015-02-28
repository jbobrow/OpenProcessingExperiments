


int[] lines = new int[20];
int[] mt = new int[20];
color green, black;
int x,y,dx,dy;


void setup( )
{
  size( 800, 800, P3D );
  camera(width/2.0, -height/2, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, -2000, 0, 1, 0);
  for (int i=0; i<20; i++)
  {
    lines [i] = -4000 + (400* i);
  }
   for (int i=0; i<20; i++)
  {
    mt [i] = (int(random(20)) - 10) * 400;
  }
  
  green = color( 0, 225, 0);
  black = color(0);
  x = width+ (width/4);
  y = 0;
  dx = 0;
  dy =0;
  
  strokeWeight(2);
  noCursor( );
  noFill();
}

void draw( )
{
  background( 0 );
  translate (0,-200,0);
  PrepareWindow( );
  drawVanPt();
  drawLn();
  moveLn();
  

  
 }



void drawVanPt()
{
  stroke (green);
  for (int x=-4000; x<4000; x+=400)
  {
  line(x,0,-4000,x,0,1000);
  
  }
}

void drawLn()
{
  stroke (green);
  line(-6*width,0,-4000,6*width,0,-4000);
  for (int i = 0; i<lines.length; i++)
  {
  line(-6*width,0,lines[i],6*width,0,lines[i]);
  
  }
}

void moveLn ( )
{ 
 
  
   for( int i = 0; i < lines.length; i++)
   {
     arrayMt(lines[i], mt, i);
     
      lines [i] += 4 ;
      if (lines [i] > 400)
      {
        lines[i] = -4000;
         mt [i] = (int(random(20)) - 10) * 400;
   
      }
     
   }
}



void arrayMt( int z, int [] arrayX, int i)
{
  
  //for (int i = 0; i< arrayX.length; i++)
  {
  pushMatrix();
  translate( arrayX[i],0 ,z);
  drawMt(200);
  popMatrix();
  }
  
}

void drawMt(int t)
{
   stroke(0,225,0);
  beginShape(TRIANGLES);
  
 vertex(-t,0,-t);
 vertex( -t,0,t);
 vertex( 0, -t, 0);
  
 vertex( -t,0,t);
 vertex( t, 0,t);
 vertex( 0, -t, 0); 

 vertex( t, 0,-t);
 vertex(t, 0, t);
 vertex( 0, -t, 0);
 
  
 vertex(t, 0,-t);
 vertex(-t,0,-t);
 vertex( 0, -t, 0);
 
 endShape();
}

void PrepareWindow( )
{
  
  translate( width/2, height/2, 0 );

 
}





