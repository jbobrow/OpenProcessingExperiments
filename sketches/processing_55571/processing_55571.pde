
//  Three suns made of ellipses
//  Rustic-ish backdop
//  * This one takes a bit to draw, then appears

final int SKETCH_HEIGHT  = 1440;
final int SKETCH_WIDTH   = 900;


Boolean isFinal = false;
float alf = 5;

int centerX;
int centerY;

int shapeSize = 30;  //50;

// circles
int cirXX;
int cirYY;
int startX = 0;
int startY = 0;
float angle      = 0; 
float radius     = 20;//  50;  //100;
int cc = 0;

int maxCC = 0;


////////////////////////////////////////////////////
color[] palette = { #EF0000, #00EF00, #0000EF, #CECE00, #FA9000, #EF1975, #007007, #EFEF00, #FA9187, #007007, #109109 };
color[] p2 = {#EF0000, #00EF00, #0000EF, #CECE00, #FA9000, #EF1975, #007007, #EFEF00, #FA9187, #007007, #109109, #FEFEFC,#89776E,#ECE9E8,#AA9991,#322D2B,#DBD7D8,#D2C7BA,#B2A699,#CAC7C7,#D8CDC9,#BAB6B7,#C9BDB9,#918678,#E9DED9,#EEE7DD,#AAA6A7,#B8ACA8,#999596,#DFDC6A,#888584,#787574,#6A6456,#665854,#4D4337,#686564,#575453,#978B87,#F7EFEA,#474443,#DCD6CC,#423833,#766A65,#C8B5AE,#F8F7F3,#554946,#BBB6AA,#C6B192,#E8D6CF,#787368,#9A9489,#A98A79,#CEA070,#565348,#F8F785,#DDDEE1,#D2CB92,#BBBDC1,#B4AE73,#CDCED2,#100B0B,#E7D0B5,#ABADB1,#9B9CA0,#EEEFF1,#C7BDC6,#EFEEB6,#8F8754,#BDC6CB,#DEE7EA,#B3AE52,#8B8C8F,#C7ACA6,#9BA5AA,#A79C9E,#CED6DB,#D7CED6,#7A7B7E,#29211F,#7A8589,#D4BBAB,#B6ADB6,#D7BDB7,#595A5D,#ADB5BA,#958C95,#6A6B6E,#867B7D,#211715,#C49789,#EFF7F8,#494A4D,#8B9499,#645A63,#E7DEE7,#7F8474,#746B74,#E9B48E,#5A6467,#596357,#E8CDC7,#443942,#6A7476,#E4D897,#534A52,#6A7369,#8F5544,#37363A,#F8DBC9,#BF785E,#EABDA7,#C4C6B0,#4A5248,#394245,#A2A03F,#A2985A,#4A5355,#E0E7D3,#A4A59A,#8B948A,#F7EFF7,#ACB5A8,#414239,#FBE2DA,#211821,#CED6CA,#7E3827,#D9AB9D,#EFF7EE,#212223,#C26642,#C7C468,#CAABBA,#18181B,#D0CA4A,#E39E80,#182117,#E6E588,#A2A075 };




////////////////////////////////////////////////////
//
void setup() {

  // setup core sketch settings items
//  size(SKETCH_HEIGHT, SKETCH_WIDTH );  // Default = JAVA2D
size(SKETCH_HEIGHT, SKETCH_WIDTH, P2D );
//  size(SKETCH_HEIGHT, SKETCH_WIDTH, P3D );
//  size(SKETCH_HEIGHT, SKETCH_WIDTH, OPENGL );
//  size(SKETCH_HEIGHT, SKETCH_WIDTH, PDF );

  background(1);

  //  setup variables
  centerX = width/2;
  centerY = height/2;

  startX = centerX;
  startY = centerY;

  maxCC = width*10;  //7;
}

float xx = 0;
float yy = centerY;


////////////////////////////////////////////////////
//
void draw()
{  
  
  while( cc <= maxCC )
  {

    noFill();
    smooth();
    
    cirXX = startX - int( cos(radians(angle)) * radius );
    cirYY = startY - int( sin(radians(angle)) * radius );

    randStrokeUser();
    strokeWeight( random(shapeSize) );  
    hexagon( xx, yy, shapeSize );

    strokeWeight( random(shapeSize) );
    randStrokeUser();
    point( random(xx), random(yy) );//, shapeSize );

    randStrokeUser();
    strokeWeight(1);
    point( xx, cirXX);

    randStrokeUser();
    strokeWeight(2);
    line(cirYY-radius, xx, yy-radius, cirXX);

    strokeWeight(.25);
    randStrokeUser();
    line(cirYY+centerX, cirXX, yy+centerX, xx);

    randStrokeUser();
    strokeWeight(.75);
    line(cirYY-radius, cirXX, xx, yy);

    //  THE CENTER --------------


    if( cc > ( maxCC *.7 ) ) {
      
      strokeWeight(.75);
      randStrokeUser();
      line( cirXX, cirYY, xx, yy );

      strokeWeight(1.5);
      stroke(#CAEF75, alf*1.5);  // CADDAC

    } else {
      
      strokeWeight(.75);      
      stroke(#EFEFEF, alf*2);  // 75EF19
    }

    if( cc < (width*8) ) {
      // left small
      ellipse( cirXX-(centerX*.5), cirYY, shapeSize, shapeSize );
      //  right small
      ellipse( cirXX+(centerX*.5), cirYY, shapeSize, shapeSize );     
    }

     // big middle
    ellipse( cirXX, cirYY, shapeSize*2, shapeSize*2 );

    if( cc % 5 == 0) {
      ellipse( cirXX, cirYY, shapeSize, shapeSize );  
    } else {
      randStrokeUser();  
    }
    //  THE CENTER --------------

    if( xx >= width )
    {
      xx = -shapeSize;
      yy += shapeSize;
      radius++;
    } else {
      xx += shapeSize*.5;
    }

    angle += 15;  //15;//4;
    cc += 1.5;
  }


  exit();  

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
  stroke( p2[ int(random( palette.length-1 )) ] , alf );
}
void randFillUser()
{
  fill( palette[ int(random( palette.length-1 )) ] , alf );
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
  fill(#EFEFEF, pow(alf,3) );
  text( " "+dailyMsg, this.width-225, this.height-15);
  
//  fill( #003600 , 666 );
  fill(#CADDAC, pow(alf,3) );
  text( " "+dailyMsg, this.width-226, this.height-16);
}


