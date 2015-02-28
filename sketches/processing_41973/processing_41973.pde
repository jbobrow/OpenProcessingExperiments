
//Homework_9
//copyright Maitri Shah, Pittsburgh, PA

color colOpaque, colTrans;

void setup ( )
{
 size(400, 400, P3D ) ;
 noStroke( );
 colOpaque = color(127, 127, 127);
 colTrans = color (200, 0, 0, 150);
}

void draw ( )
{
  translate(width/2, height/2, 0);
  //lights( );  
  //ambientLight(102, 102, 102);
  
  pushMatrix( );
   translate(-100, -100, -100);
   fill( colOpaque );
   pointLight(200, 200, 0, 175, 175, 100);
   sphere( 75 );
   fill(255);
   rectMode( CENTER ) ;
   rect(0, 0, 200, 200);
  popMatrix( );
 
  pushMatrix( );
   translate(25,25,50);
   fill(colOpaque);
   directionalLight( 255, 255, 255, 1 , -1 , 0);
   //pointLight(50, 150, 50, -175, -175, 100);
   sphere( 75 );
  popMatrix( );
  
  pushMatrix( );
    translate(50, 50, 50);
    fill(colTrans);
    specular( 200, 0, 0);
    spotLight (51, 102, 126, 80, 20, 40, -1, 0, 0, PI/2, 5) ;
    sphere( 75 );
    fill(255);
    rectMode( CENTER ) ;
    rect(0, 0, 200, 200);
   popMatrix( );
 
 noLoop( );
   
}

