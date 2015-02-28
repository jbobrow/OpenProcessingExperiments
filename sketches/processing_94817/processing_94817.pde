
float amplitude = (PI)/2; //describes how high the pendulum will rotate around

 
void setup() {
  size(500, 400);// defines the size of the file
}
 
void draw() {
  background(0); //defines the background color
  //the eyes
  fill(210); //defines the color of the grey eyes
  ellipse(150, 200, 180, 100); //draw the left eye
  ellipse(380, 200, 180, 100); //draw the right eye
  
 //left eye
  float leftXpos = constrain(map( mouseX, 0, 500, 120, 250), 120, 380); //makes a constrain on how the inner eyes will move
  float leftYpos = constrain(map( mouseY, 0, 500, 180, 220), 180, 220); //makes a constrain on how the inner eyes will move
  //outer eye
  fill(125, 60, 24); //defines the color of the outer left eye
  ellipse(leftXpos, leftYpos, 45, 45); //draws the outer left eye
  //inner eye
  fill(0); //defines the color of the inner left eye
  ellipse(leftXpos, leftYpos, 30, 30); //draws the inner left eye
  
   //right eye
  float rightXpos = constrain(map( mouseX, 0, 500, 350, 450), 350, 450); //makes a constrain on how the inner eyes will move
  float rightYpos = constrain(map( mouseY, 0, 500, 180, 220), 180, 220); //makes a constrain on how the inner eyes will move
  //outer eye
  fill(125, 60, 24); //defines the color of the outer right eye
  ellipse(rightXpos, rightYpos, 45, 45); //draws the outer right eye
  //inner eye
  fill(25); //defines the color of the inner right eye
  ellipse(rightXpos, rightYpos, 30, 30); //draws the inner right eye

  //the pendulum
  float around = (amplitude*cos(millis()/350.0)); //defines the amplitude the pendulum will rotate in
  translate(width/2, 0); //defines how far the pendulum rotates
  rotate(around); //rotates the pendulum by the variable around
  stroke(255); //defines the stroke of the line
  line(0, 0, 0, 200); //draws the line
  fill(120, 201, 155); //defines the color of the circle
  noStroke(); //makes it have no stroke
  ellipse(0, 200, 70, 80); //draws the circle
  
  //this makes the eyes appear to "blink"
  if (mousePressed) {
    background(0); //makes the background to 0
  }

}



