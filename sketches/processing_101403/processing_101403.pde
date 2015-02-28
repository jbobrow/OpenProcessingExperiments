
Followers[] Follow = new Followers[ 75 ];


////////////////////

color[] mycolors = { 
#129CEA,#A42B5C,#E12975,#D5BBC6,#56A4D1,#F58C18,#B34973,#E14984,#9399AC,#914E69,#52666C,#6B5466,#EB7212,#F1DDEE,#D9DDEF,#D395AD,#F2D017,#231010,#222211,#891834,#975C25,#102227,#A86D7E,#99AA98,#111114,#BBCCC3,#82444F,#2782BB,#906D53,#77887F,#281022,#DDEEDC,#70C3E9,#F682B4,#E42C26,#E8B0C0,#B97C4E,#AA9130,#F5BF8D,#B4434A,#334433,#556655,#112211,#F37990,#1DBCF9
};

//color[] mycolors = {
  //#000000,#ff0000,#ffffff
//};
///////////////////


void setup() {
  frameRate( 10 );
  
  size( 940, 710 );

  for (int i = 0; i < Follow.length; i++) {
    Follow[i] = new Followers();
  }


  smooth();
}



void draw() {
  noStroke();
  fill( 255, 75 );
  rect( 0, 0, width, height );

  //fill(colorful);

  for ( int i = 0; i < Follow.length; i++ ) {  

    Follow[i].update();
    Follow[i].display();
    Follow[i].borderless();
  }
  
  
  noCursor();
}


class Followers {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector mouse;
  float howBig;
  float howFar;
  float howFast;

  Followers() {
    location = new PVector( noise(width), noise(height) );
    velocity = new PVector( 0, 0 );
    howBig = random( 57 );
    howFast = random( 10,25 );
    howFar = .7;
  }

  void update() {
    mouse = new PVector( mouseX, mouseY );
    acceleration = PVector.sub( mouse, location );
    acceleration.normalize();
    acceleration.mult( howFar );

    velocity.add( acceleration );
    velocity.limit( howFast );
    location.add( velocity );
  }

  void display() {

    color colorful = mycolors [ int ( random ( mycolors.length ) ) ];

    strokeWeight( random( 7 ) );
    stroke( colorful, 200 );
    fill ( 0, 225 );

    line( location.x, location.y, pmouseX+(random( -150,150 )), pmouseY+(random( -150,150 )) );
  }

  void borderless() {
    if ( location.x > width ) location.x *= -1;
    if ( location.x < 0 ) location.x *= -1;
    if ( location.y > height ) location.y *= -1;
    if ( location.y < 0 ) location.y *= -1;
  }
}

void keyPressed() {
 
  if (key == 's') {
    save("image-"+frameCount+".jpg");
  }
  
}
