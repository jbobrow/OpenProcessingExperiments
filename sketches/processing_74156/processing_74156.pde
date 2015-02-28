
//Homework 8

//Danielle Dong
//dmdong@andrew.cmu.edu
//copyright Danielle Dong, Carnegie Mellon University, Pittburgh, PA

//press and hold the mouse to pause the animation -- release the mouse to have it resume
//press any key to change the points the curve is based on

// notes + global variables
  // variable
    float bezier1x1= random (0, 400);
    float bezier1y1= random (0, 400);
    float bezier1x2= width;
    float bezier1y2= 0;
    float bezier2x1 = 0 ;  // move the x across the screen, but keep y random
    float bezier2y1= random (0, 400);
    float bezier2x2= 0;
    float bezier2y2= height;
    color whileColor = color(random(255), random(255), random(255));
    float keyChange = 50;





void setup ()  {
  size (400, 400);
  smooth ();
  frameRate (10);
  background (0,0,0);
  noFill();  
}





void draw ()  {
  whileCurve ();
}





void whileCurve ()  {
  //variables
    float deltaX = random (25,50); 
    float line1x1 = bezier1x1;
    float line1y1 = bezier1y1;
    float line1x2= bezier1x2;
    float line1y2= bezier1y2;
    float line2x1 = bezier2y1 ;  // move the x across the screen, but keep y random
    float line2y1 = bezier2y1; // if set to random here, makes lots of lines
    float line2x2= bezier2x2;
    float line2y2= bezier2y2;

  //while loop
  while (line2x1 < width)  {
    line2x1 = line2x1 + deltaX;
    line2y1 =  random (0, 400);
    whileColor = color(random(255), random(255), random(255));   
    //points bezier curve is based on
    stroke(255, 255, 255,40);
    strokeWeight (0);
    point (line1x1, line1y1);
    point (line1x2, line1y2);
    point (line2x1, line2y1);
    point (line2x2, line2y2);
    // bezier curve
    stroke(whileColor);
    strokeWeight (0);
    bezier (line1x1, line1y1, line1x2, line1y2, line2x1, line2y1, line2x2, line2y2);
  }
}





void keyPressed ()  {
    bezier1x1 = random (0, 400);
    bezier1y1 = random (0, 400);
    bezier2x1 = random (0, 400);
    bezier2y1= random (0, 400);
}

void mousePressed ()  {
  noLoop();
}

void mouseReleased ()  {
  loop();
}

