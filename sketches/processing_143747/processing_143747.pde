
//Rachel Ciavarella
//homework 10
//press mouse to reveal red background color
//any key to exit program

String [ ] dataStrings;
float x;
float y;
boolean collision = false;
PImage quake;


void setup( )
{
  quake = loadImage("seismograph.png");
  x = 90;
  y= 300;
  size( 600, 600 );
  noStroke();
background(145,235,26,110);
  dataStrings = 
    loadStrings( "words.txt");
  for ( int i = 0;
      i < dataStrings.length;   
i++)

  {
    String [ ] individualStrings = 
      split( dataStrings[ i ], ' ' );
    println( "Array element [ " +  i +  "]:");
    println( individualStrings );
 }
 }
 
 void words()
 {
    fill(0);
    textSize(20);
  text(dataStrings[0] ,x,y);   
 }


boolean forward= true; 
 void motion()
 {
  if (x > 200)
  {
    forward= false;
  }
  if (x < 0) {
    forward= true;
  }
  if (forward) {
    x += 2;
  }
  else
  {
    x -= 2;
  } 
  y = y + random(-5,5);
 }
 
 void draw()
 {
 background(145,210,26,110);
   motion();
   mousepress();
   words();
   stop();
 }
 
 void mousepress()
 {
  if (mousePressed == true) 
   {
   background(210,50,40);
     image(quake, 0, height/4);
   }
 }
 
  void stop()
 {
  if (keyPressed == true) 
   {
 exit();
   }

 }


