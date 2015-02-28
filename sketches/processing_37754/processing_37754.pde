
//In terms of impressionist music, there is a general disdain for affiliation
//the French composers of the late 19th century did not consider themselves part of a movement, but instead composers of a new form
//exemplified in the musical pieces Claude Debussy and Maurice Ravel, impressionist music takes form as a reaction to Romanticism

//Polarity in Music: Symmetry and Asymmetry and their Consequences
//"There are two great nodal point, two great dividing lines visible to the historical eye and audible to the discerning ear, that mark the morphological development of Western music with its unique twistings and turnings - and yes, in the precise spirit of Harold Bloom's term, its strangeness.
//If i can convey some sense of this, I will have put before you the outlines of a pattern or configuration of the action of large natural forces working invisibly on the human spirit, mind, heart, and soul, and of the muscial culture they have produced."
//--George Rochberg-- Composer and Emeritus Annenberg Professor of the Humanities, University of Pennsylvania


import ddf.minim.*;                                   //import minim library

Minim minim;                                          //create space in memory for minim
AudioPlayer mySound;                                  //create a new entry in memory for a linked audio file

int [] Colors = new color [8];                        //insert the color palette for the drawing through a matrix of eight different impressionist palette colors

void setup() {
  size(600,600);
  background(0);
  minim = new Minim(this);                            //new minim entry
  mySound = minim.loadFile("debussyNocturne.mp3");    //load the file addressed before
  mySound.loop();                                     //create a loop to repeat the song after it ends
  smooth();                                           
  frameRate(10);
  
  Colors[0] = color(255,130,86);                       //orange
  Colors[1] = color(205,200,174);                      //grey-brown
  Colors[2] = color(115,163,83);                       //green
  Colors[3] = color(58,115,69);                        //green'
  Colors[4] = color(26,31,28);                         //black
  Colors[5] = color(159,179,182);                      //grey-blue
  Colors[6] = color(71,142,176);                       //blue
  Colors[7] = color(126,130,173);                      //purple

  mySound.mute();
}

int a = floor(random(0,8));                            //selection of four different colors to use (determined by random) that will be drawn from the color selection matrix created
int b = floor(random(0,8));
int c = floor(random(0,8));
int d = floor(random(0,8));

void draw() {
  
  noStroke();
  fill(0,75);
  rect(0,0,width,height);
  
  for ( int x = 0; x <= width; x += width/2) {        //the first for loop creates a gridding to draw arcs from three postitions along the x axis
    for ( int y = height; y >= 0; y -= height) {      //and two positions along the y axis
      if(x == width/2) {                              //determine when to draw the first two arcs, and what color they will be
        strokeWeight(5);
        noFill();
        stroke(Colors[a],20);
        arc(x,y,width,height,PI,2*PI);                //bottom middle arc
        arc(x,0,width,height,0,PI);                   //top middle arc
      }
      else {                                          //draws the other background arcs at a differnt stroke color and weight
        strokeWeight(2);
        noFill();
        stroke(Colors[b],20);
        arc(x,y,width,height,PI,2*PI);
        arc(x,0,width,height,0,PI);
      }
    }
  }
  
    float threshold = 2*width;                        //creates a threshold distance that the arcs from the levels will not exceed. creates a restraint in the compositional as well as a reasonable bounding of the values of left and right levels
    float leftLevel = pow(mySound.left.level()*90,4); //determining two appropriate values for the left and right levels to use as variables within another form. the use of 'pow' limits the math that has to be done to find the appropriate values of the variable
    float rightLevel = pow(mySound.right.level()*90,4);
    int arcRandL = floor(random(-3*PI/2,3*PI/2));     //determines how far the arcs will extend (either smaller arc length, or to the length of a circle
    int arcRandR = floor(random(-3*PI/2,3*PI/2));
    
    if(leftLevel > threshold){                        //if either level reaches the threshold, it will be limited to the threshold
      leftLevel = threshold;
    }
    if(rightLevel > threshold){
      rightLevel = threshold;
    }
    
      
    //println(leftLevel);
    stroke(255);
    strokeWeight(5);
    fill(Colors[c],70);
    pushMatrix();                                                                      //moves the position of the matrix in order to draw the arcs
    translate(width/2,height);
    arc(0, -50, leftLevel,leftLevel, (3*PI/2) - arcRandL, (3*PI/2) + arcRandL);        //drawings arcs at the new translated point. this is the bottom set of arcs that uses the left level values
    fill(Colors[d],70);
    translate(0,-height);
    arc(0, 50, rightLevel,rightLevel, (PI/2) - arcRandR, (PI/2) + arcRandR);           //top set of arcs that uses the right level values
    popMatrix();
}

void keyPressed()
{
  if ( key == 'm' ){                                                                   //mute set function to toggle the mute
    if (mySound.isMuted()){
      mySound.unmute();
    }
    else{
      mySound.mute();
    }
  }
}


