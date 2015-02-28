
//  Title: Moire Pattern - Semishape
//  Description: Two antisymettric shapes rotating in opposite directions to create moire-like interference patterns.
//  Date Started: 09 Feb 2012
//  Last Modified: 11 Feb 2012
//  http://asymptoticdesign.wordpress.com/
//  This work is licensed under a Creative Commons 3.0 License.
//  (Attribution - NonCommerical - ShareAlike)
//  http://creativecommons.org/licenses/by-nc-sa/3.0/
//  
//  In summary, you are free to copy, distribute, edit, and remix the work.
//  Under the conditions that you attribute the work to me, it is for
//  noncommercial purposes, and if you build upon this work or otherwise alter
//  it, you may only distribute the resulting work under this license.
//
//  Of course, the conditions may be waived with permission from the author.

//-----------------Globals
float counter;
PImage img;
PImage img2;


//-----------------Setup
void setup()
{
  //initialize a counter; this tells us how far we should rotate the image at each step
  counter = 0;
  size(400,400);
  //load the images
  img=loadImage("semi1.png");
  img2=loadImage("semi2.png");
  
}


//-----------------Main Loop
void draw()
{
  //update the counter so we rotate the image a bit more than we did last time
  counter++;
  //create a white background to delete the prior frame
  background(255);
  //set the center of rotation
  translate(width/2, height/2);
  //rotate it in the NEGATIVE direction
  rotate(-0.5*counter*TWO_PI/360);
  //set the center of rotation back
  translate(-img.width/2, -img.height/2);
  image(img2,0,0);
 
  //repeat for the other image
  translate(width/2, height/2);
  //but rotate in the POSITIVE direction, with a higher speed than the previous image to compensate for the prior rotation
  rotate(1.0*counter*TWO_PI/360);
  translate(-img.width/2, -img.height/2);
  image(img,0,0);

}

//-----------------Interactions
void mousePressed() {
  //save the image to produce a thumbnail
  save("ellipsoid.png");
}

