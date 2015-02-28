
//Charlotte Stiles cc 2014
//cstiles
//HW#9


final int MAX = 9;
String [] inputString = {"Hello!", "Good Morning!", "Joy!", "Hello, Lovely weather!", "Welcome!","Greetings!","How's it Going?","Hello There!","Kisses!"};

float [ ] xVals  = { 381, 72, 100, 150, 200, 250, 400, 250, 350 };
float [ ] yVals  = { 60,  140, 220,  355,  380, 40, 275,  175, 500 };
float x;
float y;
float t;
float easing = 0.02;
PImage pic;
PImage[ ] picArray;
PImage character;
boolean blackout = false;
boolean skullOn = false;

void setup( )
{
  size( 500, 700,P3D);
  frameRate( 24 );
  
  imageMode( CENTER );
  character = loadImage ("skull.png");
  picArray = new PImage [ MAX];
  initImageArray( picArray );
  t=0;
}

void draw( )
{
  background( 0  );
  showImages( );
   mousecharacter();
}
void mousecharacter(){
  imageMode(CENTER);
  float targetX = mouseX;
  float targetY = mouseY;
  x += (targetX - x) * easing;
  y += ((targetY - y) * easing) - 0.5;
  image(character,x,y,80,100);
  
}
void showImages ( )
{
  for( int i = 0; i < picArray.length; i++)
  {
    pushMatrix( );
      translate( xVals[ i ], yVals[ i ]);
      rotateZ(radians(frameCount));
      image( picArray[i], 0, 0, 100, 100 );
      t=t+0.01;
      xVals[i] = xVals[i] + noise(t) * random(-1,1);
      yVals[i] += i*.2 + .5;
      
      if ( yVals[ i ] > width + 100 )
      {
          yVals[ i ] = -100 ; 
      }
    popMatrix( );
    fill(255);
    text(inputString[i],xVals[i] -40, yVals[i]+60);
  
  if(dist(x,y, xVals[i],yVals[i])< 90 )
  {
    fill(0);
    noStroke();
    ellipseMode(CENTER);
    ellipse(xVals[i], yVals[i],125,135);
    fill(255,0,0);
    text("OUCH!",xVals[i] -40, yVals[i]+60);
  }

  }
}



void  initImageArray( PImage [ ] picArray )
{
  for(int i = 0; i < picArray.length; i++)
  {
    String imageName = "pic" + i + ".png" ;
    picArray[i] = loadImage(imageName );
    
  }
}


