
//Stephanie Park
//Homework9
//Screensaver

int num = 100;
float [] arrayX = new float [num];
float [] arrayY = new float [num];
float [] arrayZ = new float [num];
float [] arrayD = new float [num];
float [] arrayR = new float [num];
float [] deltaX = new float [num];

void setup ()
{
  size (600,600,P3D);
  noStroke ();
  lights();
  directionalLight(100, 100, 200, 0, height, width);
  for(int i=0; i<num; i++)
    {
      arrayX[i]=random(-width, width*2);
      arrayY[i]=random(0,height*1.2);
      arrayZ[i]=random(-height*2,height);
      arrayD[i]=random (20, 80);
      arrayR[i]=random (0);
    }
   for(int i=0; i<deltaX.length; i++)
   {
     deltaX[i] = random (10, 40);
   }
   
    frameRate(8);
}


void draw ()
{
    background (0);
  face ( arrayX, arrayY, arrayZ, arrayD, arrayR);
  moveFace ();
}

void face ( float [] x, float [] y, float [] z, float [] d, float [] r )
{

  for ( int i=0; i<num; i++ )
  {
    pushMatrix ();
    ellipseMode (CORNER);
    translate ( x[i], y[i], z[i] );
    rotateY(radians(r[i]));
    fill ( 246, 255, 121 ); 
    noStroke ();
    ellipse ( 0, 0, d[i], d[i]);
    fill (0);
    ellipse ( d[i]*.25, d[i]*.3, d[i]/7, d[i]/7);
    ellipse ( d[i]*.6, d[i]*.3, d[i]/7, d[i]/7);
    noFill ();
    stroke (1);
    
    
    if (arrayX[i]> width/2)
    arc ( d[i]*.25, d[i]*.35, d[i]/2, d[i]/2, 0, PI);
    else
    arc ( d[i]*.25, d[i]*.5, d[i]/2, d[i]/2, PI, TWO_PI);
         
    popMatrix ();
  }
}

void moveFace ()
{
   for( int i = 0; i < arrayX.length; i++)
   {
     arrayX[i] += deltaX[i];
      
     if (arrayX[i] >= width*2 || arrayX[i] <= -width*2 )
     {
     deltaX[i] = - deltaX[i];
     }
   }
}





