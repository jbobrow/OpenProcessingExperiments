
/*With this composition I wanted to create a horizontal symetry all the while counter balamcing this symmetry
by inversing the colors of the composition.
Circles are generated on both sides of a new x-axis origin creating an "uncontrolled symmetry". These circles 
are generated when the vertical lines in the middle of the composition extend past a certain y value. Depending
on how far these lines extend, the circles are a certain size: the farther they extend, the larger the 
circles are.
In order to acheive the inbalance, I inverted the colors on each side. Thus the circles are a different color 
than the gradient beneath them as well as the lines that "generated" them. This creates a strong contrast and 
creates the inverse of what appears on the other side of the x-axis.*/


void setup() {
  size(500, 500);
}

void draw() {
}

void mousePressed() { //enables to reset the drawing and obtain a new composition for every mouse click

  background(235, 230, 212); //base neutral color helps mesh the two other more bold colors as an underlay

  translate(0, height/2); //reset origin in order to facilitate the vetical organization of the composition

  for (int z=0; z < 250; z+=25) { //generating a gradient with rectangles gradually becoming less transparent
    noStroke();
    fill(178, 79, 47, z); //using red/ocre color in order to create contrast with blue circles
    rect(0, z, 500, 25);
  }

  for (int y=0; y >= -250; y-=25) { //generating blue rectangle gradient in order to contrast with the ocre circles
    noStroke();
    fill(170, 216, 206, -y);
    rect(0, y, 500, 25);
  }
  
  //the opposing gradients helps create the inverse of either side


  for (int x=50; x < 450; x+=20) { //defining the variable which controls the spacing of the vertical lines
    float i=random(-150, 150); //this variable will be used to randomize the size of the lines which
    //fluctuate between -150 and 150 so that the lines extend beyond both sides of the x-axis
    strokeWeight(1.5);
    noStroke();
    fill(170, 216, 206); //this fill will apply to all the circles on the positive side of the newly defined x-axis 

    if (i >= 100 ) { //"if" command determines when the largest circles are generated: that is when one of the lines 
      //hits or crosses the y value for 100
      pushMatrix();
      translate(0, 100); //temporarily reset the origin in order to facilitate ordering of circles
      float j=random(80, 150); //sets a minimum and maximum diameter for the circles - their size remains random though
      ellipse(x, j, j, j); //placement of ellipse's x origin follows that of the vertical lines that go beyond 100 y-value mark
      popMatrix();
    }
    if (i >=50 && i < 100) { //smmaller circles are generated when the vertical lines cross the 50y-axis mark
      pushMatrix();
      translate(0, 50);
      float h=random(40, 90); //variable determines smaller diameter for these circles
      ellipse(x, h, h, h);
      popMatrix();
    }  

    fill(178, 79, 47); //sets the fill color for the following ellipses to ocre
    if (i <= -100 ) { //same principle for creation of ellipses on positive side of x axis except that the values are negative now
      pushMatrix();
      translate(0, -100);
      float l=random(80, 150);
      ellipse(x, -l, -l, -l);
      popMatrix();
    }

    if (i <=-50 && i > -100) {
      pushMatrix();
      translate(0, -50);
      float m=random(40, 90);
      ellipse(x, -m, -m, -m);
      popMatrix();
    }  

    if (i >= 0) { //distinguishes vetical lines which are "positive" from ones that are negative by
      //coloring them ocre - which helps counterbalance the composition  
      stroke(178, 79, 47);
    }
    if (i <=0) {
      stroke(170, 216, 206);
    }

    line(x, random(-50, 50), x, i); //these are the vertical lines - y origin is random on a certain
       //interval and length is defined by i
       //placed last so that they overlap the ellipses and are not completely overshadowed
  }
}


