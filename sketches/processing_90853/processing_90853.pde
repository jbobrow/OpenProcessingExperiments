
// Recursive Tree code from D. Shiffman http://processing.org/learning/topics/tree.html

float theta;

void setup()
{
  size (650,450);
}

void draw()
{
  background (0);
  frameRate(30);
  
  //starfield
  pushMatrix();
  translate(50,40);
  scale(1.2);
  fill(random(250,255), random(200,255), random(240,255));
    ellipse(30,30,random(0,3),random(0,3));
    ellipse(350,150,random(0,3),random(0,3));
    ellipse(300,300,random(2,5), random(2,5));
    ellipse(100,100,random(2,5),random(2,5));
    ellipse(150,200,random(0,3),random(0,3));
    ellipse(400,40,random(0,3),random(0,3));
    ellipse(330,320,random(0,3),random(0,3));
    ellipse(405,35,random(1,4),random(1,4));
    ellipse(500,270,random(0,3),random(0,3));
    ellipse(610,250,random(0,3),random(0,3));
    ellipse(45,270,random(3,6),random(3,6));
  frameRate(30);
  popMatrix();

  //setup fractal
  stroke(255);
  //angle based on mouse interaction
  float a = (mouseX / (float) width) * 70f;
  //convert to radian
  theta = radians(a);
  //start tree from bottom of screen
  translate (width/2, height/2);
  //draw an axolotl
  stroke(255,192,203);
  strokeWeight(2.5);
  branch(180);
  fill(255);
  ellipse(0,0,200,120); //head
  fill(0);
  noStroke();
  //ellipse (-60,-10, 10,10); //eye l
  //ellipse (60,-10, 10,10); //eye r
  ellipse (mouseX/35 -75,mouseY/35 -15, 10,10); //moving eye l
  ellipse (mouseX/35 +60,mouseY/35 -15, 10,10); //moving eye r

  //smile
  stroke(255);
  pushMatrix();
  stroke(20,20,20,90);
  noFill();
  translate(0,10);
  arc(0,10,70,40, 0, PI);
  popMatrix();
  //start branching!
  
}

void branch(float h) {
  // Each branch will be 2/3rds the size of the previous one
  h *= 0.52;
  
  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (h > 2) {
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(theta);   // Rotate by theta
    line(0, 0, 0, -h);  // Draw the branch
    translate(0, -h); // Move to the end of the branch
    branch(h);       // Ok, now call myself to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
    
    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}
