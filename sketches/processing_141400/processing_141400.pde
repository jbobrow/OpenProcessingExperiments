
 //Homework 9
//Copyright Miranda Jacoby 2013 All Rights Reserved
//INSTRUCTIONS: Press A to swap out the animal's front, press S to swap out the animal's back.

String str;
String [ ] arrayOfStr1 = { "Li", "Pi", "Sal", "Pom", "Chi" };
String [ ] arrayOfStr2 = { "on", "g", "mon", "eranian", "cken" };
int stringCount1;
int stringCount2;

PImage pic1;
PImage pic2;
PImage[ ] picArray1;
PImage[ ] picArray2;
int picCount1;
int picCount2;
int B;
int F;

PFont f;



void setup( )
{
  size( 600, 500 );
  //frameRate(1);
  f = createFont("Arial",16,true);
  fill( 0 );
  //textFont( f, 36 );
  textAlign( CENTER, CENTER );
  smooth();
  imageMode( CENTER );
  
  picArray1    = new PImage[ 5 ];
  initImageArray1( picArray1 );
  
  picArray2    = new PImage[ 5 ];
  initImageArray2( picArray2 );
  
//  loadImage("front0.png");
//  loadImage("front1.png");
 // loadImage("front2.png");
 /// loadImage("front3.png");
///  loadImage("front4.png");
///  loadImage("back0.png");
/////  loadImage("back1.png");
 // loadImage("back2.png");
//  loadImage("back3.png");
//  loadImage("back4.png");
  //arrayOfStr1    = new String[ 5 ];
  //stringOutput( arrayOfStr1 );
  
  //arrayOfStr2    = new String[ 5 ];
  //stringOutput( arrayOfStr2 );
  //initImageArray1( picArray1 );
 // initImageArray2( picArray2 );
  //stringOutput( arrayOfStr1 );
  //stringOutput( arrayOfStr2 );
  //imagePositions();
   //stringOutput();
}

void draw()
{
  background( 255 );
  picCount1 = stringCount1;
  picCount2 = stringCount2; 
  //imagePositions();
   //stringOutput();
  textFont( f, 36 );
  text( arrayOfStr1[F] + arrayOfStr2[B], width/2, height/7);
  image(picArray2[B], width/2.1, height/2);
  image(picArray1[F], width/2.1, height/2);
  textFont( f, 14 );
  text("Press A to swap out the animal's front, press S to swap out the animal's back.", width/2, height/20 ); 
}

//void stringOutput ()


//{ for(int F = 0; F < arrayOfStr1.length; F+=1)
//  {
// text( arrayOfStr1[F] + arrayOfStr2[B], width/2, height/8);
//  }
//}


void  initImageArray1( PImage [ ] picArray1 )
{
  for(int F = 0; F < picArray1.length; F+=1)
  {
    String imageName = "front" + F + ".png" ;
    picArray1[F] = loadImage( imageName );
  }
}

void  initImageArray2( PImage [ ] picArray2 )
{
  for(int B = 0; B < picArray2.length; B+=1)
  {
    String imageName = "back" + B + ".png" ;
    picArray2[B] = loadImage( imageName );
  }
}

//void imagePositions ()

//{
//  for(int F = 0; F < picArray1.length; F+=1)
//  {
//  image(picArray2[B], width/2.1, height/2);
//  image(picArray1[F], width/2.1, height/2);
  
//  }
//}


void keyPressed ()
{
  if (key == 'a' || key == 'A')
  {
    F++; 
    //picCount1++;

     
     if (F >= picArray1.length)
     {
        F = 0; 
   }
  }  
 if (key == 's' || key == 'S')
  {
    B++;
     //picCount2++;
    
  if (B >= picArray2.length)
   {
     B = 0; 
   }
  }
  
}


