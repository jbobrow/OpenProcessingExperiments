
/*
Assignment 3 - Final Project
-----------------------------------------------------------
Matthew P. DeCarlo                           March 2nd 2014
matthewwho@me.com
-----------------------------------------------------------
This assignment demonstrates a culmination of all the work
that has been completed in during this course.
-----------------------------------------------------------
Artistic Description:
This art project has been title "Thor's Rainy". The
intention is to use the shapes to create clouds and rain.
The looping function of the draw function has been used to
create an animation of falling rain.  When the spacebar is
pressed thunder and lightning is triggered, along with a
little sprite named Thor.  If Thor is triggered four times
by pressing the spacebar, then he will stop the rain and
make a rainbow appear!
-----------------------------------------------------------
Instructions:
Thunder and lightning - press the spacebar.
Thor's Magic          - press the spacebar four times.
Release Thor          - press the spacebar after the magic.
-----------------------------------------------------------
Credits:
Thunder sound was provided by http://www.freesfx.co.uk in
accordance  to their EULA the use of the audio file has
been duly noted.
*/

//import libraries
import ddf.minim.*;

//global variables initalized
//sound variables
Minim minim;
AudioSample thunder;

//image variable
PImage thorAngry, thorMagic;

//variables defining various sizes and positions
float dropSize = 25;
float xPos = random(0,600);
float yPos = -1 * dropSize;
float cloudPos = 0;

//define Color Palette
color[] cloudPalette = {#EAE8E8, #CBCBCB, #BFBFBF};
color[] rainPalette = {#1E72E5, #78CFED, #2EB6E5};
color[] bgPalette = {#959595, #5D5D5D};
color[] lighting = {#D6D672, #FEFF08, #DAE300, #BCC12D, #FCFFA5};
color[] rainbow = {#FF0000, #FF7F00, #00FF00, #0000FF,  #4B0082};
int count = 0;

//setup code block
void setup()
{
  //setup audio library
  minim = new Minim(this);
  thunder = minim.loadSample("thunder.mp3");
  
  //setup images
  thorAngry = loadImage("thorAngry.png");
  thorMagic = loadImage("thorMagic.png");
  
  //setup canvas
  size(800, 600);
  smooth();
  noStroke();
  
}

//draw code block
void draw()
{
  //draw function loops and will use background to cover over the previous picture to create an animation/ movement.
  background(bgPalette[int(random(0, 1))]);
  
  //raindrops
  fill(rainPalette[int(random(0, 2))]); 
  bezier(1 * dropSize + xPos, 3 * dropSize + yPos+10, 2 * dropSize + xPos, 4 * dropSize + yPos+10, 0 + xPos, 4 * dropSize + yPos+10, 1 * dropSize + xPos, 3 * dropSize + yPos+10);
  fill(rainPalette[int(random(0, 2))]); 
  bezier(1 * dropSize + xPos+50, 3 * dropSize + yPos-20, 2 * dropSize + xPos+50, 4 * dropSize + yPos-20, 0 + xPos+50, 4 * dropSize + yPos-20, 1 * dropSize + xPos+50, 3 * dropSize + yPos-20);
  fill(rainPalette[int(random(0, 2))]); 
  bezier(1 * dropSize + xPos+150, 3 * dropSize + yPos-40, 2 * dropSize + xPos+150, 4 * dropSize + yPos-40, 0 + xPos+150, 4 * dropSize + yPos-40, 1 * dropSize + xPos+150, 3 * dropSize + yPos-40);
  fill(rainPalette[int(random(0, 2))]); 
  bezier(1 * dropSize + xPos+250, 3 * dropSize + yPos-50, 2 * dropSize + xPos+250, 4 * dropSize + yPos-50, 0 + xPos+250, 4 * dropSize + yPos-50, 1 * dropSize + xPos+250, 3 * dropSize + yPos-50);
  
  //draw clouds over raindrops
  //1st cloud on the left
  fill(cloudPalette[int(random(0, 2))]);
  ellipse(100, 50+cloudPos, 126, 97);
  ellipse(140, 40+cloudPos, 70, 60);
  ellipse(52, 60+cloudPos, 70, 60);

 //3rd cloud
  ellipse(100+200, 50+cloudPos, 126, 97);
  ellipse(140+200, 40+cloudPos, 70, 60);
  ellipse(52+200, 60+cloudPos, 70, 60);

  //5th cloud
  ellipse(100+400, 50+cloudPos, 126, 97);
  ellipse(140+400, 40+cloudPos, 70, 60);
  ellipse(52+400, 60+cloudPos, 70, 60);

  //7th cloud
  ellipse(100+600, 50+cloudPos, 126, 97);
  ellipse(140+600, 40+cloudPos, 70, 60);
  ellipse(52+600, 60+cloudPos, 70, 60);
  
  //2nd cloud
  fill(cloudPalette[int(random(0, 2))]);
  ellipse(100+100, 50-cloudPos, 126, 97);
  ellipse(140+100, 40-cloudPos, 70, 60);
  ellipse(52+100, 60-cloudPos, 70, 60);

  //4th cloud
  ellipse(100+300, 50-cloudPos, 126, 97);
  ellipse(140+300, 40-cloudPos, 70, 60);
  ellipse(52+300, 60-cloudPos, 70, 60);

  //6th cloud
  ellipse(100+500, 50-cloudPos, 126, 97);
  ellipse(140+500, 40-cloudPos, 70, 60);
  ellipse(52+500, 60-cloudPos, 70, 60);

  //make raindrops fall by increasing the y position 
  yPos += 1.5;
  
  /*
  The while statement used to change values of positions to
  make the image appear to be moving each time the drops
  meet the end of the y axis and are off the screen. 
  */
  while (yPos > height)
  {
    //randomize the x posistion of the rain
    xPos = random(0,400);
    //return the y posistion to the top of the screen
    yPos= -1 * dropSize;
    //randomize the clouds positions
    cloudPos = random(-10,10);
  }
}

/*
keyboard input:
When the "L" key is pressed the lighting is trigered.
*/
void keyPressed(){
  if ((count == 3) && (key == ' ')){
  noLoop();
  fill(rainbow[0]);
  rect(0,0,800,120);
  fill(rainbow[1]);
  rect(0,120,800,120);
  fill(rainbow[2]);
  rect(0,240,800,120);
  fill(rainbow[3]);
  rect(0,360,800,120);
  fill(rainbow[4]);
  rect(0,480,800,120);
  image(thorMagic, 200, 100, 400, 400);
  count = 0;
  
}
  
  else if (key == ' '){
  background(lighting[int(random(0, 4))]);
  thunder.trigger();
  image(thorAngry, 200, 100, 300, 300);
  count++;
  loop();
  println("count is " + count);
  }
}

