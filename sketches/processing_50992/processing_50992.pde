
// Code Written By: Chukwudi T. Unonu
// Date: 02/02/2012
// ARTT489i - Advanced Digital Imaging
// Instructor: Prof. Brandon Morse
// University of Maryland, College Park, MD
//
// Made With: Apple MAC OSX 10.5.8
// Processor 3.06 GHz Intel Core Duo
// Memory 4 GB 1067 MHZ DDR3
//

// "Pushing The Matrix" (Part II) (Continued sketch")


void setup()
{
  size(1080,840);
    
  
  
}

void draw()
{
// Black background
 background(0); 
  
  //Push Matrix
  //If you push the Marixlater on, you have to pop the matrix...
  pushMatrix();
  
 
  //translat will now move it to whatever coordinates you place it
  translate(500,500);
  rectMode(CENTER);
  // Radians Info... via WikiPedia <http://en.wikipedia.org/wiki/Radians>
  rotate( radians (mouseX) );
  fill(255,255,255);
  rect(0,0,200,200);
 
  //"'you can run push-pop Matrix as many times as you want, provided you pop back out at some point...'" - Prof. Brandon Morse  
  translate(100,100);
  rectMode(CENTER);
  rotate( radians (-mouseX) );
  fill(200,255,200);
  rect(0,0,175,175);
  
  translate(150,150);
  rectMode(CENTER);
  rotate( radians (-mouseX) );
  fill(145,255,145);
  rect(0,0,150,150);
  
  translate(200,200);
  rectMode(CENTER);
  rotate( radians (-mouseX) );
  fill(80,255,80);
  rect(0,0,125,125);
  
  translate(250,250);
  rectMode(CENTER);
  rotate( radians (-mouseX) );
  fill(25,255,25);
  rect(0,0,100,100);
  
  //The above is like a "tail"
  // Instructor was suprisingly/shocking impressed by the above example when run! :-)
  //Order of operations is "backwars according to a fellow class peer"
  
  //"'Remember: Anything that turns blue is a built in variable!'" - Prof. Brandon Morse
  
  //popping the matrix
  popMatrix();
  
  

}

