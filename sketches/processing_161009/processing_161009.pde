
/*

      "Take another look at 'the face' in the crowd"
      
This program shows that 'differences are what make us standout from the crowd'.

My goal in this assignment is to demonstrate the requirements of the assignment whilst continuing the theme of my 
first assignment sketch, the geometric face "Lets face it". 
Using many faces, to form a background, which have symmetry but are organised in such a way so as not to look 
regimented - i.e. look like a crowd of indistinguishable faces. 
Each face represents 10 million people making up the world population of 7.24 billion. 
The skin colour and eye colour of the crowd members are randomly selected from two palettes. 
The face in the foreground shows some asymetry and varies in size each time the program is run - so sometimes it is 
obvious and sometimes it will blend more with the crowd. 
A palette of greens is also used to provide a more 'soothing' background (when any is visible) and for the title.

 ( Above ASSESSED)
 
by David Leslie Williams

Requirements:-

The objective of this assignment is to demonstrate your command over drawing dynamically in processing. Additionally, 
you’ll be demonstrating your ability to use code blocks, variables, arrays, loops, and color palettes. You will also 
write an artistic description to accompany your sketch. As with your first assignment, your peers will be reviewing 
your work and reading your artistic description.

You’ve been given the fundamental tools to create dynamic, variable-driven drawings in processing. In this assignment, 
you must produce an original sketch utilizing at least one instance of the following techniques in processing:

use Code Blocks (setup AND draw) - assessed                          DONE
Use Variables (int OR float) - NOT assessed                          DONE
Use arrays (e.g for color palette) - NOT assessed                    DONE
Use Loops (while OR for) - NOT assessed                              DONE

As shown above, you are required to create a color palette for your assignment, utilizing a minimum of 3 colors. DONE
Additionally, the window size for your sketch must be no smaller than 800x600 and no larger than 1280x720.  DONE
Lastly, as with last week’s assignment, you must include a 2 sentence (minimum) description of your artistic 
intent/goal for your assignment. Place this at the top of your sketch as a comment.             DONE

Make sure to make line breaks appropriate so that your description is readable for your peers.  DONE

Criteria:
1) Assignment runs without error                                    DONE
2) Implementation of Code Blocks (setup AND draw)                   DONE
3) Assignment Implements a Color Palette (3 colors)                 DONE
4) Assignment includes 2 sentence (minimum) artistic description.   DONE

My approach to achieving this assignment was to take my code from assignment 1 and convert it into a function that could
be called to draw multiple faces with variation. As of yet I have made no attempt to clean up the code used for drawing the 
faces but the main draw code is very simple involving a 'for loop' to draw the required number of crowd faces and apply 
slight rotations to these. Then there is a single call to the face drawing function to draw 'the face', with a small 
random rotation applied. Finally the title is displayed using the default font to avoid any complications for people 
running on other machines.

Footnote: Irregularities to the teeth caused by scaling method are noted, and considered as a desirable though not 
originally designed effect and have been intentionally left as they reflect a real world feature!

*/

