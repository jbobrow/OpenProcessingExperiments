

/* Some rights reserved. This work is licensed under a 
Creative Commons Attribution-Noncommercial-No Derivatives 4.0 International License.
http://creativecommons.org/licenses/by-nc-nd/4.0/
*/

/* This work is in fulfillmemt of
an assignment for Introduction to Computational Arts
offered by Stony Brook University through coursera.org
"original work which demonstrates competency in the three core areas
of this course: programming, visual art, and sound art"
"The sketch runs without errors. 
Design is clear and intuitive.
Clean code, proper use of camel case, comments, and code blocks."
*/


//The program begins with the sound of a bell
//as the night sky appears


//Declare the night sky as a PImage variable type
/*original photograph:
Smoky Mountain Night
by giricredwolf 
http://fc09.deviantart.net/fs18/f/2007/123/c/6/Smoky_Mountain_Night_by_giricredwolf.jpg 
Some rights reserved. This work is used under a 
Creative Commons Attribution-Noncommercial-Share Alike 3.0 License
modified by scaling, masking
*/
//full image
PImage night;
//mountain, tree and moon
PImage nightTop;



//Bell will ring upon opening sketch
//a shorter bell will ring with each keypress
//Import minim library files
//Sketch>Import library>minim,select code line
//or just type code line
//access minim function
import ddf.minim.*;
//declare instance of Minim
Minim minim;
//declare instance of AudioPlayer
/* original audio:
Bell Meditation
by fauxpress
http://www.freesound.org/people/fauxpress/sounds/42095/#
This work is used under the Creative Commons 0 License.
modified by cutting, fading, changing tempo
*/
AudioPlayer bell;


//declare 2nd instance of Minim
Minim minim2;
//play second bell file
AudioSample bell2;



