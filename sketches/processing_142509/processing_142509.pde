
//loading image of figure
/* @pjs preload="Figure.gif"; */

import processing.video.*;

Movie wavesMovie;

PImage img;

//Put all variable declarations here 
float [] floorlines;

//timing
int start_time = 1000;

//bubbles
float bubbles=0;
boolean col=true;


void setup() {
  size(900, 700);
  background(255);

  img = loadImage("Figure.gif");
  floorlines = new float[900];

  wavesMovie = new Movie(this, "finalRender Ocean Renders Watch in HD 720.mp4");
  wavesMovie.loop();
}


void draw() {

  background(255);

  stroke(0);

  /////////////////Movie
  if ( millis() > start_time + 7000) {  

    tint(#9DAEFF, 65);
    image(wavesMovie, 0, -300, 1100, 1000);
  }


  ///////////FLOOR
  if ( millis() > 0) { // && millis() < start_time + 4500) {  t


    int floora = 0;

    float bgq_transparency = map( millis(), 0, 20000, 0, 5 );
    if ( bgq_transparency > 100 ) {
      bgq_transparency = 100;
    }

    while ( floora <= 900 ) {
      fill(random(0, 255)); 
      stroke(random(0, 255), 50);
      line(415, 400, floora*10, 1000);
      floora = floora + 1;
    }

    ///////////////CUBE
    //Drawing the Cube opening 
    if ( millis() > start_time) {  
      line(375, 350, 475, 350);
    }
    if ( millis() > start_time + 1000/2) {  

      line(475, 350, 475, 450);
    } 
    if ( millis() > start_time + 2000/2) {  

      line(475, 450, 375, 450);
    }
    if ( millis() > start_time + 3000/2) {  

      line(375, 450, 375, 350);
    }

    if ( millis() > start_time + 2000) {  
      beginShape();
      vertex(375, 350);
      vertex(400, 325);
      vertex (500, 325);
      vertex (475, 350);
      endShape();

      beginShape();
      vertex (500, 325); 
      vertex (500, 425);
      vertex (475, 450);
      endShape ();
    }

    ////////SQUARE TO FILL CUBE
    if ( millis() > start_time + 2000) {  
      float square = map(millis(), 3000, 30000, 255, 0);
      fill(square); 
      noStroke();
      rect(376, 351, 99, 99);
    }


    ////////////////WHITELINES 
    float whitelinex = random(50, 900);
    float whiteliney = random(50, 700);
    float colorlines = (random(0, 255));

    if ( millis() > start_time + 4000) { // && millis() < 6000) {  //

      float transparency = map(millis(), 5000, 20000, 0, 100);
      if ( transparency > 100 ) {
        transparency = 100;
      }
      stroke(colorlines, transparency);
      noFill();
      strokeWeight(2);
      ellipseMode(CENTER);
      ellipse( 450, 350, whitelinex, whiteliney);
    }


    if ( millis() > start_time + 6000) { // && millis() < 8000) { //
      float transparency = map(millis(), 7000, 20000, 0, 100);
      if ( transparency > 100 ) {
        transparency = 100;
      }
      stroke(colorlines, transparency);
      noFill();
      strokeWeight(2);
      ellipseMode(CENTER);
      ellipse( 450, 350, whitelinex, whiteliney);
    }


    if ( millis() > start_time + 8000) { // && millis() < 10000) {  //
      float transparency = map(millis(), 9000, 20000, 0, 100);
      if ( transparency > 100 ) {
        transparency = 100;
      }
      stroke(colorlines, transparency);
      noFill();
      strokeWeight(2);
      ellipseMode(CENTER);
      ellipse( 450, 350, whitelinex, whiteliney);
    }


    ///////////////FIGURE
    //Use millis to control when figure appears 
    //add random to all variables so that the figure keeps redrawing in slightly different places like in Idris Khans work 
    if ( millis() > start_time + 3000 ) {  // to make it stop, add: && millis() < something

      int i = 0;
      float num_of_figures = map( millis(), 4000, 20000, 1, 10 );
      if ( num_of_figures > 10 ) {
        num_of_figures = 10;
      }
      while ( i < num_of_figures ) {
        //figure variables 
        float figurex;
        figurex = (random(340, 360));
        float figurey; 
        figurey = (random(105, 110)); 
        image(img, figurex, figurey, 125, 250);
        i = i + 1;
      }
    }

    ////////BACKGROUND
    //Put in background
    if ( millis() > start_time + 4000 ) { // && millis() < start_time + 4500) {  t
      int bga = 0;
      int bgb = 0;
      int bgc = 0;
      int bgd = 0;

      float bga_transparency = map( millis(), 5000, 20000, 0, 100 );
      if ( bga_transparency > 100 ) {
        bga_transparency = 100;
      }

      while ( bga <= 900 ) {
        stroke(#9391A7, bga_transparency); 
        line(bga, 0, 900, 900);
        bga = bga + 20;
      }

      while ( bgb <= 900 ) {
        stroke(#9391A7, 50); 
        line(0, bgb, 100, 900);
        bgb = bgb + 20;
      }

      while ( bgc <= 900 ) {
        stroke(#403F52, 50);
        line(0, 0, bgc, 900);
        bgc = bgc + 20;
      }

      while ( bgd <= 900 ) {
        stroke(#403F52, 50);
        line(0, 0, 900, bgd);
        bgd = bgd + 20;
      }
    }

    //////ORIGINAL CODE FROM Óscar A. Montiel http://www.openprocessing.org/sketch/138778 //////  
    if ( millis() > start_time + 6000 ) { 
      float fly = map(millis(), 7000, 50000, 0.01, 0.5);
      bubbles+= fly;
      noFill();
      float x=bubbles;

      for (int i=0; i <=80;i++)
      {
        float y=sin(x)*height/2;
        ellipse(i*10, y+height/2, noise(x)*180, noise(x)*180);
        x+=2;
      }
    }
  }
}
void movieEvent(Movie m) {
  m.read();
}

