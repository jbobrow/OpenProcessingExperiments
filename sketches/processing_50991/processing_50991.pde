
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

// "Pushing The Matrix" (Part I)
//  - Scaling, Non-Pushed Matrix, Pushed Matrix
//    "'Physically changing the entire coordinating system in processing...'" - Prof. B. Morse
//

void setup()
{
  size(1080,960);
  
   
  
  
}

void draw()
{
// Black background
 background(0); 
  
  //Push Matrix
   //If you push the Marix later on, _you have to pop the matrix..._
  pushMatrix();
  
 
  //translate will now move it to whatever coordinates you place it
  translate(100,100);
  
  // "rotate" will rotate at an angle, starting clockwise....
  rotate(45);
  //If setting without degrees, the default is always in radians
  // Radians Info... via WikiPedia <http://en.wikipedia.org/wiki/Radians>
  
  rect(200,200,200,200);
  
  
  //popping the matrix
  popMatrix();
  
  
  //continued onto next "sketch"
}

