
//COPYRIGHT FARYAL KHALID
//CMU SPRING 2014 PROCESSING
// THIS IS A JOURNEY INTO THE TUMBLING MEMORIES OF A GREAT DAY SPENT WITH FRIENDS AND BALLOONS
//HIT THE SPACE BAR TO EXPERIENCE AS THEY DULL WITH TIME
//HIT THE 'S' KEY TO REFRESH THEM ONCE AGAIN
//ENJOY THE EXPERIENCE


final int MAX = 9;
String [] inputString = {"Memories!", "Balloons", "Friends", "Picnic", "Joy!","Memories!", "Balloons", "Friends", "Picnic"};
 
float [ ] xVals  = { 381, 72, 100, 150, 200, 250, 400, 250, 350 };
float [ ] yVals  = { 60,  140, 220,  355,  380, 40, 275,  175, 500 };
float x;
float y;
float t;
float easing = 0.05;
PImage pic;
PImage[ ] picArray;
PImage forefront;


 
void setup( )
{
  size( 500, 400,P3D);
  frameRate( 24 );

   
  imageMode( CENTER );
  forefront = loadImage ("christine.png");
  picArray = new PImage [ MAX];
  initImageArray( picArray );
  t=0;
}
 
void draw( )
{
  background( 255  );
  showImages( );
   mouseforefront();
   keyPressed();
}
void mouseforefront(){
  imageMode(CENTER);
  float targetX = mouseX;
  float targetY = mouseY;
  x += (targetX - x) * easing;
  y += ((targetY - y) * easing) - 0.5;
  noStroke();
  fill(255,80);
  rectMode(CORNER);
  rect(0,220,width,200);
  image(forefront,width/2,height-80,200,200);
   
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
    fill(0);
    
    textSize(20);
    
    text(inputString[i],xVals[i] -40, yVals[i]+60);
    
   
  
  }
}
 
void  initImageArray( PImage [ ] picArray )
{
  for(int i = 0; i < picArray.length; i++)
  {
    String imageName = "image" + i + ".png" ;
    picArray[i] = loadImage(imageName );
     
  }
}

void keyPressed()
{
  if (key == ' ')
  {
    background(100,100,97);
    showImages();
    mouseforefront();
  }
  
  if (key == 's')
  {
    showImages();
    mouseforefront();
  }
}





