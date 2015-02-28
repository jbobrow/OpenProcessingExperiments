
//Sound of Favicons
//The sketch involves sonifications of a website's favicons.

//The green channel in the pixel data of a favicon image ( fetched by a url )

//For the final, I look forward to having a better visual and auditory experience

//Importing Minim library

import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;

// Declaring global variables for iterator, radius and image

PImage img;
//int i = 0;
//int j = 0;
//float radius 0.0;
int padding = 50;
float side = 0;
int q = 0;
int r = 0;
int s = 0;
// Setup method 
// Initializes minim object, fetches favicon from the url

void setup() {
  size(400,400);
  minim = new Minim(this);
  img = loadImage("http://www.google.com/s2/favicons?domain_url=flickr.com", "png");
  // use the getLineOut method of the Minim object to get an AudioOutput object
  out = minim.getLineOut();
  print(img.width+""+img.height);
  smooth();
  side = (width-padding*2)/img.width;
  frameRate(8);
}

// Draws the ellipse and plays the notes
// The range of frequency is limited to 1244.51 which is D#6

void draw() {
  int p = 0;
  background(0);
  strokeWeight(1);
  stroke(255);
  
  if ( s == img.width*img.height ) {
    s = 0;
  }
  
  if ( q == img.width ) {
    q = 0;
    r++;
  }
  
  if ( r == img.height ) {
    r = 0;
  }
  
  for ( int i = 0; i < img.height; i++ ){
    for ( int j = 0; j < img.width; j++ ){
      fill(img.pixels[p]);
      //rect(i*side,j*side,side,side); //flipped
      //rect(j*side,i*side,side,side); //padding doesn't work
      rect(padding+j*side,padding+i*side,side,side); //upright and padding works 
      p++;
    }
  }
  
  fill(255,0,0);
  strokeWeight(4);
  stroke(255,0,0);
  rect(padding+q*side,padding+r*side,side,side);
 
  out.playNote(0,random(0,1),map(green(img.pixels[s]),0,255,16.35,1244.51));
  /*img.loadPixels();
  if ( i == (img.width*img.height)-1){
    i = 0;
    //noLoop();
  }
  i = i+1;*/
  q++;
  s++;
  println(s);
} 


