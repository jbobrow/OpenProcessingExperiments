
/*
//add sound library
 import ddf.minim.*;
 
 // declare (name) sound library objects
 Minim minim;
 AudioInput in;
 */

// declare image name
PImage happyFace1;

void setup () {

  // basic setups
  size(400, 600);
  frameRate(60);
  colorMode(HSB);
  /*
  // load sound library object. 
   minim = new Minim(this);
   
   // get the microphone/line in
   in = minim.getLineIn();
   */

  // create image from your file
  happyFace1 = loadImage("face.png");
}

void draw() {

  float size = 10;

  /*
  // making a scale factor for our mouse pointer from sound input  
   
   //grab value from the left microphone  
   float inLeft = in.left.get(0);
   //println(inLeft);
   
   float size = inLeft * 1000 + 10;
   //println(size);
   */
   
  pushMatrix(); // i want to start moving something with affecting everything (create a new coordinate system) 

  translate(mouseX, mouseY); // shift my coordinate frame
  scale(.01*size, .01*size); // change the scale of everything

  imageMode(CENTER);  // center image when drawing
  image(happyFace1, 0, 0); // draw image at the center ( of our current coordinate frame)

  popMatrix();  // end this drawing operation and go back to original coordinate system



  for (int i=0; i < 30; i++) {  // loop i from 0 - 29 . this will be used for each of our 30 columns of rectangles
    for (int j=0; j < 45; j++) {  // loop j from 0 - 44 . this will be used for each of our 45 rows of rectangles

      pushMatrix(); // i want to start moving something with affecting everything (create a new coordinate system) 

      // position
      translate(15* i, 15 *j);  // each new rect at a new postion based on looping indexes
      rotate(radians(frameCount)); // rotate a lot

        // color
      fill(i*j, 255, 255, 20);  // change color based on position
      noStroke(); // turn off the outlines

      rect(-5, -5, 10, 35); // draw rectangle near the center so it rotates without moving too far from its spot

      popMatrix();  // end this drawing operation and go back to original coordinate system
    } // end of for(j)
  } //end of for(i)
} //end of draw()



