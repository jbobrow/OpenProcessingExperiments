
//Copyright Colleen Clifford Pittsburgh PA Nov 2013
//Homework #9

float [] diamondsX = new float [ 10 ];
float [] diamondsY = new float [ 10 ];

float x, y, z;

void setup( )
{
   size( 600, 600, P3D );

    initArray (diamondsX, diamondsY, 0, width);
}

void draw()
{ 
  background (255, 0, 255);
  drawFigure( diamondsX, diamondsY, -5);
  
  drawExtras();

}

void initArray(float[] arrayX, float [] arrayY, float min, float max)

{
  for( int i= 0; i < arrayX.length; i++)
 {
   for( int h= 0;  h< arrayY.length; h++)
   {
    arrayX [i] = i* 74;
    arrayY [h] = h* 74;
   }
   
 } 
}

void drawFigure(float [] posX, float [] posY, int z)
{
  directionalLight( 232, 252, 255, 0, 1, -1 );
  
  for (int i = 0; i < posX.length; i++)
  {
   for (int h = 0; h < posY.length; h++)
   {
    pushMatrix();
      translate(posX [i], posY[h], z);
      rotateY (radians (frameCount));
      drawDiamond();
    popMatrix();
   }
  }
  pushMatrix();
   rotateY( radians (frameCount*2));
   directionalLight( 255, 232, 252, -1, -1, 0 );
  popMatrix();
}

void drawExtras()
{
  //textMode (CENTER);
  textSize(18);
  text( "Diamonds are a Girl's Best Friend", width/4, 20, -5);
 
  
 

}

void drawDiamond()
{
  fill(255); 
  stroke (157, 241, 255);
  beginShape(TRIANGLE_FAN);
     vertex (0, 0, 0);
     vertex (5, -15, 10);
     vertex (-5, -15, 10);
     vertex (-10, -15, 0);
     vertex (-5, -15, -10);
     vertex (5, -15, -10);
     vertex (10, -15, 0);
     vertex (5, -15, 10);
     endShape();
     
     beginShape();
     vertex (2.5, -25, 5);
     vertex (5, -25, 0);
     vertex (2.5, -25, -5);
     vertex (-2.5, -25, -5);
     vertex (-5, -25, 0);
     vertex (2.5, -25, 5);
     endShape (CLOSE);
     
     beginShape();
     vertex (2.5, -25, 5);
     vertex (5, -15, 10);
     vertex (10, -15, 0);
     vertex (5, -25, 0);
     endShape(CLOSE);
     beginShape();
     vertex (2.5, -25, 5);
     vertex (5, -15, 10);
     vertex (-5, -15, 10);
     vertex (-2.5, -25, 5);
     endShape(CLOSE);
     beginShape();
     vertex (-2.5, -25, 5);
     vertex (-5, -15, 10);
     vertex (-10, -15, 0);
     vertex (-5, -25, 0);
     endShape(CLOSE);
     beginShape();
     vertex (-5, -25, 0);
     vertex (-10, -15, 0);
     vertex (-5, -15, -10);
     vertex (-2.5, -25, -5);
     endShape(CLOSE);
     beginShape();
     vertex (-2.5, -25, -5);
     vertex (-5, -15, -10); 
     vertex (5, -15, -10);
     vertex (2.5, -25, -5);
     endShape(CLOSE);
     beginShape();
     vertex (2.5, -25, -5);
     vertex (5, -15, -10);
     vertex (10, -15, 0);
     vertex (5, -25, 0);
     endShape(CLOSE);
     beginShape();
     vertex (5, -25, 0);
     vertex (10, -15, 0);
     vertex (5, -15, 10);
     vertex (2.5, -25, 5);
     endShape(CLOSE);
}



