
/*
//////////////////////////////
 Learning Processing by 
 Creating a "Character"
 
 Homework 2: Adding dynamis drawing functions
//////////////////////////////
 */

/* Setup function is used to define initial enviroment properties 
such as screen size and background color and to load media such as 
images and fonts as the program starts. */



void setup(){
  size(600, 600);
  //framerate(30);
}

/* The draw() function continuously executes the lines of code contained 
inside its block until the program is stopped or noLoop() is called. 
Draw() is called automatically and should never be called explicitly. */

void draw() {
  background(255);
  fill(3,3,3);
  /* Here we use the mouseX and mouseY to allow the "character" to move dynamically with the
  users mouse movements.  */
  ellipse(mouseX, mouseY, 600, 600);
  stroke(227,2,36);
  for (float i = 0; i < 1; i+=.01) {
    line(300*cos(i*2*PI)+300, 300*sin(i*2*PI)+300, 300-300*cos(i*2*PI), 300-300*sin(i*2*PI));
  }
  /* creating the  */
  stroke(mouseX/5);
  strokeWeight(mouseY/10);
  line(pmouseX, pmouseY, mouseX, mouseY);

}

void keyPressed() {
  //press the key and the current frame will be saved
  //check this screenshot in the sketch folder!
  saveFrame();
}


/*
//////////////////////////////
END
//////////////////////////////
 */




