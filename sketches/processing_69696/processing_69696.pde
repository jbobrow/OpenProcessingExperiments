
int rad = 300; //set the size of the ball of yarn.

void setup() {
  size(800, 800);
  background(0); //keep the background in the setup since we want
  //the old lines to stay on screen.
}

void draw() {
  translate(width/2, height/2); //move the coordinate system origin to center-screen
  //(less positional calculation required).
  
  //let's have fun.

  if (mousePressed){ //add a touch of interaction.
    rad = 600; //draw yarn to a larger scale when mouse is pressed.
    stroke(255); //make yarn white.
  }
  else{
    rad = 300; //restore radius to its original value.
    stroke(random(255), random(255), random(255)); //give each string a different random color.
  }
  
  //fun is done.

  if (frameCount <= 720) { //keep the yarn ball from becoming too dense since a new
    //string is drawn each frame. there will be only 720 strings.
    float angle1 = random(PI * 2); //this will be a random point on the circumfrence each frame.
    float angle2 = random(PI * 2); //this will be a different random point on the circumfrence each frame.
    float x = sin(angle1) * rad; //sin and cosine of any angle never equal more than -1 or 1, so we
    //multiply by variable 'rad' to make everything bigger.
    float y = cos(angle1) * rad;
    float x2 = sin(angle2) * rad;
    float y2 = cos(angle2) * rad;
    line(x, y, x2, y2); //draw a line each frame with end points determined by the sin and cos
    //values of the angles at that frame.
  }
}


