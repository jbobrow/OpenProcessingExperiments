
int max_left_deep = 12, max_right_deep = 12, max_deep = 12;
color bc = color( 160, 82, 45 );
color ec = color( 0, 255, 0 );
int prod = 60; //productivity

int branchLeft = 100, branchRight = 100;



int deep = 0;
float angL = PI/5, angR = PI/4;

void setup() {
  size( 800, 600 );
  strokeWeight( 6 );
  frameRate( 50 );
}

void keyPressed() {

  switch( key ) {
    case 'q': branchLeft += 5; break;
    case 'a': branchLeft -= 5; break;
    case 'w': branchRight += 5; break;
    case 's': branchRight -= 5; break;
    
  }

  branchLeft = constrain( branchLeft, 5, 100 );
  branchRight = constrain( branchRight, 5, 100 );
}

void draw() {
  //int st = millis(); // 160
  background( 0 );
  float tl =map( mouseX, 0, width, 0, PI ), tr =map( mouseY, 0, height, 0, PI ); 
  angL += (tl - angL)/5; 
  angR += (tr - angR)/5; 


  float grL = map( angL, 0, PI, 0, 180 ), grR = map( angR, 0, PI, 0, 180 );
  //println( grL, grR );

  //stroke( 0 );
  draw_branch( width / 2, height - 100, -HALF_PI, 1.0 );

}

/// Ñ�Ð¸Ñ�Ñ�ÐµÐ¼ Ñ�Ð°Ñ�Ñ�Ñ� Ð²ÐµÑ�ÐºÐ¸
/// 
void draw_part() {
  // 0, 255, 0
  // 160, 82, 45
  stroke( color( 
  map( deep, 0, max_deep, red(bc), red(ec) ), 
  map( deep, 0, max_deep, green(bc), green(ec) ), 
  map( deep, 0, max_deep, blue(bc), blue(ec) )
    ) );    


  line( 0, 0, 100, 0 );
}

/// Ñ�Ð¸Ñ�Ñ�ÐµÐ¼ Ð²ÐµÑ�ÐºÑ� Ð¸Ð· Ñ�Ð°Ñ�Ñ�ÐµÐ¹
void draw_branch( int originX, int originY, float ang, float scal ) {
  deep++;

  pushMatrix();
  translate( originX, originY );
  rotate( ang );
  scale( scal );

  draw_part();

  if ( deep < max_left_deep ) 
    draw_branch( branchLeft, 0, -angL, 0.8 );



  translate( 100, 0 );
  scale( 0.8 );
  rotate( PI / 12 );
  draw_part();

  if ( deep < max_right_deep ) 
    draw_branch( branchRight, 0, angR, 0.8 );


  translate( 100, 0 );
  rotate( -PI / 12 );
  scale( 0.8 );
  //draw_part();
/*
  if ( deep == max_deep-1 && random( 100 ) < prod ) { // last depth
    //apple
    noStroke();
    fill( #FFA500 );
    ellipse( 100, 0, 100, 100 );
  }*/

  popMatrix();
  deep--;
}

