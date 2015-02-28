
int counter, depth = 0, max_depth = 2;
float cx = 50, cy = -33, ncx = cx, ncy = cy;

int originX = 0, originY;
float scaleX, scaleY; 

void setup() {  //setup function called initially, only once
  println( "setup" );
  size( 500, 500 );
  
  originY = 2*height/3;
  scaleX = width / 100;
  scaleY = scaleX; 
  
  //background(255);  //set background white
  // colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode

  counter = 0;
}

void keyPressed() {
  if ( keyCode == UP ) {
    max_depth ++;
  }  

  if ( keyCode == DOWN ) {
    max_depth --;
  }

  max_depth = constrain( max_depth, 1, 10 );
}

void draw() {  //draw function loops 
  background(127);
  stroke( 0 );
  text( frameRate, 20, 20 );
  text( max_depth, 80, 20 );
  draw_line( 0, 2*height/3, width, 2*height/3);
  
  if( cx != ncx ) {
    cx += ( ncx - cx ) /10 ;
  }
  
  if( cy != ncy ) {
    cy += ( ncy - cy ) /10 ;
  }
}

void mouseClicked() {
 
 ncx = (mouseX - originX) / scaleX; 
 ncy = (mouseY - originY) / scaleY;
 //println( mouseX, mouseY, ncx, ncy );
  
  
}

void draw_line( int fx, int fy, int tx, int ty) {

  depth++;
  
  if ( depth > max_depth ) {
    line( fx, fy, tx, ty );
    depth --;
    return;
  }

  pushMatrix();
  translate( fx, fy );
  scale( dist( fx, fy, tx, ty ) / 100 );

  float rot = 0;
  
  if ( tx-fx != 0 ) {
    //if(depth == 2 )println( degrees( atan2(  ty, tx ) ) );
    if(depth == 2 )println( tx-fx, degrees( atan( (float)(ty-fy) / (tx-fx) ) ) );
    rot = atan( (float)(ty-fy) / (tx-fx) );
    
    if (tx<fx) rot -= PI;
    //rotate( atan2(  ty, tx ) );
  } 
  else { // atan( +inf ) = pi/2
    rot = ( ty>fy ? +1 : -1 ) * HALF_PI;
  }
  
  rotate( rot );

  draw_line( 0, 0, 33, 0 );
  draw_line( 33, 0, (int)cx, (int)cy );

  draw_line( (int)cx, (int)cy, 66, 0 );
  draw_line( 66, 0, 100, 0);

popMatrix();
depth--;
}
