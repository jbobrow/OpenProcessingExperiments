
PImage img_1;
PImage curs;
PImage img_3;
PImage img_4;
float valueR = 0;
float valueG = 0;
float valueB = 0;

float pullY = mouseY +400;

void setup() {
  size( 400, 400 );


  img_1 = loadImage( "Essen_1.jpg" );
  curs  = loadImage( "cursor.png" );
  img_3 = loadImage( "Essen_3.jpg" );
  img_4 = loadImage( "Essen_4.jpg" );

  noCursor();
}


void draw() {
  background( 255 );

  tint( valueR, valueG, valueB );
  image( img_3, 0, 0, height, width ); // background

  noTint();

  if ( mouseY < 100 && mousePressed == true ) { //image nur bei y=100 klickbar

    image( img_1, 0, 0, 200, pullY );
    //imageMode(CENTER);
    image( img_4, 200, 0, mouseX, height );
  } 
  else { // bei mouse NOT-klicked & y < 100
    image( img_1, 0, 0, 100, 100 );
    image( img_4, 200, 0, 100, 100 );
  }


  image( curs, mouseX, mouseY, 30, 30 );
}


void mouseMoved() { //color
  valueR = random(255);
  valueB = random(255);
  valueG = random(255);

  //println( img_3.get( mouseX, mouseY ) );

  /*if ( valueR > 255 || valueB > 255 || valueG > 255 ) {
   valueR = 0 + 2;
   valueG = 0 + 5;
   valueB = 0 + 3;
   
   }*/
}


