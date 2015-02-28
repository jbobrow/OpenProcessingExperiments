
import processing.opengl.*; //import to enable 3d needed for mirroring
void setup() {
  smooth();
  size(400,400,OPENGL);
  frameRate(24);
  noStroke();
  drawLogo();
}

void draw() {
  // Update the design every 240 frames (approx. 10s)
  if (frameCount % 240 == 0) {
    drawLogo();
  } 
  else if (frameCount % 240 > 200) {
    // Fade out the current logo a little bit
    // by drawing a non-opaque black rectangle
    // over it... doing this over a number of
    // frames will fade out the logo completely
    noStroke();
    fill(0, 32);
    rect(0, 0, width, height);
  }
}


void drawLogo() {
  // Using code Rob posted in the Peep forums; generate randomated
  //triangles of random colours within a square area.
  int s1 = 100;
  int s2 = 100;
  int s3 = 200;
  int s4 = 200;
  rect(s1, s2, s3, s4);

  // Draw 200 triangles inside the bounding rectangle
  for (int i = 0; i < 200; i++) {
    // Use random() to define a points
    float p1 = random(s1 + 1, s1 + s3 - 1);
    float p2 = random(s2 + 1, s2 + s4 - 1);
    float p3 = random(s1 + 1, s1 + s3 - 1);
    float p4 = random(s2 + 1, s2 + s4 - 1);
    float p5 = random(s1 + 1, s1 + s3 - 1);
    float p6 = random(s2 + 1, s2 + s4 - 1);
    float p7 = random(s1 + 1, s1 + s3 - 1);
    float p8 = random(s2 + 1, s2 + s4 - 1);
    float p9 = random(s1 + 1, s1 + s3 - 1);
    float p10 = random(s2 + 1, s2 + s4 - 1);
    fill(p1,p2,p3); //give triangles random fills
    triangle(p1, p2, p3, p4, p5, p6);

  }

  PImage a = get(100,100,200,200); //get area and save as PImage
  //to you as the texture for the pattern.
  fill(0); // create black rectangle to mask random shapes
  rect(0,0,400,400);

  translate(200,100); //translate to a cental position
  //calculated after the rest of the code was completed
  noFill();
  background(0);
  noStroke();

  float r1 = radians(180); //create angles to be used throughout code
  //in degrees because radians generally confuse me.
  //The values were obtained through both calculation and visually
  //through trial and error to get the exact look i was after
  float r2 = radians(300);
  float r3 = radians(60);
  float r4 = radians(224.9);

  //stage 1 - set up the first equalateral triangle

  pushMatrix(); //save state as it is, i will need to switch between
  //matrices a lot throughout the code.
  translate(0,-1);
  beginShape(); //create a right-angled triangle with random 
  //texture previously obtained applied to it
  texture(a);
  vertex(0, 0, 10, 100);
  vertex(0, 29, width, height);
  vertex(-50, 30, 0, height);
  endShape();
  rotateY(r1); //mirror this triangle along its Y axis with another
  //the same.
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();

  popMatrix(); //return to previous matrix
  pushMatrix();

  rotateX(r1); //repeat above code to get the other 2/3s of an equalateral 
  //triangle. (next 2 paragraphs).
  rotate(r2);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();
  rotateY(r1);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();

  popMatrix();
  pushMatrix();

  rotateX(r1);
  rotate(r3);
  translate(0,0);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();
  rotateY(r1);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();

  popMatrix();

  //stage 2 the above code is now taken and repeated on different
  //angles to create another equalateral triangle reflected
  //below. (code is the same but translated and rotated approprately
  //until 'stage 3')


  translate(0,56);
  rotateX(r1);
  pushMatrix();
  translate(0,-1);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();
  rotateY(r1);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();

  popMatrix();
  pushMatrix();

  rotateX(r1);
  rotate(r2);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();
  rotateY(r1);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();

  popMatrix();
  pushMatrix();

  rotateX(r1);
  rotate(r3);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();
  rotateY(r1);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();
  popMatrix();


  //stage 3
//In this section the two above 'stages' now forming a diamond shape are taken and
//translated and rotated so that they create two more sections of
//the final larger triangular form.

  rotateY(r1);
  translate(49,-85); //these values may seem stange but they are
  //like this as they are building from the previous matix.
  pushMatrix();
  translate(0,-1);
  beginShape();
  texture(a);
  vertex(0, 0, 10, 100);
  vertex(0, 29, width, height);
  vertex(-50, 30, 0, height);
  endShape();
  rotateY(r1);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();

  popMatrix();
  pushMatrix();

  rotateX(r1);
  rotate(r2);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();
  rotateY(r1);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();

  popMatrix();
  pushMatrix();

  rotateX(r1);
  rotate(r3);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();
  rotateY(r1);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();

  popMatrix();




  translate(0,56);
  rotateX(r1);
  pushMatrix();
  translate(0,-1);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();
  rotateY(r1);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();

  popMatrix();
  pushMatrix();

  rotateX(r1);
  rotate(r2);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();
  rotateY(r1);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();

  popMatrix();
  pushMatrix();

  rotateX(r1);
  rotate(r3);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();
  rotateY(r1);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();
  popMatrix();

  //stage 4
  //Once again the diamond shape is taken and shifted to a new location
  //the code to this point still remains the same, simply shifted around
  //this will help create the kaleidoscope effect.

  rotateY(r1);
  translate(98,0);
  pushMatrix();
  translate(0,-1);
  beginShape();
  texture(a);
  vertex(0, 0, 10, 100);
  vertex(0, 29, width, height);
  vertex(-50, 30, 0, height);
  endShape();
  rotateY(r1);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();

  popMatrix();
  pushMatrix();

  rotateX(r1);
  rotate(r2);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();
  rotateY(r1);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();

  popMatrix();
  pushMatrix();

  rotateX(r1);
  rotate(r3);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();
  rotateY(r1);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();

  popMatrix();




  translate(0,55);
  rotateX(r1);
  pushMatrix();
  translate(0,-1);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();
  rotateY(r1);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();

  popMatrix();
  pushMatrix();

  rotateX(r1);
  rotate(r2);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();
  rotateY(r1);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();

  popMatrix();
  pushMatrix();

  rotateX(r1);
  rotate(r3);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();
  rotateY(r1);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();
  popMatrix();

  //stage 5
  //one more triangle is added using 'stage 1's code so fill the gap
  //in the bottom middle.
  rotateX(r1);
  translate(-49,28);
  pushMatrix();
  translate(0,-1);
  beginShape();
  texture(a);
  vertex(0, 0, 10, 100);
  vertex(0, 29, width, height);
  vertex(-50, 30, 0, height);
  endShape();
  rotateY(r1);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();

  popMatrix();
  pushMatrix();

  rotateX(r1);
  rotate(r2);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();
  rotateY(r1);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();

  popMatrix();
  pushMatrix();

  rotateX(r1);
  rotate(r3);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();
  rotateY(r1);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();
  popMatrix();

  // stage 6
  //'Stage 1's code is used again to fill the gap at the bottom
  //left hand side.
  translate(97,-0.5);
  pushMatrix();
  translate(0,-1);
  beginShape();
  texture(a);
  vertex(0, 0, 10, 100);
  vertex(0, 29, width, height);
  vertex(-50, 30, 0, height);
  endShape();
  rotateY(r1);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();

  popMatrix();
  pushMatrix();

  rotateX(r1);
  rotate(r2);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();
  rotateY(r1);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();

  popMatrix();
  pushMatrix();

  rotateX(r1);
  rotate(r3);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();
  rotateY(r1);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();
  popMatrix();

  //stage 7
//'Stage 1's code is used again to fill the gap at the bottom
  //left right side.
  
  translate(-195,1.5); 
  pushMatrix();
  translate(0,-1);
  beginShape();
  texture(a);
  vertex(0, 0, 10, 100);
  vertex(0, 29, width, height);
  vertex(-50, 30, 0, height);
  endShape();
  rotateY(r1);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();

  popMatrix();
  pushMatrix();

  rotateX(r1);
  rotate(r2);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();
  rotateY(r1);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();

  popMatrix();
  pushMatrix();

  rotateX(r1);
  rotate(r3);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();
  rotateY(r1);
  beginShape();
  texture(a);
  vertex(0, 0, 0, 0);
  vertex(0, 29, width, height);
  vertex(-50, 29, 0, height);
  endShape();
  popMatrix();
 //All 9 equalateral-triangle segments are now completed out of 
  //54 right-angled tiangles of the same random texture.
  //this creates the kaleidoscope-like effect!

  stroke(255);
  translate(98,-56);
  strokeWeight(10);
  ellipse(0,0,50,50); //add in a circle as an abstract representation
  //of the 'eye.'
  fill(0);
  noStroke();
  rect(-150,83,300,300); //a rectangle mask neatens the bottom edge
 //Finished!!
}





