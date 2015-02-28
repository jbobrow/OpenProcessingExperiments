
HashMap tipos = new HashMap();
float ballRadius;

void setup(){
  size( 400, 400 );
  int[][] a = {
        {0,0,0,0,0,0,0,0},
        {0,0,0,1,1,0,0,0},
        {0,0,1,0,0,1,0,0},
        {0,0,0,0,0,1,0,0},
        {0,0,0,1,1,1,0,0},
        {0,0,1,0,0,1,0,0},
        {0,0,1,1,1,0,1,0},
        {0,0,0,0,0,0,0,0}
      };
  tipos.put( "a" , a );
  int[][] b = {
        {0,0,0,0,0,0,0,0},
        {0,0,1,1,1,0,0,0},
        {0,0,1,0,0,1,0,0},
        {0,0,1,1,1,0,0,0},
        {0,0,1,0,0,1,0,0},
        {0,0,1,0,0,1,0,0},
        {0,0,1,1,1,0,0,0},
        {0,0,0,0,0,0,0,0}
      };
  tipos.put( "b" , b );
  int[][] c = {
        {0,0,0,0,0,0,0,0},
        {0,0,0,1,1,0,0,0},
        {0,0,1,0,0,1,0,0},
        {0,0,1,0,0,0,0,0},
        {0,0,1,0,0,0,0,0},
        {0,0,1,0,0,1,0,0},
        {0,0,0,1,1,0,0,0},
        {0,0,0,0,0,0,0,0}
      };
  tipos.put( "c" , c );
  int[][] d = {
        {0,0,0,0,0,0,0,0},
        {0,0,0,0,0,1,0,0},
        {0,0,0,0,0,1,0,0},
        {0,0,0,1,1,1,0,0},
        {0,0,1,0,0,1,0,0},
        {0,0,1,0,0,1,0,0},
        {0,0,0,1,1,0,1,0},
        {0,0,0,0,0,0,0,0}
      };
  tipos.put( "d" , d );
  int[][] e = {
        {0,0,0,0,0,0,0,0},
        {0,0,1,1,1,1,0,0},
        {0,0,1,0,0,0,0,0},
        {0,0,1,1,1,0,0,0},
        {0,0,1,0,0,0,0,0},
        {0,0,1,0,0,0,0,0},
        {0,0,1,1,1,1,0,0},
        {0,0,0,0,0,0,0,0}
      };
  tipos.put( "e" , e );
  int[][] f = {
        {0,0,0,0,0,0,0,0},
        {0,0,1,1,1,1,0,0},
        {0,0,1,0,0,0,0,0},
        {0,0,1,1,1,0,0,0},
        {0,0,1,0,0,0,0,0},
        {0,0,1,0,0,0,0,0},
        {0,0,1,0,0,0,0,0},
        {0,0,0,0,0,0,0,0}
      };
  tipos.put( "f" , f ); 
  int[][] g = {
        {0,0,0,0,0,0,0,0},
        {0,0,0,1,1,0,0,0},
        {0,0,1,0,0,1,0,0},
        {0,1,0,0,0,0,0,0},
        {0,1,0,0,1,1,0,0},
        {0,0,1,0,0,1,0,0},
        {0,0,0,1,1,1,0,0},
        {0,0,0,0,0,0,0,0}
      };
  tipos.put( "g" , g );   
  ballRadius = width/ 8;
  ellipseMode( CORNER );
}

void draw(){
  background(200);
  noStroke();
   int currentGlipho = int( (millis()/1000) % 7);  
   String[] gliphos = { "a", "b", "c", "d", "e", "f" , "g" };
  pushMatrix();
 // translate( 100, 50 );
  int[][] currentLetter = (int[][]) tipos.get( gliphos[currentGlipho] );
  float cDist = 0;
  for( int c = 0; c < 8; c++ ) {
    for( int d = 0; d < 8; d++ ) {
      //print( currentGlipho );
      if( currentLetter[d][c] == 1) {
        fill(255);
      }else{
        fill(0);
      }
      cDist = dist( (c*ballRadius) + (ballRadius /2) , (d*ballRadius) + (ballRadius /2) , mouseX , mouseY );
      ellipse( (c*ballRadius)+ (cDist*0.05) , (d*ballRadius)+ (cDist*0.05)  , ballRadius - (cDist*0.1) , ballRadius - (cDist*0.1) );
    }
  }
  popMatrix();

}
