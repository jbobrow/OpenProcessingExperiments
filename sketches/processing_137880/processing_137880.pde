



// *************************************************     PLEASE READ FIRST   ************************************************

//Hi all, Blank Canvas, see the changes and design when input received

// we are pretty familiar wth the search engine Google.com
//so i have made it a little bit interactive with the help of processing
//in which you can draw diffrent shapes when you click your mouse and drag it
//i have also used sound input as soon as you load the sketch
//i have used google image to load in the background so it would make you feel that you are actually drawing shapes on google.com

//--------------------------------------------------------------------------------------------------
//PLEASE READ AND FOLLOW TO UNDERSTAND THE WHOLE SKETCH
//--------------------------------------------------------------------------------------------------

//PRESS "O" TO START THE SKETCH & TO LOAD BACKGROUND
//THEN use mouse to draw sketches by pressing mouse keys and dragging mouse while mouse key pressed




//mouse/keyboard input
/*
MOUSE
position x : length
position y : thickness and number of lines to be drawn
drag : draw

KEYS
1-3 : stroke color
del, backspace : erase
s : save png
*/


import ddf.minim.*;                          //imported minim for playing audio input

Minim minim;                                 //specified minim to the an audio file

AudioSample bells;

PImage fractal;                              //specified image to be loaded in the background once "G" pressed

color strokeColor = color(0, 10);            //specified colour



void setup() {                               //main setup begin
 
 
  minim = new Minim(this);                   //included audio file to be played
  bells = minim.loadSample("welcome.mp3");
  size(950,600);
  
 
   fractal = loadImage("google.jpg");        //image fractal

 
  noFill();                                  // no fill until background loads after pressing "o"
 
}



void draw() {                                // main Sketch coding of shapes


  if(mousePressed){                          //read and follow next lines of code if mouse pressed and draw shapes
    pushMatrix();                            //push matrix used
    translate(width/2, height/2);            //translates from half of width & half of height
    int circleResolution = (int)map(mouseY+100, 0, height, 2, 10);
    int radius = mouseX-width/2;
    float angle = TWO_PI/circleResolution;
    
    
    strokeWeight(2);                        //defines the thickness of the linesor shapes
    stroke(strokeColor);                    //defines the colour
    


    
    beginShape();                            //begin drawing a poly
    for (int i=0; i<=circleResolution; i++) {
      float x = 0 + cos(angle*i) * radius;
      float y = 0 + sin(angle*i) * radius;
      vertex(x, y);
    }
    endShape();
    popMatrix();                              //pop matrix used with push matrix
  }
}


//----------------------------------------------------------------------------------------------------
//INPUT KEYS :        ||  "O"        || "BACKSPACE"        || "DELETE"          || "S"
//----------------------------------------------------------------------------------------------------

   void keyPressed() {                        //read and follow next lines of code if key pressed and play audio and change background
     
     if ( key == 'o' || key == 'O' ) background(fractal);    // press key "O" or "o" to load the background
  
  if ( key == 'O' || key == 'o' ) bells.trigger();           //press key "o" or "O" for google to play audio file
  
  if ( key == 'b' ) println("Welcomt to Google.com");        // print line 
  
 }

 void keyReleased() {                          //read and follow next lines of code if key released erase the sketch or erase the shapes
   
   if ( key == BACKSPACE) background(fractal);  //pressing BACKSPACE KEY will erase the shapes of the sketch
   
   if (key == DELETE )background(0);            //pressing DELETE key will erase the entire sketch
   
   if (key == 's' || key == 'S') saveFrame("screenshot.png"); //pressing S or s key will take a screenshot and save it
   
   
   
   switch(key) {                                //changing the colour cases
   
     case '1':                                  //added colour case 1
     strokeColor = color(0, 10);
     break;
     case '2':
     strokeColor = color(192, 150, 70, 10);    //added colour case 2
     break;
     case '3':
     strokeColor = color(40, 100, 60, 5);      //added colour case 3
     break;
     
   }
 }
 
 //*********************************************** END OF THE CODE **********************************************


