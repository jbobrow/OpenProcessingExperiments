
int leaves = 0;  // here is a variable whole number called 'leaves'
int leafMax = 200; // here is a variable whole number for the maximum number of leaves. It starts at 200.

void setup(){ // run once
  size(600,600); // make the screen 600 pixels square
  smooth(); // smooth the lines
  background(242,239,215,100); // make the background a very pale brown
  stroke(200); // make the lines pale grey
  strokeWeight(0.5); // make the lines thin
  frameRate (300); // increase the frame rate - make it draw as fast as it can. I know, it probably won't be this fast.

}

void draw (){ // run repeatedly
  fill(random(100,150),random(200),random(40),200); // make the fill mostly red and green, and a bit translucent

  if (leaves < leafMax) { // if there are fewer than the maximum number of leaves, run the following code

    float cx = 300 + random(-145,145); // here's a variable that is within a range from 150 to 450
    float cy = 300 + random(-145,145); // here's a variable that is within a range from 150 to 450

    translate(cx,cy); // move the position of the drawing as far as cx across and cy down
    rotate(random(TWO_PI)); // rotate the drawing in a random direction
    scale(random(0.9,1.8)); // scale the drawing to an extent between 90% and 180%
    drawLeaf(); // draw a leaf!
    leaves++; // add one to the leaf count
  }

}


void drawLeaf(){ // draw a leaf as follows

  float pointShift = random(-20,20); // here is a variable between -20 and 20 
  beginShape(); // start to draw a shape
  vertex(20, 45); // begin at this point x, y
  // bezierVertex(30,30,60,40,70 + random(-20,20),50); // moving only the pointy point meant that sometimes the leaf shape would turn into a heart shape, because the control points were not also moving. So I created a variable called pointShift
    bezierVertex(30,30, 60 + pointShift,40 + pointShift/2, 70 + pointShift,50); // make the pointy end of the leaf vary on the x axis (so the leaf gets longer or shorter) AND vary the y axis of the control points by the same amount. It should be possible to have 'normal' leaves, very short fat ones and very long thin ones.
    bezierVertex(60 + pointShift,55, 30,65, 20,45); // draw the other half of the shape
  endShape();

}

void mousePressed(){ // on mouse-click, run the following code
  background(242,239,215,100); //reset the background to how it was
  leaves = 0; // reset the leaf counter to zero
  leafMax = 1 + mouseY/3; // I actually wanted to make it so that the closer you got to the midpoint of the screen, the more leaves you got. But the code is beyond me! So instead you get more leaves the further down the screen you click.


}



