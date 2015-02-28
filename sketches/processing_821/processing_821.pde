
//Programmed by Joshua McGrath
//NMD 102

//This is a modified version of Recursive Tree by Daniel Shiffman.
//http://www.processing.org/learning/topics/tree.html

//variable for ammount of rotation on the next box
float theta;

float rand;
void setup() {
  size(1200,800);
  smooth();
}

void draw() {

  //  float col = random(0,210);


  background(255);
  rectMode(CENTER);
  frameRate(30);

  //this vairable is mostly for teting and tweaking later on
  rand = random(0,600);

  //allow the movement of the mouse to control the animation of the fractal
  float a = (mouseY / (float) height) * 180f;

  //translate theta into radians so we can use it for rotation
  theta = radians(a);


  //start drawing at the center of the ground
  translate(width/2, height/2);
  //call the branch function
  branch(200);
}

void branch(float h) {

  //reduce the next segment by 2/3
  //note: I have tried changing this value but you can run into problems
  //with pushMatrix
  h *= 0.66;
  float col = 100;
  //fail color changing
  col = col - 1;

  //THIS IS VITAL, it is the exit statement for the recursive function
  //without it the program goes on forever and will not run properly or at all
  if (h > 4){
    pushMatrix();
    //call rotate function (processing native)
    rotate(theta);
    //the second value in this stroke command is the alpha, or transparency
    stroke(col,100);
    fill(255, 100);
    rect(0,0,h,h);
    //make the new box's origin at this position
    translate(0,h);
    //call the function again, making it recursive
    branch(h);
    popMatrix();

    pushMatrix();
    rotate(theta);
    stroke(col);
    fill(255, 100);
    rect(0,0,h,h);
    translate(0,-h);
    branch(h);
    popMatrix();
  }
}