//draw multi-colored stars
color[] palette = 
{#000040, #FFAA00, #FFFFFF, #FFFF00, #FFC400, #A1A2B7, #8B8A33, 
#B7B694, #FED284, #DEDCC8, #D3D3FE, #2B2B6C};


void setup() {
  //put the night images in the background and foreground
  //Sketch>Add>to put images in data file
  //size must = image size precisely
  //max width 970? in openprocessing.org
  size(900,563);
  night = loadImage("Night.png");
  //load partial night sky image
  nightTop = loadImage("nightTop.png");
  //show entire night image
  image (night, 0,0);
  background(night);
  //I like the stars to be sharp
  noSmooth();
  

  //bell rings upon running sketch
  //define minim variable
  minim = new Minim(this);
  //define opening bell content
  bell = minim.loadFile("42095-freesound.mp3");
  //bell plays upon setup
  bell.play();

  
  //bell rings with event
  //define minim variable
  minim2 = new Minim(this);
  //define event bell content
  //this is a quicker bell ring
  bell2 = minim2.loadSample("3pBell.mp3");
}


void draw() {
  //put mountain, moon and tree in foreground
  image (nightTop, 0,0, width,height);
  
  //give direction to the user
  String a = "A Christmas story says that when you hear a bell, that means an angel got wings.";
  String b = "And a new star is the angel who got wings.";
  String c = "Hold the m key down to see angels who have wings.";
  String d = "Click on the sky with the mouse to add large stars.";
  String e = "Hold the mouse down to write or draw using the stars.";
  //"use the m key     Click, drag mouse";
  //give the lettering a soft gray color
     fill(175);
      textAlign(RIGHT);
      textSize(20);
      text (a,width-20,height-150);
      text (b,width-20,height-120);
      text(c,width-20,height-90);
      text(d,width-20,height-60);
      text(e,width-20,height-30);

  //-----project implements keyboard input-----
  if (keyPressed) {
    
    //ring the short bell sound
      bell2.trigger(); {     

  //*****apply stars*****        
    if (key == 'm' || key == 'M')
    {
    //***small stars****
    for (int i=0; i <2; i++) {
      float star = random(1,11);
      stroke(palette[int(star)]);
      strokeWeight(int(random(1,3)));
      point(random(width),random(height-200));
      //*****tiny stars*****
      for (int tiny=0; tiny <10; tiny++) {
        strokeWeight(1);
        point(random(width),random(height));
      }
    }
    
    //*****3 pixel stars*****
    for (int i = 0; i <2; i++) {
      float star = random(1,12);
      float rx = random(width);
      float ry = random(height-200); 
      int x = int(rx);
      int y = int(ry);
      stroke(palette[int(star)]);
      line(x,y, x+2, y+2);
      line(x,y+1, x+2, y+1);
      line(x,y+2, x+2, y);
    }

    //*****7 pixel stars*****
    for (int i = 0; i <2; i++) {
      float star1 = random(1,12);
      float star2 = random(1,12);
      float rx = random(width);
      float ry = random(height-200); 
      int x = int(rx);
      int y = int(ry);
      stroke(palette[int(star1)]);
      line(x,y, x+6,y+6);
      line(x+6,y, x,y+6);
      //test for random colors
      //println(star1);
      stroke(palette[int(star2)]);
      line(x+3,y, x+3,y+6);
      line(x,y+3, x+6,y+3);
      //test colors
      //println(star2);
    }

    //*****7 pixel polygons*****
    for (int i = 0; i <2; i++) {
      float star1 = random(1,12);
      float star2 = random(1,12);
      float rx = random(width);
      float ry = random(height-200); 
      int x = int(rx);
      int y = int(ry);
      stroke(palette[int(star1)]);
      fill(palette[int(star2)]);
      beginShape();
      vertex(x+3,y);
      vertex(x+4,y+2);
      vertex(x+6,y+2);
      vertex(x+5,y+3);
      vertex(x+6,y+6);
      vertex(x+3,y+4);
      vertex(x,y+6);
      vertex(x+1,y+3);
      vertex(x,y+2);
      vertex(x+2,y+2);
      endShape(CLOSE);
    }

    //*****13 pixel stars shrink*****
    scale(0.5);
    float star1 = random(1,12);
    //must declare 2 star variables to get 2 different colors
    float star2 = random(1,12);
    //the upper right corner gets congested because of the scaling
    float rx = random(width*2);
    float ry = random(height*2); 
    int x = int(rx);
    int y = int(ry);
    stroke(palette[int(star1)]);
    fill(palette[int(star2)]);
    beginShape();
    vertex(x+6,y);
    vertex(x+8,y+4);
    vertex(x+12,y+4);
    vertex(x+10,y+6);
    vertex(x+12,y+12);
    vertex(x+6,y+8);
    vertex(x,y+12);
    vertex(x+2,y+6);
    vertex(x,y+4);
    vertex(x+4,y+4);
    endShape(CLOSE);
    }
  }
}
}

//*****doodle with stars*****
//place stars according to mouse location
void mouseDragged() {
  //build star  
  float star1 = random(1,12);
  //must declare 2 star variables to get 2 different colors
  float star2 = random(1,12);
  float rx = random(width);
  float ry = random(height); 
  int x = mouseX;
  int y = mouseY;
  stroke(palette[int(star1)]);
  fill(palette[int(star2)]);  
  beginShape();
  vertex(x+6,y);
  vertex(x+8,y+4);
  vertex(x+12,y+4);
  vertex(x+10,y+6);
  vertex(x+12,y+12);
  vertex(x+6,y+8);
  vertex(x,y+12);
  vertex(x+2,y+6);
  vertex(x,y+4);
  vertex(x+4,y+4);
  endShape(CLOSE);
}

//*****add larger stars to create your own consellations*****
void mouseClicked() {
  //build star  
  float star1 = random(1,12);
  //must declare 2 star variables to get 2 different colors
  float star2 = random(1,12);
  float rx = random(width);
  float ry = random(height); 
  int x = mouseX;
  int y = mouseY;
  stroke(palette[int(star1)]);
  fill(palette[int(star2)]);  
  beginShape();
  vertex(x+6,y);
  vertex(x+8,y+4);
  vertex(x+12,y+4);
  vertex(x+10,y+6);
  vertex(x+12,y+12);
  vertex(x+6,y+8);
  vertex(x,y+12);
  vertex(x+2,y+6);
  vertex(x,y+4);
  vertex(x+4,y+4);
  endShape(CLOSE);
}


