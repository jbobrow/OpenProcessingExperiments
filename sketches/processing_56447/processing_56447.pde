
//
//  start with clean circle
//  LSystems - http://en.wikipedia.org/wiki/L-system
//
//  * USE FAT STROKEWEIGHT FOR BOARD ART

Boolean isFinal = true;

float alf = 3;

int centerX;
int centerY;


int xx = 0;
int yy = 0;

int outerXX = 0;
int outerYY = 0;

float angle = 0;
float maxAngle;
float radius = 4;
float outerRadius = 32;  //50;

int offsetX = 0;
int offsetY = 0;

//  fibonacci numbers
int[] fibNums = { 
  1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987
};
int fibCt = 0;


color[] palette = { 
#A59DA1,#D96D55,#F36613,#A9ABEA,#D23301,#F6FAFD,#AB6E9C,#D6F9FF,#F8751E,#900A00,#F05510,#FFEE51,#FFB02A,#D7D5FA,
#EF0000, #EFEF11, #36EF75, #EF7535, #FF1234, #EF3619
};
// 

////////////////////////////////////////////////////
//
void setup() {
  // size to match image
  size(1440, 900);
  background(6);

  //  -------------------------------------------

  smooth();
  noFill();


  centerX = int( this.width / 2 );
  centerY = int( this.height / 2 );


  offsetX = centerX;///2;
  offsetY = centerY;///2;

  //  max angle = where does the circle stop?
  maxAngle = (360*20);  // 15


  //  scan lines
  stroke( #EF7519, pow(alf, 3));

  strokeWeight(2);
  for ( int ll = 0; ll <= height; ll += random(3) ) 
  {  
    randStrokeUser();
    line( 0, ll, width, ll );
  }
  strokeWeight(22);
}


////////////////////////////////////////////////////
//
void draw()
{
  smooth();
  noFill();

  //  CIRCLE ACTION
  xx = ( offsetX - int( sin(radians(angle)) * radius ) );
  yy = ( offsetY - int( cos(radians(angle)) * radius ) );

  outerXX = ( offsetX - int( sin(radians(angle)) * outerRadius ) );
  outerYY = ( offsetY - int( cos(radians(angle)) * outerRadius ) );
  
  strokeWeight(random(25));
  
randStroke();
//  stroke(#EFEF11, 11);
  line( xx, yy, outerXX, outerYY );//fibNums[ fibCt ], fibNums[ fibCt ]);
  //  randStrokeUser();
  stroke(19, 90);
  line( lerp(xx, outerXX, random(1.0) ), lerp(yy, outerYY, random(1.0) ), xx, yy );


  strokeWeight( fibNums[ (int)random( fibNums.length-1) ] );
  noFill();
  randStrokeUser();
  point( lerp(xx, outerXX, random(.5) ), lerp(yy, outerYY, random(.5) ) );

//  randStrokeUser();
//  point( lerp(xx, outerXX, .1 ), lerp(yy, outerYY, 1 ) );

  strokeWeight(random(25));
  hexagon(  lerp(xx, outerXX, random(.95) ), lerp(yy, outerYY, random(.95) ), radius );

  angle += 6;

  //  90
  if ( angle % 45 == 0 ) {
    radius += 3;
    outerRadius--;
  }

  if ( angle >= maxAngle )
  {    

    
  strokeWeight(2);
  for ( int ll = 0; ll <= height; ll += random(4) ) 
  {  
    randStrokeUser();
    line( 0, ll, width, ll );
  }
    
    
    exit();
  }
}




//////////////////////////////////////////////////////////////////////////
//  HEXAGON inspired by http://www.rdwarf.com/lerickson/hex/index.html
void hexagon( float startX, float startY, float shapeSize ) {

  line( startX, startY+(shapeSize*.5), startX+(shapeSize*.25), startY );
  line( startX+(shapeSize*.25), startY, startX+(shapeSize*.75), startY );
  line( startX+(shapeSize*.75), startY, startX+(shapeSize), startY+(shapeSize*.5) );

  line( startX+(shapeSize), startY+(shapeSize*.5), startX+(shapeSize*.75), startY+shapeSize );
  line( startX+(shapeSize*.75), startY+shapeSize, startX+(shapeSize*.25), startY+shapeSize );
  line( startX+(shapeSize*.25), startY+shapeSize, startX, startY+(shapeSize*.5) );
}




///////////////////////////////////////////////////////////
//  
//  End handler, saves png to ../OUTPUT
void exit() 
{

  artDaily("ARTDAILY "+getEpoch() );

  //  if final, save output to png
  if ( isFinal )
  {
    save( "../OUTPUT/"+ this + "-" + getEpoch()+".png" );
  }

  super.stop();
}

///////////////////////////////////////////////////////////
//  Helper to random(255) stroke
void randFill() {  
  fill( random(255), random(255), random(255), alf );
}
void randStroke() {  
  stroke( random(255), random(255), random(255), alf );
}
void randStroke100() {  
  stroke( random(255), random(255), random(255), 100 );
}

////////////////////////////////////////////////////
//  Randomly stroke using image from color list
void randStrokeUser()
{
  // pallete
  stroke( palette[ int(random( palette.length-1 )) ], alf );
}
void randFillUser()
{
  fill( palette[ int(random( palette.length-1 )) ], alf );
}

///////////////////////////////////////////////////////////
//  get EPOCH timestamp
long getEpoch() {
  return new Date().getTime()/1000;
}

///////////////////////////////////////////////////////////
//
//  Spit out ART DAILY message
void artDaily( String dailyMsg ) {

  PFont font = createFont( "American Typewriter", 18 );

  smooth();
  textFont( font );
  strokeWeight(1);

  //  fill( #000000 , 666 );
  fill(#EFEFEF, pow(alf, 3) );
  text( " "+dailyMsg, this.width-225, this.height-15);

  //  fill( #003600 , 666 );
  fill(#CADDAC, pow(alf, 3) );
  text( " "+dailyMsg, this.width-226, this.height-16);
}