// Define global variables
// setup a palette for skin (ASSESSED)
color[] skin = {#FCD4C4, #C9A292, #4F3E25, #FFCDB8, #E8B56C, #82653C};
//setup palette for eye colour (ASSESSED)
color[] eyeColor = {#5BADC9, #597E62, #4F462E};
// setup a palette for background (ASSESSED)
color[] backdrop = {#397F3B, #32F70C, #6FA775, #243625, #8DD440};
//setup a string to show the title of the work.
String myTitle = "Take another look at 'the face' in the crowd";
//used to control the faces in the crowd - also meets requirement to use an int OR float
int population, theFaceX, theFaceY, theFaceScale;
float theFaceRotation;

// setup basic items in the setup block (ASSESSED)
void setup(){
  //size requirement minimum (800,600) to maximum (1280,720)
  // I have opted for 1260,720 on the basis that with frame it will fit in a vga screen width.
  size(1260,720);
  // set the framerate to 20 frames per second
  frameRate(10);
  // set background to a green from the palette
  background(backdrop[int(random(5))]);
  population = 724; //724 is chosen as each face represents 10 million people making a population of 7.24 billion.
}

// The main draw block (ASSESSED)
void draw() {
  // draw the crowd of faces  - 724 is chosen as each face represents 10 million people making a population of 7.24 billion.
  // redraw approximately every 5 seconds (note at frame rate of 10 this should be 50 but actually 44 gives closer to 5 seconds.)
  if (frameCount % 44 == 1) {
    background(backdrop[int(random(5))]); //clears the screen at the start of each redraw.
    for (int i = 0; i < population; i++){
      pushMatrix();
        //give a slight rotation to faces so they do not look regimented
        rotate(random(PI/8)-(PI/16));
        // To simplify the code I have created a function called drawFace which is passed x,y position, a scale for the face size,
        // an index for the skin color, and a boolean for if the face should be asymetric or not.
        // for the crowd x,y position is random, the face scale has a random element, the skin colour is random and the face is symetric
        drawFace(int(random(width)), int(random(height)), int(random(15,25)), int(random(6)), false);
      popMatrix();
    }
  
    // draw the main face in the crowd as it is drawn after the crowd it will always be at the front and not obscured.
      pushMatrix();
        theFaceRotation = random(PI/8)-(PI/16);
        rotate(theFaceRotation);
        theFaceX = int(random(width/8,7*width/8));
        theFaceY = int(random(height/8,7*height/8));
        theFaceScale = int(random(20,40));
        drawFace(theFaceX, theFaceY, theFaceScale, int(random(6)), true);
      popMatrix();
      
     // Add the title to the sketch
     textSize(40);
     //randomly change the text colour from the greens in the backdrop palette
     fill(backdrop[int(random(5))]);
     text(myTitle, (width-textWidth(myTitle))/2, height-10);
  }
}


// function to draw a face at pos(X,Y)
// size scaled by faceScale - NOTE: code could be radically improved by bringing the scaling out as an overiding task
// color using faceColorIndex to select from skin[] pallette
// with asymetry decided by oddness boolean

void drawFace(int posX, int posY, int faceScale, int faceColorIndex, boolean oddness){
  // two ears ellipses part covered
  color skintype;
  skintype = skin[faceColorIndex];
  stroke(#FFFFFF);
  strokeWeight(1);
  fill(skintype);
  ellipse(posX+2*faceScale,posY-5*faceScale/10,1*faceScale,1.5*faceScale);
  if (oddness){
    fill(skin[1]);
  }
  ellipse(posX-2*faceScale,posY-5*faceScale/10,1*faceScale,1.5*faceScale);

  // head as an ellipse in a "flesh" colour!
  stroke(#FFFFFF);
  strokeWeight(1);
  fill(skintype);
  ellipse(posX,posY,4*faceScale,5*faceScale);

  //triangle for nose
  stroke(#814D38);
  strokeWeight(1);
  triangle(posX, posY-faceScale/1.1, posX-faceScale/2, posY+faceScale/1.1, posX+5*faceScale/10, posY+faceScale/1.1);

  //two ellipses for nostrils
  noStroke();
  fill(0);
  ellipse(posX-0.25*faceScale,posY+0.8*faceScale,0.15*faceScale,0.20*faceScale);
  if (oddness){
    fill(#585250);
  }
  ellipse(posX+0.25*faceScale,posY+0.8*faceScale,0.15*faceScale,0.20*faceScale);

  //two ellipses for eyes
  fill(#FCF7F5);
  ellipse(posX-1.10*faceScale,posY-0.5*faceScale,1*faceScale,0.5*faceScale);
  strokeWeight(1);
  if (oddness){
    fill(#DEC9C9);
  }
  ellipse(posX+1.10*faceScale,posY-0.5*faceScale,1*faceScale,0.5*faceScale);

  //two ellipses (circles) for irises  and two more for the pupils
  if (oddness){  //One Blue eye if odd
    fill(#5BADC9); //Blue eyes
  } else {
    fill(eyeColor[int(random(3))]); // otherwise random eyecolor from pallette
  } 
  ellipse(posX-1.10*faceScale,posY-0.5*faceScale,.40*faceScale,.40*faceScale);
  if (oddness){  //one Green eye if odd
    fill(#597E62);
  }
  ellipse(posX+1.10*faceScale,posY-0.5*faceScale,.40*faceScale,.40*faceScale);
  fill(0);
  ellipse(posX-1.10*faceScale,posY-0.5*faceScale,.20*faceScale,.20*faceScale);
  if (oddness){  //grey pupil if odd
    fill(#6C6927);
  }
  ellipse(posX+1.10*faceScale,posY-0.5*faceScale,.20*faceScale,.20*faceScale);

  //arcs for eyebrows
  noFill();
  stroke(0);
  strokeWeight(.16*faceScale);
  arc(posX+1*faceScale,posY-1*faceScale,1.5*faceScale,0.8*faceScale, 1.2*PI, 1.8*PI);
  if (oddness){  //grey eyebrow if odd
    stroke(#A29D9D);
  }
  arc(posX-1*faceScale,posY-1*faceScale,1.5*faceScale,0.8*faceScale, 1.2*PI, 1.8*PI);

  // rectangles as teeth
  stroke(0);
  strokeWeight(1);
  fill(#FFFFFF);
  //bottom row of teeth
  rect(posX-.55*faceScale,posY+1.68*faceScale,.1*faceScale,.2*faceScale);
  rect(posX-.45*faceScale,posY+1.68*faceScale,.1*faceScale,.2*faceScale);
  rect(posX-.35*faceScale,posY+1.68*faceScale,.15*faceScale,.2*faceScale);
  rect(posX-.20*faceScale,posY+1.68*faceScale,.2*faceScale,.2*faceScale);
  rect(posX              ,posY+1.68*faceScale,.2*faceScale,.2*faceScale);
  rect(posX+.20*faceScale,posY+1.68*faceScale,.15*faceScale,.2*faceScale);
  rect(posX+.35*faceScale,posY+1.68*faceScale,.1*faceScale,.2*faceScale);
  rect(posX+.45*faceScale,posY+1.68*faceScale,.1*faceScale,.2*faceScale);
  //top row of teeth
  rect(posX-.55*faceScale,posY+1.48*faceScale,.1*faceScale,.2*faceScale);
  rect(posX-.45*faceScale,posY+1.48*faceScale,.1*faceScale,.2*faceScale);
  rect(posX-.35*faceScale,posY+1.48*faceScale,.15*faceScale,.2*faceScale);
  rect(posX-.20*faceScale,posY+1.48*faceScale,.2*faceScale,.2*faceScale);
  rect(posX              ,posY+1.48*faceScale,.2*faceScale,.2*faceScale);
  rect(posX+.20*faceScale,posY+1.48*faceScale,.15*faceScale,.2*faceScale);
  rect(posX+.35*faceScale,posY+1.48*faceScale,.1*faceScale,.2*faceScale);
  rect(posX+.45*faceScale,posY+1.48*faceScale,.1*faceScale,.2*faceScale);

  // two different arcs for the top and bottom lips
  if (!oddness) {
    stroke(#CB371E);
  } else {
    stroke(#FF0000);
  }
  strokeWeight(int(0.20*faceScale));
  noFill();
  arc(posX,posY+1.8*faceScale,1.5*faceScale,.8*faceScale, 1.1*PI, 1.9*PI);
  strokeWeight(0.25*faceScale);
  arc(posX,posY+1.58*faceScale,1.5*faceScale,.8*faceScale, 2.1*PI, 2.9*PI);

  // triangle to give a 'v' in the top lip
  noStroke();
  fill(skintype);
  triangle(posX, posY+1.4*faceScale, posX-.20*faceScale, posY+1.1*faceScale, posX+.20*faceScale, posY+1.1*faceScale);

  // lines for frowning
  stroke(#482C1D);
  strokeWeight(1);
  line(posX-.50*faceScale,posY-2.25*faceScale,posX+.50*faceScale,posY-2.25*faceScale);
//  if (oddness) {
//    strokeWeight(2);
//  }
  line(posX-.70*faceScale,posY-2.05*faceScale,posX+.70*faceScale,posY-2.05*faceScale);
//  if (oddness) {
//    strokeWeight(3);
//  }
  line(posX-.90*faceScale,posY-1.85*faceScale,posX+.90*faceScale,posY-1.85*faceScale);

  // triangle and circle to form a tear! only if oddness is true
  if (oddness){
    noStroke();
    fill(#4A7AA2);
    ellipse(posX+.70*faceScale,posY-.10*faceScale,.20*faceScale,.25*faceScale);
    triangle(posX+.70*faceScale, posY-.35*faceScale, posX+.60*faceScale, posY-.10*faceScale, posX+.80*faceScale, posY-.10*faceScale);
  }
  // lines for hair!
  stroke(#482C1D);
  strokeWeight(1);
  line(posX,posY-2.5*faceScale,posX-.35*faceScale,posY-2.9*faceScale);
  line(posX,posY-2.5*faceScale,posX-.30*faceScale,posY-2.9*faceScale);
  line(posX,posY-2.5*faceScale,posX-.25*faceScale,posY-2.9*faceScale);
  line(posX,posY-2.5*faceScale,posX-.20*faceScale,posY-2.9*faceScale);
  line(posX,posY-2.5*faceScale,posX-.15*faceScale,posY-2.9*faceScale);
  line(posX,posY-2.5*faceScale,posX-.10*faceScale,posY-2.9*faceScale);
  line(posX,posY-2.5*faceScale,posX-.05*faceScale,posY-2.9*faceScale);
  line(posX,posY-2.5*faceScale,posX+.05*faceScale,posY-2.9*faceScale);
  line(posX,posY-2.5*faceScale,posX+.10*faceScale,posY-2.9*faceScale);
  line(posX,posY-2.5*faceScale,posX+.15*faceScale,posY-2.9*faceScale);
  line(posX,posY-2.5*faceScale,posX+.20*faceScale,posY-2.9*faceScale);
  line(posX,posY-2.5*faceScale,posX+.25*faceScale,posY-2.9*faceScale);
  line(posX,posY-2.5*faceScale,posX+.30*faceScale,posY-2.9*faceScale);
  line(posX,posY-2.5*faceScale,posX+.35*faceScale,posY-2.9*faceScale);

}

// THE END


