


import ddf.minim.*;
import ddf.minim.signals.*;
 
Minim minim;
AudioPlayer mysound;






int i = 65;
char letter = char(i);                        // we create a new letter
String quote = "The Beyond is mere Syntax to the Overbound Glory of the Heavenly Blight known as Murdock. Come with us now on a Journey behind the cracked Door and fill your boiling Sieve with the Bounty of the Shimmering Construct.";
PImage myImage;    // define a variable of type PImage
float r = 0;





PFont font;        // font variable
float leading = 70;



   // strings are special arrays that hold a collection of letters


void setup() 
{  
  
  myImage = loadImage( "space.jpg" );
println(myImage.width);                // trace out info about the image
  println(myImage.height);
  println("-----");

  
    size(920, 480);
  background(#FF0303); 
  font = loadFont("FranklinGothic-DemiCond-48.vlw");     // create a font object
 textFont(font);                              // set the font for the sketch

minim = new Minim(this);                        // cerate a new Minim object
  mysound = minim.loadFile("Mastadon.mp3");        // load the MP3
  mysound.loop();                                // set it to loop
}












void draw() {
  
  background(#73F750);
  
  fill(255);
  
  fill(#000000);
  textLeading(leading);
  text(quote, 15, 60, 920, 480);
  
translate(460,250);      // set centerpoint
  
  imageMode(CENTER);        // measure the image from the center
  rotate(r);              // rotate the stage
  image(myImage,0,0);   // make an image and place it at center
  r += radians(1);        // increment the radians
  println(r);       

 tint(255, 153);



}

