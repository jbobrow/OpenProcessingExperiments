
// basic setups
void setup() {
  size(400,400);
  frameRate(24);
  smooth();
  drawLogo();
}

// taken from Rob's example at http://web.arch.usyd.edu.au/~rob/teaching/2010/DECO1012/
// displays generative design in a slideshow-like fashion
void draw(){
  if (frameCount % 240 == 0) {
    drawLogo();
  } 
  else if (frameCount % 240 > 200) {
    noStroke();
    fill(0, 32);
    rect(0, 0, width, height);  
  }
}

/* This is my generative logo design for Mitsubishi. I focused on the idea of
 the red diamonds in the original logo design, and the idea of rotation*/
void drawLogo(){       
  background(100, 0, 0); // sets a dark red-ish background for the logos
  stroke(255, 200); // Creates a slightly opaque white outline for each diamond
  translate(200, 200); // moves the center point for everything to the middle of the screen
  pushMatrix();
  for (int s=0; s<4; s++){
    scale(random(1.2, 1.3)); // loops the scaling so each time the diamonds would become bigger
    if (s>2){
      strokeWeight(random(0, 1.5)); // randomizes thickness of outlines
    }
    for (int r=0; r<3; r++){       
      fill(255, 0, 0, 120);// fills the diamonds with an opaque red colour
      rotate(radians(120));  // rotation is looped to produce the 3-diamond shapes of the original Mitsubishi logo
      diamond(); // uses the custom diamond function to draw the basic shape
    }
    // the next loop draws the transparent diamond shapes with white outlines, giving the design a more geometrical feel
    for (int r=0; r<6; r++){       
      noFill();// makes the diamonds completely transparent
      strokeWeight(0.5); // sets the thickness of the lines to 0.5
      rotate(radians(random(120))); // rotation is looped to produce the 3-diamond shapes
      diamond();// uses the custom diamond function to draw the basic shape
    }
  }
  popMatrix(); // reverts back to transformation settings from the popMatrix above
  //Settings for text:
  fill(255); // creates text in white
  rotate(radians(random(-90, 90))); // rotates the text around center point in the right side of the screen only
  PFont font= loadFont("Arial-BoldMT-48.vlw"); // loads font Arial for the text "Mitsubishi"
  textFont(font);
  textSize(random(20, 33)); // randomizes the size of the text
  text(" MITSUBISHI", 0, 0); // writes MITSUBISHI in plain font
}

//Custom function which creates the basic diamond shape of the Mitsubishi logo
void diamond() {
  beginShape(QUAD);
  vertex(0, -120);//top vertex
  vertex(-30, -60); // left vertex
  vertex(0, 0); //bottom vertex
  vertex(30, -60); //right vertex
  endShape();
}



